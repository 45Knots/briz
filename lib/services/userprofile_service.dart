// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutterfire_ui/auth.dart';

// class UserProfileService {
//   late final FirebaseAuth _auth = FirebaseAuth.instance;
//   // UserProfileService() {
//   //   FlutterFireUIAuth.configureProviders([
//   //     const EmailProviderConfiguration(),
//   //     const FacebookProviderConfiguration(clientId: '5152655478128706'),
//   //   ]);
//   // }

//   Stream<User?> get userChanges => _auth.userChanges();
//   Future<UserCredential> signInWithCredentail(AuthCredential credential) => _auth.signInWithCredential(credential);
//   Future<void> logout() => _auth.signOut();
//   User? get currentUser => _auth.currentUser;

//   loginFacebook() async {
//     if (kDebugMode) {
//       print('Starting Facebook Login');
//     }

//     final fbAuthResult = await FacebookAuth.instance.login(
//       permissions: ['public_profile', 'email'],
//     );

//     switch (fbAuthResult.status) {
//       case LoginStatus.success:
//         if (kDebugMode) {
//           print('It worked');
//         }

//         //Get Token

//         //Convert to Auth Credential
//         final OAuthCredential credential = FacebookAuthProvider.credential(fbAuthResult.accessToken!.token);

//         //User Credential to Sign in with Firebase
//         var result = await _auth.signInWithCredential(credential);
//         if (kDebugMode) {
//           print('${result.user!.displayName} is now logged in');
//         }
//         Map<String, dynamic> userData = await FacebookAuth.instance.getUserData();
//         await currentUser!.updatePhotoURL(userData["picture"]["data"]["url"].toString());
//         break;
//       case LoginStatus.cancelled:
//         if (kDebugMode) {
//           print('The user canceled the login');
//         }
//         break;
//       case LoginStatus.failed:
//         if (kDebugMode) {
//           print('There was an error');
//         }
//         break;
//       default:
//         if (kDebugMode) {
//           print('Other status = ${fbAuthResult.status}');
//         }
//     }
//   }
// }
