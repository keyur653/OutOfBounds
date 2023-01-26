// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:velocity_x/velocity_x.dart';

import 'find_players.dart';

// import 'h';
class ActivityDetail extends StatefulWidget {
  static String id = "/Activity Detail";
  final FindPlayer playeract;

  const ActivityDetail({
    Key? key,
    required this.playeract,
  }) : super(key: key);

  @override
  State<ActivityDetail> createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  @override
  Widget build(BuildContext context) {
    // var index;
    // var arrCard;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 77, 77, 10.0),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            widget.playeract.date!.text.make(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.playeract.time!.substring(0, 5).text.make(),
                "To".text.make(),
                widget.playeract.time!.substring(8).text.make(),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: Color.fromRGBO(0, 77, 77, 10.0),
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
                        widget.playeract.sport!,
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
                            ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text(
                                "${widget.playeract.area!}",
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
                            ListTile(
                              leading: Icon(Icons.abc),
                              title: Text(
                                "Total Number of Player: ${widget.playeract.tplayer!}",
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
                            ListTile(
                              leading: Icon(Icons.money_outlined),
                              title: Text(
                                'Cost Per Player: ${widget.playeract.cost!}',
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
            ).color(Color.fromRGBO(0, 77, 77, 10.0))),
          ],
        ),
      ),
    );
    ;
  }
}
