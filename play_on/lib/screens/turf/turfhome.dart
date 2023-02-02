// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:play_on/screens/turf/turfdetails.dart';
import 'package:velocity_x/velocity_x.dart';

class FindTurf extends StatefulWidget {
  static const String id = '/turfhome';
  @override
  State<FindTurf> createState() => _FindTurfState();
}

class _FindTurfState extends State<FindTurf> {
  final area = ['Borivali', 'Dadar', 'Bandra', 'Andheri'];
  final sports = ['Cricket', 'Football', 'Baketball', 'Volleyball'];
  String? _currentsportSelected = "Cricket";
  String? _currentareaSelected = "Borivali";

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Find Turf"),
          elevation: 0.0,
          backgroundColor: const Color.fromRGBO(0, 77, 77, 10.0),
          leading: TextButton(
              onPressed: (() {}),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.green,
              )),
        ),
        body: RefreshIndicator(
          onRefresh: (() async {}),
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
                      items: sports.map((dropDownStringItem) {
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
                        });
                      },
                      value: _currentsportSelected,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: ListView.separated(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color(0xfff5f5f5),
                        borderOnForeground: true,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => TurfDetail()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.asset(
                                        'assets/usf.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'USF TURF',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ).py(10),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text("5.0",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ).py(8),
                                    ]).pOnly(right: 12),
                                Column(children: [
                                  Row(
                                    children: const [
                                      Icon(Icons.location_on_outlined),
                                      Text('Borivali',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(10)),
                                  Row(
                                    children: [
                                      Icon(Icons.sports_soccer_outlined),
                                      Icon(Icons.sports_cricket_outlined),
                                    ],
                                  )
                                ]),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
