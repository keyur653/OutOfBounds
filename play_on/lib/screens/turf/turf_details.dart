import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'find_players.dart';
class TurfDetail extends StatefulWidget {
  static String id = "/Turf Detail";

  TurfDetail({super.key});

  @override
  State<TurfDetail> createState() => _TurfDetailState();
}

class _TurfDetailState extends State<TurfDetail> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // var index;
    // var arrCard;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 77, 3),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: Column(
        //   children: [
        //     "Day, Date".text.make(),
        //     Row(
        //       children: [
        //         Expanded(child: "Start Time ".text.make()),
        //         "End Time".text.make(),
        //       ],
        //     ),
        //   ],
        // ),
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 0, 77, 3),
        child: Row(
          children: [
            // Expanded(
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ButtonStyle(
            //         backgroundColor: MaterialStatePropertyAll(Colors.green)),
            //     child: "Send Query".text.make(),
            //   ).p8(),
            // ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                child: "Book this".text.make(),
              ).p8(),
            ),
            // 150.widthBox,
          ],
        ).p8(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Hero(
            //     tag: Image.asset(
            //       'assets/usf.jpg',
            //       fit: BoxFit.fill,
            //     ),
            //     child: Image.asset(
            //       'assets/usf.jpg',
            //       fit: BoxFit.fill,
            //     )),
            SizedBox(
              height: 200, // card height
              child: PageView.builder(
                itemCount: 10,
                controller: PageController(viewportFraction: 0.7),
                onPageChanged: (int index) => setState(() => _index = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Image ${i + 1}",
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
                child: VxArc(
              height: 15.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.BOTTOM,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "All Sports",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      Card(
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text(
                                'Location',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle:
                                  Text('Further details of the location.'),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.reviews_sharp),
                              title: Text(
                                'Ratings',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Average Rating : *****'),
                            ),
                            TextButton(
                              child: const Text(
                                'See All Reviews',
                                style: TextStyle(color: Colors.green),
                              ),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.money_outlined),
                              title: Text(
                                'Cost Per Hour: 1000',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.question_answer_outlined),
                              title: Text(
                                'Queries',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            "Activity detail jaisa same hi bana diya"
                                .text
                                .make(),
                            "Alag karke matlab nai tha".text.make(),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: "See all Queries".text.make(),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.green)),
                                  ).p8(),
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: "Send Query".text.make(),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.green)),
                                  ).p8(),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ],
                  ).py64(),
                ),
              ),
            ).color(Color.fromARGB(255, 0, 77, 3))),
          ],
        ),
      ),
    );
    ;
  }
}
