import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBaYNVUYE7kjLLkl8C9w3f0Kc97-uB_o3Y",
            authDomain: "briz-59ee3.firebaseapp.com",
            projectId: "briz-59ee3",
            storageBucket: "briz-59ee3.appspot.com",
            messagingSenderId: "794066304083",
            appId: "1:794066304083:web:b5c0b96d4d13769fe5daa6",
            measurementId: "G-6BXDPJKRQX"));
  } else {
    await Firebase.initializeApp();
  }
}
