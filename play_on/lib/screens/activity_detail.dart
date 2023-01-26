import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';
import 'find_players.dart';

// import 'h';
class ActivityDetail extends StatelessWidget {
  static String id = "/Activity Detail";

  const ActivityDetail({super.key});

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
        title: Column(
          children: [
            "Day, Date".text.make(),
            Row(
              children: [
                Expanded(child: "Start Time ".text.make()),
                "End Time".text.make(),
              ],
            ),
          ],
        ),
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
                child: "Join this".text.make(),
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
            //     tag: Key(catalog.id.toString()),
            //     child: Image.network(catalog.image).h32(context)),
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
                        "Sport",
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
                              leading: Icon(Icons.abc),
                              title: Text(
                                'No. of Players',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Further details if any'),
                            ),
                            TextButton(
                              child: const Text(
                                'See All Players',
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
                                'Cost Per Player: 1000',
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
                              leading: Icon(Icons.abc),
                              title: Text(
                                'Queries',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            "Acha hai na?".text.make(),
                            "Acha hi hai...na toh bolna hi mat".text.make(),
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
