import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDKmen7clhPfqH0Wx9A08YkF3rstKTOdIk",
            authDomain: "calendario-pii.firebaseapp.com",
            projectId: "calendario-pii",
            storageBucket: "calendario-pii.appspot.com",
            messagingSenderId: "584970875516",
            appId: "1:584970875516:web:8cf2ed75e85dae15208ff9"));
  } else {
    await Firebase.initializeApp();
  }
}
