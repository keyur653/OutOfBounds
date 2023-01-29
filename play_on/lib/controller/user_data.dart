import 'package:firebase_auth/firebase_auth.dart';

late User loggedInUser;

void getCurrentUser() {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
}