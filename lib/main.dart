import 'package:briz/color_schemes/scheme1.dart';
import 'package:briz/screens/cruiser_screen.dart';
import 'package:briz/screens/home_screen.dart';
import 'package:briz/screens/login_screen.dart';
import 'package:briz/screens/profile_screen.dart';
import 'package:briz/screens/sandbox_screen.dart';
import 'package:briz/services/userprofile_service.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MultiProvider(
      providers: [
        Provider(create: (context) => UserProfileService()),
      ],
      child: MaterialApp(
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
          LoginScreen.routeId: (context) => const LoginScreen(),
          ProfileScreen.routeId: (context) => const ProfileScreen(),
          SandboxScreen.routeId: (context) => const SandboxScreen(),
        },
      ),
    );
  }
}
