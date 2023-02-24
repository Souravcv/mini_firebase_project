

import 'dart:js';

import 'package:fire_stor/screens/authenticate/authenticate.dart';
import 'package:fire_stor/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
   Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final person = Provider.of<User>(context);
    print(person);
  if(person== null){
    return Authenticate();

  }else{
    return HomeScreen();
  }
  }
}