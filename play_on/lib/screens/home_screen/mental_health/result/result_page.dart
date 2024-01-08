// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:play_on/screens/home_screen/mental_health/result/details.dart';
import 'package:play_on/screens/login/sport_list.dart';
import 'package:play_on/widget/bottom_navigation.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ResultsPage extends StatefulWidget {
  final List<String> m;

  const ResultsPage({super.key, required this.m});
  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  List<Map<String, dynamic>> illnessData = [];
  late double s;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    s = double.parse(widget.m[10]);
    illnessData = [
      {'name': 'Somatization', 'percentage': widget.m[0].toString()},
      {'name': 'OCD', 'percentage': widget.m[1].toString()},
      {
        'name': 'Interpersonal Sensitivity',
        'percentage': widget.m[2].toString()
      },
      {'name': 'Depression', 'percentage': widget.m[3].toString()},
      {'name': 'Anxiety', 'percentage': widget.m[4].toString()},
      {'name': 'Hostility', 'percentage': widget.m[5].toString()},
      {'name': 'Phobic Anxiety', 'percentage': widget.m[6].toString()},
      {'name': 'Paranoid Ideation', 'percentage': widget.m[7].toString()},
      {'name': 'Psychoticism', 'percentage': widget.m[8].toString()},
    ];
  }

  Widget buildIllnessIndicators(String name, double percentage, int index) {
    return Column(
      children: [
        SleekCircularSlider(
            appearance: CircularSliderAppearance(
              size: name == "Overall" ? 125 : 100.0,
              startAngle: 180,
              angleRange: 180,
              customColors: CustomSliderColors(
                progressBarColors: [
                  Colors.blue,
                  Colors.blue
                ], // Set the same color for both
              ),
              customWidths: CustomSliderWidths(
                trackWidth: 10.0,
                progressBarWidth: 8.0,
              ),
            ),
            min: 0,
            max: 100,
            initialValue: percentage,
            innerWidget: (percentage) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        '${percentage.toStringAsFixed(1)}%',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        name,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )
                    ])),
        if (name != 'Overall')
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        index: index,
                      ),
                    ));
              },
              child: const Text("Details")),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  List<Widget> createList() {
    final List<Widget> rows = [];
    rows.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIllnessIndicators('Overall', s, 0),
      ],
    ));
    for (int i = 0; i < 9; i += 3) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIllnessIndicators('${illnessData[i]['name']}',
              double.parse(illnessData[i]['percentage']), i),
          buildIllnessIndicators('${illnessData[i + 1]['name']}',
              double.parse(illnessData[i + 1]['percentage']), i + 1),
          buildIllnessIndicators('${illnessData[i + 2]['name']}',
              double.parse(illnessData[i + 2]['percentage']), i + 2)
        ],
      ));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assessment Results',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF6BB9F0), // Customize the app bar color
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple,
                Colors.lightBlue,
              ], // Customize the gradient colors
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 15.0),
                Column(
                  children: createList(),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserBottomNav(details: detaillist, sportdetails: sportDetailList),
                          ));
                    },
                    child: const Text("Go to Home Page"))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
