import 'package:flutter/material.dart';
import 'package:play_on/screens/edit_profile.dart';

const email = "nikhilsoni2910@gmail.com";
const phone = "90441539202"; 
const area = "Borivali,Mumbai";
const userGender = "Male";

class ProfileScreen extends StatelessWidget {
  static String id = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
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
                  builder: (BuildContext context) => EditProfilePage()));
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/profile_image.jpg'),
                ),
                const Text(
                  "Nik Soni",
                  style: TextStyle(
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
                    text:phone,
                    icon: Icons.phone,
                    onPressed: () async {}),
                InfoCard(text: "Player", icon: Icons.person, onPressed: () {},),
                InfoCard(
                    text: userGender,
                    icon:userGender == 'Male'
                      ? Icons.male_rounded
                          :Icons.female_rounded,
                    onPressed: () async {}),
                InfoCard(
                    text: area,
                    icon: Icons.location_city,
                    onPressed: () async {}),
                InfoCard(
                    text: email, icon: Icons.email, onPressed: () async {}),
                InfoCard(text: "Cricket,Football", icon: Icons.sports, onPressed: () {},)
              ],
            ),
          ),
        );
  }
}

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  void Function()? onPressed;

  InfoCard(
      {required this.text, required this.icon, required this.onPressed});

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