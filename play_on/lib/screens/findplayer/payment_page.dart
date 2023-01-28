import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class paymentPage extends StatefulWidget {
  const paymentPage({super.key});
  static String id = "/payment_page";
  @override
  State<paymentPage> createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
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
                    .make().p8()
              ],
            ).py20(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('PAY INR 100'),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
          ),
        ).p8(),
      ),
    );
  }
}
