// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:play_on/controller/process_data.dart';
import 'package:play_on/screens/setting_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../controller/user_data.dart';
import 'edit_sport.dart';

class EditProfilePage extends StatefulWidget {
  static String id = "/editprofile";
  final List<String> details;
  final List sportdetails;
  const EditProfilePage({
    Key? key,
    required this.details,
    required this.sportdetails,
  }) : super(key: key);
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerArea = TextEditingController();
  TextEditingController _controllerRole = TextEditingController();
  TextEditingController _controllerSports = TextEditingController();
  final picker = ImagePicker();
  File? _image;
  String? profileUrl;

  List userSport = [];
  bool isselected = false;

  @override
  void initState() {
    _controllerName.text = "${widget.details[0]}";
    _controllerPhone.text = "${widget.details[1]}";
    _controllerArea.text = "${widget.details[4]}";
    _controllerRole.text = "${widget.details[2]}";
    _controllerSports.text =
        "${widget.sportdetails[0]},${widget.sportdetails[1]}";
    print(_controllerSports);
    super.initState();
  }

  void editsport() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => EditSport(role: "Player")))
        .then((value) {
      if (value is List) {
        setState(() {
          _controllerSports.text = "${value[0]},${value[1]}";
          userSport = value;
          isselected = true;
        });
      }
    });
  }

  Future update() async {
    FirebaseFirestore.instance
        .collection('User')
        .doc('current')
        .collection(_controllerRole.text)
        .doc(loggedInUser.email)
        .set({
      'Name': _controllerName.text.toString(),
      'MobileNum': _controllerPhone.text,
      'Area': _controllerArea.text,
      'Email': loggedInUser.email,
      'Gender': widget.details[3],
      'Sports': (isselected == true) ? userSport : widget.sportdetails,
      'Role': _controllerRole.text,
      'Profileurl': profileUrl,
    });
  }

  Future upload(BuildContext context) async {
    // if (formKey.currentState!.validate()) {
    try {
      var firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('profile/${_controllerRole.text}/${loggedInUser.email}');
      var uploadTask = firebaseStorageRef.putFile(_image!);
      var url = await (await uploadTask).ref.getDownloadURL();

      setState(() {
        profileUrl = url.toString();
        update();
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Profile Picture Uploaded'),
      ));

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Submitted Successfully'),
      ));
      // formKey.currentState!.reset();
      setState(() {
        _image = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Select a profile picture'),
      ));
    }
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text('Invalid Details'),
    //   ));
    // }
  }

  Future getImage() async {
    try {
      var image = await picker.pickImage(
          source: ImageSource.gallery, maxWidth: 200.0, maxHeight: 200.0);

      if (image != null) {
        ImageCropper().cropImage(sourcePath: image.path).then((result) => {
              setState(() {
                _image = File(result!.path);
              })
            });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('No image selected. Please select a image.'),
      ));
    }
  }

  ImageProvider setimage(){
    if (_image != null) {
      return FileImage(_image!) ;
    }
     else if (widget.details[6]!="hi") {
      return NetworkImage(widget.details[6]);
    }
   else {
      return AssetImage('images/profile_image.jpg');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.teal,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:setimage()
                              
                              // (_image != null)
                              //     ? FileImage(_image!) as ImageProvider
                              //     : AssetImage('images/profile_image.jpg')
                                  )),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: InkWell(
                            onTap: (() {
                              getImage();
                            }),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", "Enter Full Name", _controllerName,
                  TextInputType.name, (() {})),
              buildTextField("Phone", "Enter Your Number", _controllerPhone,
                  TextInputType.phone, (() {})),
              buildTextField("Location", "Enter Location", _controllerArea,
                  TextInputType.name, (() {})),
              buildTextField("Role", "Enter Your Role", _controllerRole,
                  TextInputType.name, (() {})),
              buildTextField("sports", "Add Sports", _controllerSports,
                  TextInputType.none, editsport),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ).pOnly(bottom: 30),
                  ElevatedButton(
                    onPressed: () {
                      upload(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProcessData(_controllerRole.text)));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.teal),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 50)),
                        elevation: MaterialStatePropertyAll(2),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ).pOnly(bottom: 30)
                ],
              )
            ],
          ),
        ),
      ),
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
