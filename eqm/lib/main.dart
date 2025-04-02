import 'package:flutter/material.dart';
import 'Pages/login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  print("Loading .env...");
  await dotenv.load(fileName: "assets/.env");
  print("Loaded .env");

  print("Initializing Firebase...");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Firebase initialized");

  print("Running app...");
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins"),
      home: const Login(),
    );
  }
}
