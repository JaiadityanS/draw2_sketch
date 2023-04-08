import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Draw2SketchFirebaseUser {
  Draw2SketchFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

Draw2SketchFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Draw2SketchFirebaseUser> draw2SketchFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<Draw2SketchFirebaseUser>(
      (user) {
        currentUser = Draw2SketchFirebaseUser(user);
        return currentUser!;
      },
    );
