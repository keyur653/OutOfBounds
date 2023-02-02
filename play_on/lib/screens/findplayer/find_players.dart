// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:play_on/screens/findplayer/acticity_detail.dart';
import 'package:velocity_x/velocity_x.dart';

class FindPlayerpage extends StatefulWidget {
  final List<String> details;
  final List sportdetails;
  const FindPlayerpage({
    Key? key,
    required this.details,
    required this.sportdetails,
  }) : super(key: key);
  @override
  State<FindPlayerpage> createState() => _FindPlayerpageState();
}

class _FindPlayerpageState extends State<FindPlayerpage> {
  DatabaseReference obj = DatabaseReference();
  List<FindPlayer> playeract = [];

  final area = ['Borivali', 'Dadar', 'Bandra', 'Andheri'];
  String? _currentsportSelected = "";
  String? _currentareaSelected;

  @override
  void initState() {
    super.initState();
    print(widget.sportdetails);
    _currentsportSelected = widget.sportdetails[0];
    _currentareaSelected = widget.details[4];
    _getPlayer();
  }

  void _clearItem() {
    setState(() {
      playeract.clear();
    });
  }

  void _getPlayer() {
    _clearItem();
    var ref = obj.getPlayer(_currentareaSelected!, _currentsportSelected!);
    print(ref);
    ref.snapshots().listen((event) {
      setState(() {
        for (var i = 0; i < event.docs.length; i++) {
          playeract.add(FindPlayer.fromSnapshot(event.docs[i]));
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Find Player"),
        elevation: 0.0,
        backgroundColor: Colors.green,
        leading: TextButton(
            onPressed: (() {}),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.green,
            )),
      ),
      body: RefreshIndicator(
        onRefresh: (() async {
          setState(() {
            _getPlayer();
          });
        }),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Container(
                width: 200,
                height: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Location",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                  ),
                  const SizedBox(
                    height: 50,
                    width: 50,
                  ),
                  DropdownButton<String>(
                    items: area.map((dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
                    // onChanged: ((value) {

                    // }),
                    onChanged: (String? newValSelected) {
                      setState(() {
                        _currentareaSelected = newValSelected;
                        _getPlayer();
                      });
                    },
                    value: _currentareaSelected,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Sports",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                  ),
                  const SizedBox(
                    height: 50,
                    width: 50,
                  ),
                  DropdownButton<String>(
                    items: (widget.sportdetails).map((dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValueSelected) {
                      setState(() {
                        _currentsportSelected = newValueSelected;
                        _getPlayer();
                      });
                    },
                    value: _currentsportSelected,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: ListView.separated(
                  itemCount: playeract.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color(0xfff5f5f5),
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ActivityDetail(
                                      playeract: playeract[index],
                                      details: widget.details,
                                    )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: const Color(0xff476cfb),
                                      child: ClipOval(
                                        child: SizedBox(
                                          width: 40.0,
                                          height: 40.0,
                                          child: (playeract[index].profileurl ==
                                                  "hi")
                                              ? Image.asset(
                                                  'assets/noimage.png',
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.network(
                                                  playeract[index].profileurl!),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${playeract[index].name.toString()}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ).py(8),
                                    SizedBox(width: 20),
                                    Text('Warming Up',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ]).pOnly(right: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Player Count:${playeract[index].tplayer.toString()}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))
                                      .pOnly(top: 10),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //         '${playeract[index].cost.toString()}',
                                  //         style: TextStyle(
                                  //             fontSize: 15,
                                  //             fontWeight: FontWeight.bold)),
                                  //     Icon(
                                  //       Icons.currency_rupee_rounded,
                                  //       color: Colors.green,
                                  //     )
                                  //   ],
                                  // ).py(8),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_rounded),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                          "${playeract[index].date.toString()}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ).py(8),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(
                                          '${playeract[index].area.toString()}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(10))
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.save),
                                  Row(
                                    children: [
                                      Text(
                                          '${playeract[index].cost.toString()}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Icon(
                                        Icons.currency_rupee_rounded,
                                        color: Colors.green,
                                      )
                                    ],
                                  ).py(8),
                                  Text("${playeract[index].pcount}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text("Going",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Padding(padding: EdgeInsets.all(10))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
