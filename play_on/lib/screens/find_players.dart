import 'package:flutter/material.dart';


class FindPlayer extends StatefulWidget {
  @override
  State<FindPlayer> createState() => _FindPlayerState();
}

class _FindPlayerState extends State<FindPlayer> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _sport = [
    'Cricket',
    'Football',
    'Badminton',
    'Basketball',
    'Table tennis',
    'Volleyball',
    'kabaddi',
    'carrom'
  ];

  String? _currentItemSelected = 'Cricket';

  var arrCard = [
    {'name': 'NIK','sports':'Football','players':10,'location':'Borivali','Cost':0},
    {'name': 'Akshay','sports':'Kabaddi','players':7,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
    {'name': 'keyur','sports':'Cricket','players':11,'location':'Borivali','Cost':100},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Find Players"),
      ),
      body: Column(
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
                  items: _sport.map((String dropDownStringItem) {
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
                      _currentItemSelected = newValueSelected;
                    });
                  },
                  value: _currentItemSelected,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView.separated(itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        
                      },
                      child: Column(
                        
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 30
                            ),
                            child: Row(
                              children: [
                                Text('Creator:${arrCard[index]['name'].toString()}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                SizedBox(width: 60),
                                Text('sport:${arrCard[index]['sports'].toString()}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                              ]),
                          ),
                          Row(
                            children: [
                              Text('Player Count:${arrCard[index]['players'].toString()}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                              SizedBox(width: 80,),
                              Text('Cost:${arrCard[index]['Cost'].toString()}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
                            ],
                          ),
                          Text('location:${arrCard[index]['location'].toString()}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                          Padding(padding: EdgeInsets.all(10))
                        ],
                      ),
                    ),
                  ),
                );
              }, separatorBuilder: (context, index) {
                return Divider(height: 10,thickness: 4,);
              }, itemCount: arrCard.length,shrinkWrap: true,scrollDirection: Axis.vertical,),
            ),
          )
        ],
      ),
    );
  }
}
