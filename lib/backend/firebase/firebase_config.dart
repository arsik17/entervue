import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCT-EqyNIYASNlUnG3mjTBjLM0QTNdHqus",
            authDomain: "entervue-mq3rqn.firebaseapp.com",
            projectId: "entervue-mq3rqn",
            storageBucket: "entervue-mq3rqn.appspot.com",
            messagingSenderId: "1032212660557",
            appId: "1:1032212660557:web:8a49f40ee301476a787704"));
  } else {
    await Firebase.initializeApp();
  }
}
