// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
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
  TextEditingController _controllemial = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future updateQuery() async {
    FirebaseFirestore.instance
        .collection('User')
        .doc(widget.playeract.area)
        .collection(widget.playeract.sport!)
        .doc(widget.playeract.email)
        .set({});
  }

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
                            // ListView.separated(
                            //     itemBuilder: ((context, index) {
                            //       return ListTile(
                            //         leading: "Q.".text.make(),
                            //         title: widget.playeract.queries![index].text
                            //             .make(),
                            //         subtitle: Row(
                            //           children: [
                            //             CircleAvatar(
                            //               radius: 20,
                            //               backgroundColor:
                            //                   const Color(0xff476cfb),
                            //               child: ClipOval(
                            //                 child: SizedBox(
                            //                   width: 40.0,
                            //                   height: 40.0,
                            //                   child: (widget.playeract
                            //                               .profileurl ==
                            //                           "hi")
                            //                       ? Image.asset(
                            //                           'assets/noimage.png',
                            //                           fit: BoxFit.fill,
                            //                         )
                            //                       : Image.network(widget
                            //                           .playeract.profileurl!),
                            //                 ),
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               width: 5,
                            //             ),
                            //             widget.playeract.qsender![index].text
                            //                 .make()
                            //           ],
                            //         ),
                            //       );
                            //     }),
                            //     separatorBuilder: (context, index) {
                            //       return Divider();
                            //     },
                            //     itemCount: widget.playeract.queries!.length),
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
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildPopupDialog(context),
                                      );
                                    },
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
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Your Query'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTextField("Query", "Enter your query", _controllemial,
              TextInputType.name, () {})
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green)),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Send Query'),
        ),
      ],
    );
  }

  Widget buildTextField(
      String labelText,
      String placeholder,
      TextEditingController controll,
      TextInputType keyboard,
      void Function() ontap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controll,
        onTap: ontap,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            // borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2.0),
            // borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }
}
