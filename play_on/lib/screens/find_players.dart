// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:play_on/db%20Model/db_model.dart';
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
  String? _currentareaSelected ;

  @override
  void initState() {
    super.initState();
    print(widget.sportdetails);
    _currentsportSelected = widget.sportdetails[0];
    _currentareaSelected = widget.details[4];
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
          print(playeract);
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Find Players"),
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
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                padding: EdgeInsets.all(20),
                child: ListView.separated(
                  itemCount: playeract.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Row(children: [
                                  Text(
                                    'Creator:${playeract[index].name.toString()}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                      'sport:${playeract[index].sport.toString()}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ]),
                              ),
                              Row(
                                children: [
                                  Text(
                                      'Player Count:${playeract[index].tplayer.toString()}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Text(
                                      'Cost:${playeract[index].cost.toString()}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              Text(
                                  'location:${playeract[index].area.toString()}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Padding(padding: EdgeInsets.all(10))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 10,
                      thickness: 4,
                    );
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
