import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todojango/home_page.dart';
import 'package:todojango/logsign/login_page.dart';
import 'package:todojango/logsign/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todojango/user%20auth/usermodelview.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
     persistenceEnabled: true
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  User? user;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          'Login': (context) => const LogInPage(),
          'Signin': (context) => const SignInPage(),
          'Home': (context) => const MyHomePage()
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: user != null ? const MyHomePage() : const LogInPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
