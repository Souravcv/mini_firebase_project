import 'package:fire_stor/models/user.dart';
import 'package:fire_stor/screens/wrapper.dart';
import 'package:fire_stor/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:js/js.dart';
import 'dart:js';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userscreen?>.value(
      value: AuthServica().user, 
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        
        home: Wrapper(),
      ),
    );
  }
}
//  StreamProvider<Userscreen?>.value(
//       value: AuthServica().user,
//       initialData: null,)

