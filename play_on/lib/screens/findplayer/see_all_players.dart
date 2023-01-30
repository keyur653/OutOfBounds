// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:velocity_x/velocity_x.dart';

class AllPlayers extends StatefulWidget {
  final FindPlayer playeract;
  const AllPlayers({
    Key? key,
    required this.playeract,
  }) : super(key: key);

  @override
  State<AllPlayers> createState() => _AllPlayersState();
}

class _AllPlayersState extends State<AllPlayers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Players(${widget.playeract.pcount})',
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        elevation: 0.0,
        leading: InkWell(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xff476cfb),
              child: ClipOval(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: (widget.playeract.profileurl == "hi")
                      ? Image.asset(
                          'assets/noimage.png',
                          fit: BoxFit.fill,
                        )
                      : Image.network(widget.playeract.profileurl!),
                ),
              ),
            ),
            title: Text(
              widget.playeract.name.toString(),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            trailing: const Text("Host"),
          ),
          const Divider(),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundColor: const Color(0xff476cfb),
                    child: ClipOval(
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: (widget.playeract.playersp[index] == "hi")
                            ? Image.asset(
                                'assets/noimage.png',
                                fit: BoxFit.fill,
                              )
                            : Image.network(widget.playeract.playersp[index]),
                      ),
                    ),
                  ),
                  title:
                      Text(widget.playeract.playersn[index].substring(1)),
                  subtitle:
                      (widget.playeract.playersn[index].substring(0, 1) != "0")
                          ? Row(
                              children: [
                                const Icon(Icons.handshake_outlined),
                                Text(
                                    "+${widget.playeract.playersn[index].substring(0, 1)} More Joined")
                              ],
                            )
                          : null,
                );
              }),
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: widget.playeract.playersn.length),
          const SizedBox(width: 8),
        ],
      ).px(20).py(8),
    );
  }
}
