// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:play_on/controller/user_data.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:play_on/screens/findplayer/payment_page.dart';
import 'package:play_on/screens/findplayer/see_all_players.dart';
import 'package:play_on/screens/findplayer/see_all_queries.dart';
import 'package:play_on/widget/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

import '../create_activity/create.dart';

// import 'h';
class ActivityDetail extends StatefulWidget {
  static String id = "/Activity Detail";
  final List<String> details;
  final FindPlayer playeract;

  const ActivityDetail({
    Key? key,
    required this.details,
    required this.playeract,
  }) : super(key: key);

  @override
  State<ActivityDetail> createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  TextEditingController _controllquery = TextEditingController();
  // List querlist = [];
  // List senderlist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void setquery() {
    widget.playeract.qanswer.add(null);
    widget.playeract.queries.add(_controllquery.text);
    widget.playeract.qsender.add(widget.details[0]);
    widget.playeract.senderurl.add(widget.details[6]);
  }

  Future updateQuery() async {
    FirebaseFirestore.instance
        .collection('User')
        .doc(widget.playeract.area)
        .collection(widget.playeract.sport!)
        .doc("${widget.playeract.activities}${widget.playeract.email}")
        .update({
      'Queries': widget.playeract.queries,
      'QSenders': widget.playeract.qsender,
      'Sendersurl': widget.playeract.senderurl,
      'QAnswers': widget.playeract.qanswer
    });
    print(widget.playeract.email);
    FirebaseFirestore.instance
        .collection('User')
        .doc("myactivity")
        .collection("${widget.playeract.email}")
        .doc("${widget.playeract.activities}${widget.playeract.area}")
        .update({
      'Queries': widget.playeract.queries,
      'QSenders': widget.playeract.qsender,
      'Sendersurl': widget.playeract.senderurl,
      'QAnswers': widget.playeract.qanswer
    });
  }

  Widget build(BuildContext context) {
    // var index;
    // var arrCard;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
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
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  (!widget.playeract.jplayer.contains(loggedInUser.uid))
                      ? {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => PaymentPage(
                                      playeract: widget.playeract,
                                      details: widget.details)))),
                        }
                      : {
                          showSnackbar(
                              context, Colors.green, "you already joined")
                        };
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                child: (!widget.playeract.jplayer.contains(loggedInUser.uid))
                    ? "Join this".text.make()
                    : "Joined".text.make(),
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
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        useSafeArea: true,
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
      contentPadding: EdgeInsets.only(top: 20, left: 20, right: 20),
      title: const Text('Add Your Query'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              "Need more details? send a Query. It will help the host ${widget.playeract.name} improve the activity Instructions"),
          buildTextField("Query", "Enter your query", _controllquery,
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
            setquery();
            updateQuery();
            Navigator.pop(context);
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
