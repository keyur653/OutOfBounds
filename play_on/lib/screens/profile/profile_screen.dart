// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:play_on/controller/user_data.dart';
import 'package:play_on/screens/profile/edit_profile.dart';

import '../../db Model/database_service.dart';

class ProfileScreen extends StatefulWidget {
  static String id = "/profile";
  final List<String> details;
  final List sportdetails;
  const ProfileScreen({
    Key? key,
    required this.details,
    required this.sportdetails,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 77, 77, 10.0),
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => EditProfilePage(
                      details: widget.details,
                      sportdetails: widget.sportdetails)));
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 10),
        child: ListView(children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: (widget.details[6] == "hi")
                    ? AssetImage('images/profile_image.jpg')
                    : NetworkImage(widget.details[6]) as ImageProvider,
              ),
              Text(
                widget.details[0],
                style: const TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              ),
              const Text(
                "Activities: 0",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Source Sans Pro"),
              ),
              const SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              // we will be creating a new widget name info carrd

              InfoCard(
                  text: widget.details[1],
                  icon: Icons.phone,
                  onPressed: () async {}),
              InfoCard(
                text: widget.details[2],
                icon: Icons.person,
                onPressed: () {},
              ),
              InfoCard(
                  text: widget.details[3],
                  icon: widget.details[3] == 'Male'
                      ? Icons.male_rounded
                      : Icons.female_rounded,
                  onPressed: () async {}),
              InfoCard(
                  text: widget.details[4],
                  icon: Icons.location_city,
                  onPressed: () async {}),
              InfoCard(
                  text: widget.details[5],
                  icon: Icons.email,
                  onPressed: () async {}),
              InfoCard(
                text: "${widget.sportdetails[0]} , ${widget.sportdetails[1]}",
                icon: Icons.sports,
                onPressed: () {},
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  void Function()? onPressed;

  InfoCard({required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.teal,
          ),
          title: Text(
            text,
            style: const TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontFamily: "Source Sans Pro"),
          ),
        ),
      ),
    );
  }
}
