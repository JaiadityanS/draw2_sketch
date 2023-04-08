import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBPnQQmugdZQGJrqBjQ5fxhEdfPHjLxJEs",
            authDomain: "draw2sketch6.firebaseapp.com",
            projectId: "draw2sketch6",
            storageBucket: "draw2sketch6.appspot.com",
            messagingSenderId: "677130977870",
            appId: "1:677130977870:web:99491c1efa0650d182b91f",
            measurementId: "G-KSN0PCS5XE"));
  } else {
    await Firebase.initializeApp();
  }
}
