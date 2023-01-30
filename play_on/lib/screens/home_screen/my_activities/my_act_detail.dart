// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:play_on/controller/user_data.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:play_on/screens/create_activity/create.dart';
import 'package:play_on/screens/findplayer/see_all_players.dart';
import 'package:play_on/screens/findplayer/see_all_queries.dart';
import 'package:play_on/screens/home_screen/group/pages/chat_page.dart';
import 'package:play_on/screens/profile/profile_screen.dart';
import 'package:play_on/widget/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'h';
class MyActivityDetail extends StatefulWidget {
  static String id = "/Activity Detail";
  final List<String> details;
  final FindPlayer playeract;

  const MyActivityDetail({
    Key? key,
    required this.details,
    required this.playeract,
  }) : super(key: key);

  @override
  State<MyActivityDetail> createState() => _MyActivityDetailState();
}

class _MyActivityDetailState extends State<MyActivityDetail> {
  TextEditingController _controllanswer = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void setanswer(int index) {
    widget.playeract.qanswer[index] = _controllanswer.text;
    print(widget.playeract.qanswer[index]);
    print(widget.playeract.qanswer);
    print("hii");
    print('object');
  }

  Future updateAnswer() async {
    FirebaseFirestore.instance
        .collection('User')
        .doc(widget.playeract.area)
        .collection(widget.playeract.sport!)
        .doc(widget.playeract.email)
        .update({
      'QAnswers': widget.playeract.qanswer,
    });

    FirebaseFirestore.instance
        .collection('User')
        .doc("myactivity")
        .collection("${loggedInUser.email}")
        .doc("${widget.playeract.activities}${widget.playeract.area}")
        .update({
      'QAnswers': widget.playeract.qanswer,
    });
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
                onPressed: () {
                  nextScreen(
                      context,
                      ChatPage(
                        groupId: widget.playeract.sgroup!,
                        groupName: widget.playeract.sport!,
                        userName: widget.details[0],
                      ));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                child: "Game Chat".text.make(),
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => AllPlayers(
                                            playeract: widget.playeract))));
                              },
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
                            ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        leading: "Q.".text.make(),
                                        title: Text(
                                            "${widget.playeract.queries[index]}"),
                                        trailing: SizedBox(
                                          height: 50,
                                          width: 100,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                useSafeArea: true,
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    _buildPopupDialog(
                                                        context,
                                                        "${widget.playeract.queries[index]}",
                                                        index),
                                              );
                                            },
                                            child: (widget.playeract
                                                        .qanswer[index] ==
                                                    null)
                                                ? "Reply".text.make()
                                                : "Edit".text.make(),
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.green)),
                                          ).p8(),
                                        ),
                                        subtitle: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  const Color(0xff476cfb),
                                              child: ClipOval(
                                                child: SizedBox(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  child: (widget.playeract
                                                                  .senderurl[
                                                              index] ==
                                                          "hi")
                                                      ? Image.asset(
                                                          'assets/noimage.png',
                                                          fit: BoxFit.fill,
                                                        )
                                                      : Image.network(widget
                                                          .playeract
                                                          .senderurl[index]),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                "${widget.playeract.qsender[index]}")
                                          ],
                                        ),
                                      ),
                                      (widget.playeract.qanswer[index] != null)
                                          ? ListTile(
                                              leading: "A.".text.make(),
                                              title: Text(
                                                  "${widget.playeract.qanswer[index]}"),
                                            )
                                          : SizedBox(
                                              height: 0,
                                            )
                                    ],
                                  );
                                }),
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                                itemCount: (widget.playeract.queries.length < 3)
                                    ? widget.playeract.queries.length
                                    : 3),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) => AllQueries(
                                                  playeract:
                                                      widget.playeract))));
                                    },
                                    child: "See all Queries".text.make(),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.green)),
                                  ).p8(),
                                ),
                                // Expanded(
                                //   child: ElevatedButton(
                                //     onPressed: () {
                                //       showDialog(
                                //         useSafeArea: true,
                                //         context: context,
                                //         builder: (BuildContext context) =>
                                //             _buildPopupDialog(context),
                                //       );
                                //     },
                                //     child: "Send Query".text.make(),
                                //     style: ButtonStyle(
                                //         backgroundColor:
                                //             MaterialStatePropertyAll(
                                //                 Colors.green)),
                                //   ).p8(),
                                // ),
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

  Widget _buildPopupDialog(BuildContext context, String query, int index) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 20, left: 20, right: 20),
      title: const Text('Reply this Query'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(query),
          buildTextField("Reply", "Type Your Messege Here", _controllanswer,
                  TextInputType.name, () {})
              .pOnly(top: 20)
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green)),
          onPressed: () {
            setState(() {});
            setanswer(index);
            updateAnswer();
            Navigator.pop(context);
          },
          child: (widget.playeract.qanswer[index] == null)
              ? Text("Reply")
              : Text("Edit"),
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
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controll,
        onTap: ontap,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
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

// Column(
//                                     children: [
//                                       ListTile(
//                                         leading: "Q.".text.make(),
//                                         title: Text(
//                                             "${widget.playeract.queries[index]}"),
//                                         trailing: ElevatedButton(
//                                           onPressed: () {
//                                             showDialog(
//                                               useSafeArea: true,
//                                               context: context,
//                                               builder: (BuildContext context) =>
//                                                   _buildPopupDialog(
//                                                       context,
//                                                       "${widget.playeract.queries[index]}",
//                                                       index),
//                                             );
//                                           },
//                                           child: (widget.playeract
//                                                       .qanswer[index] ==
//                                                   null)
//                                               ? "Reply".text.make()
//                                               : "Edit".text.make(),
//                                           style: ButtonStyle(
//                                               backgroundColor:
//                                                   MaterialStatePropertyAll(
//                                                       Colors.green)),
//                                         ).p8(),
//                                         subtitle: Row(
//                                           children: [
//                                             CircleAvatar(
//                                               radius: 15,
//                                               backgroundColor:
//                                                   const Color(0xff476cfb),
//                                               child: ClipOval(
//                                                 child: SizedBox(
//                                                   width: 30.0,
//                                                   height: 30.0,
//                                                   child: (widget.playeract
//                                                                   .senderurl[
//                                                               index] ==
//                                                           "hi")
//                                                       ? Image.asset(
//                                                           'assets/noimage.png',
//                                                           fit: BoxFit.fill,
//                                                         )
//                                                       : Image.network(widget
//                                                           .playeract
//                                                           .senderurl[index]),
//                                                 ),
//                                               ),
//                                             ),
//                                             (widget.playeract.qanswer[index] !=
//                                                     null)
//                                                 ? ListTile(
//                                                     leading: "A.".text.make(),
//                                                     title: Text(
//                                                         "${widget.playeract.qanswer[index]}"),
//                                                   ).py(3)
//                                                 : SizedBox(
//                                                     height: 0,
//                                                   )
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   );
