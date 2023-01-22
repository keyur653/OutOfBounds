import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerProfile {
  String? name, mbnumber, role, gender, area, email, sport;

  PlayerProfile(this.name, this.mbnumber, this.role, this.gender, this.area,
      this.email, this.sport);

  PlayerProfile.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot.get('Name').toString(),
        mbnumber = snapshot.get('MobileNum').toString(),
        role = snapshot.get('Role').toString(),
        gender = snapshot.get('Gender').toString(),
        area = snapshot.get('Area').toString(),
        email = snapshot.get('Email').toString(),
        sport = snapshot.get('Sport').toString();
}

class Contents {
  String? name;
  String? key;
  bool isSelected = false;

  Contents(this.name);

  Contents.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot.get('name'),
        key = snapshot.id;
}

class DatabaseReference {
  /// get profile when passing class, year and department as arguments
  CollectionReference getProfile(String? role) {
    return (FirebaseFirestore.instance
        .collection('User/current/$role'));
  }

  CollectionReference placeAttendance(String? cls, String? yer, String? dep) {
    return (FirebaseFirestore.instance
        .collection('collage/attendance/$dep/$yer/$cls'));
  }

  CollectionReference getDetailRef(String val) {
    return (FirebaseFirestore.instance.collection('User/entity/$val'));
  }

  CollectionReference getDetailRef2(String? year, String? department) {
    return (FirebaseFirestore.instance
        .collection('collage/entity/class/$department/$year'));
  }

  CollectionReference getDates() {
    return (FirebaseFirestore.instance.collection('collage/date/working'));
  }
}
