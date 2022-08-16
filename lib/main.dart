import 'package:briz/color_schemes/scheme1.dart';
import 'package:briz/screens/cruiser_screen.dart';
import 'package:briz/screens/home_screen.dart';
import 'package:briz/screens/profile_screen.dart';
import 'package:briz/screens/sandbox_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
    const FacebookProviderConfiguration(clientId: '5152655478128706'),
  ]);

  runApp(const BrizApp());
}

class BrizApp extends StatefulWidget {
  const BrizApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BrizAppState();
}

class _BrizAppState extends State<BrizApp> {
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     Provider(create: (context) => UserProfileService()),
    //   ],
    return MaterialApp(
      title: "Briz",
      theme: ThemeData(colorScheme: lightColorScheme),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeId,
      routes: {
        HomeScreen.routeId: (context) => const HomeScreen(),
        CruiserScreen.routeId: (context) => CruiserScreen(
              arguments: ModalRoute.of(context)!.settings.arguments as CruiserScreenArguments,
            ),
        UserProfileScreen.routeId: (context) => const UserProfileScreen(),
        SandboxScreen.routeId: (context) => const SandboxScreen(),
      },
    );
  }
}
