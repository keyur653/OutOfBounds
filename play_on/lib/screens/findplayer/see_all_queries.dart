// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:velocity_x/velocity_x.dart';

class AllQueries extends StatefulWidget {
  final FindPlayer playeract;
  const AllQueries({
    Key? key,
    required this.playeract,
  }) : super(key: key);

  @override
  State<AllQueries> createState() => _AllQueriesState();
}

class _AllQueriesState extends State<AllQueries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Queries',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        elevation: 0.0,
        leading: InkWell(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: "Q.".text.make(),
                      title: Text("${widget.playeract.queries[index]}"),
                      subtitle: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: const Color(0xff476cfb),
                            child: ClipOval(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child:
                                    (widget.playeract.senderurl[index] == "hi")
                                        ? Image.asset(
                                            'assets/noimage.png',
                                            fit: BoxFit.fill,
                                          )
                                        : Image.network(
                                            widget.playeract.senderurl[index]),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("${widget.playeract.qsender[index]}")
                        ],
                      ),
                    ),
                    (widget.playeract.qanswer[index] != null)
                        ? ListTile(
                            leading: "A.".text.make(),
                            title: Text("${widget.playeract.qanswer[index]}"),
                          ).py(8)
                        : SizedBox(
                            height: 0,
                          )
                  ],
                );
              }),
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: widget.playeract.queries.length),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
