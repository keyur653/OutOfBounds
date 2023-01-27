// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:play_on/controller/user_data.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:play_on/screens/findplayer/acticity_detail.dart';
import 'package:velocity_x/velocity_x.dart';

class MyActivity extends StatefulWidget {
  final List<String> details;
  final List sportdetails;
  const MyActivity({
    Key? key,
    required this.details,
    required this.sportdetails,
  }) : super(key: key);
  @override
  State<MyActivity> createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  DatabaseReference obj = DatabaseReference();
  List<FindPlayer> playeract = [];

  final area = ['Borivali', 'Dadar', 'Bandra', 'Andheri'];

  @override
  void initState() {
    super.initState();
    print(widget.sportdetails);
    _getPlayer();
  }

  void _clearItem() {
    setState(() {
      playeract.clear();
    });
  }

  void _getPlayer() {
    _clearItem();
    var ref = obj.getPlayer("myactivity", loggedInUser.email!);
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Activity"),
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(0, 77, 77, 10.0),
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
                                  Text("01",
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
