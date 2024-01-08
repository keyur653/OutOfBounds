// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

List<String> detaillist = [];
List sportDetailList = [];

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

class FindPlayer {
  int activities, pcount;
  String? name,
      area,
      sport,
      access,
      cost,
      date,
      time,
      tplayer,
      profileurl,
      sgroup,
      email;

  List queries, qsender, senderurl, qanswer, playersn, playersp, jplayer;

  FindPlayer(
      this.area,
      this.sport,
      this.access,
      this.cost,
      this.date,
      this.time,
      this.tplayer,
      this.profileurl,
      this.activities,
      this.pcount,
      this.queries,
      this.qsender,
      this.senderurl,
      this.qanswer,
      this.playersn,
      this.playersp,
      this.jplayer,
      this.sgroup,
      this.email);

  FindPlayer.fromSnapshot(DocumentSnapshot snapshot)
      : name = snapshot.get('Name').toString(),
        access = snapshot.get('Access').toString(),
        cost = snapshot.get('Cost').toString(),
        date = snapshot.get('Date').toString(),
        area = snapshot.get('Area').toString(),
        time = snapshot.get('Time').toString(),
        tplayer = snapshot.get('Tplayer').toString(),
        sport = snapshot.get('Sport').toString(),
        profileurl = snapshot.get('Profileurl').toString(),
        activities = snapshot.get('Activities'),
        pcount = snapshot.get('PCount'),
        queries = snapshot.get('Queries'),
        qsender = snapshot.get('QSenders'),
        senderurl = snapshot.get('Sendersurl'),
        qanswer = snapshot.get('QAnswers'),
        playersn = snapshot.get('PlayersN'),
        playersp = snapshot.get('PlayersP'),
        jplayer = snapshot.get('JPlayers'),
        email = snapshot.get('Email').toString(),
        sgroup = snapshot.get('Sgroup').toString();
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
  CollectionReference getPlayer(String area, String sport) {
    return (FirebaseFirestore.instance.collection('User/$area/$sport'));
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
