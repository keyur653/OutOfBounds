
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:play_on/controller/user_data.dart';
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


  void addplayers() {
    widget.playeract.playersn.add("$count${widget.details[0]}");
    widget.playeract.playersp.add(widget.details[6]);
  }

  Future updatePlayers() async {
    FirebaseFirestore.instance
        .collection('User')
        .doc(widget.playeract.area)
        .collection(widget.playeract.sport!)
        .doc(widget.playeract.email)
        .update({
      'PlayersN': widget.playeract.playersn,
      'PlayersP': widget.playeract.playersp,
      'PCount':widget.playeract.pcount+1+count,
    });

    FirebaseFirestore.instance
        .collection('User')
        .doc("myactivity")
        .collection("${loggedInUser.email}")
        .doc("${widget.playeract.activities}${widget.playeract.area}")
        .update({
      'PlayersN': widget.playeract.playersn,
      'PlayersP': widget.playeract.playersp,
      'PCount':widget.playeract.pcount+1+count,
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
      'PCount':widget.playeract.pcount+1+count,
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
        title: Text('Pay & Join'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Card(
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('NO OF PLAYERS:'),
                  IconButton(
                      onPressed: () {
                        decrement();
                      },
                      icon: Icon(Icons.remove)),
                  Text('$count'),
                  IconButton(
                      onPressed: () {
                        increment();
                      },
                      icon: Icon(Icons.add))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
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

          child: Text('PAY INR 100'),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
          ),
        ).p8(),
      ),
    );
  }
}
