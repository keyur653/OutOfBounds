// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:play_on/controller/user_data.dart';
import 'package:play_on/db%20Model/database_service.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../db Model/db_model.dart';

class PaymentPage extends StatefulWidget {
  final FindPlayer playeract;
  final List<String> details;
  const PaymentPage({
    Key? key,
    required this.playeract,
    required this.details,
  }) : super(key: key);
  static String id = "/payment_page";
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  static int count = 0;
  late String groupid;
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    if (count < 1) {
      return;
    }
    setState(() {
      count--;
    });
  }

  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  void addplayers() {
    widget.playeract.playersn.add("$count${widget.details[0]}");
    widget.playeract.playersp.add(widget.details[6]);
    widget.playeract.jplayer.add(loggedInUser.uid);
  }

  Future updatePlayers() async {
    groupid = getId(widget.playeract.sgroup!);
    print(groupid);

    FirebaseFirestore.instance.collection("groups").doc(groupid).update({
      'members':
          FieldValue.arrayUnion(["${loggedInUser.uid}_${widget.details[0]}"])
    });

    FirebaseFirestore.instance
        .collection('User')
        .doc(widget.playeract.area)
        .collection(widget.playeract.sport!)
        .doc("${widget.playeract.activities}${widget.playeract.email}")
        .update({
      'PlayersN': widget.playeract.playersn,
      'JPlayers':widget.playeract.jplayer,
      'PlayersP': widget.playeract.playersp,
      'PCount': widget.playeract.pcount + 1 + count,
    });

    FirebaseFirestore.instance
        .collection('User')
        .doc("myactivity")
        .collection("${widget.playeract.email}")
        .doc("${widget.playeract.activities}${widget.playeract.area}")
        .update({
      'PlayersN': widget.playeract.playersn,
      'JPlayers':widget.playeract.jplayer,
      'PlayersP': widget.playeract.playersp,
      'PCount': widget.playeract.pcount + 1 + count,
    });
  }

  Future joinedactivity() async {
    FirebaseFirestore.instance
        .collection('User')
        .doc("joinactivity")
        .collection("${loggedInUser.email}")
        .doc("${widget.playeract.activities}${widget.playeract.area}")
        .set({
      'Name': widget.playeract.name,
      'Sport': widget.playeract.sport,
      'Area': widget.playeract.area,
      'Date': widget.playeract.date,
      'Time': widget.playeract.time,
      'Access': widget.playeract.access,
      'Cost': widget.playeract.cost,
      'Tplayer': widget.playeract.tplayer,
      'Profileurl': widget.playeract.profileurl,
      'Activities': widget.playeract.activities,
      'Sgroup': widget.playeract.sgroup,
      'PCount': widget.playeract.pcount + 1 + count,
      'JPlayers':widget.playeract.jplayer,
      'PlayersN': widget.playeract.playersn,
      'PlayersP': widget.playeract.playersp,
      'Queries': widget.playeract.queries,
      'QSenders': widget.playeract.qsender,
      'Sendersurl': widget.playeract.senderurl,
      'QAnswers': widget.playeract.qanswer,
      'Email': "${widget.playeract.activities}${widget.playeract.email}"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text('Pay & Join'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Card(
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('NO OF PLAYERS:'),
                  IconButton(
                      onPressed: () {
                        decrement();
                      },
                      icon: const Icon(Icons.remove)),
                  Text('$count'),
                  IconButton(
                      onPressed: () {
                        increment();
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: "AMOUNT: INR 100".text.bold.xl2.green700.make().py32(),
          ),
          Card(
            elevation: 10,
            child: Column(
              children: [
                'Cancellation Policy'.text.bold.xl2.make().py8(),
                'Once paid and joined, you cannot leave the activity unless the host cancels. Incase of cancellation of the activity by the host, your money will be refunded in full to the source mode.'
                    .text
                    .make()
                    .p8()
              ],
            ).py20(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            addplayers();
            updatePlayers();
            joinedactivity();
            Navigator.pop(context);
          },
          child: const Text('PAY INR 100'),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
          ),
        ).p8(),
      ),
    );
  }
}
