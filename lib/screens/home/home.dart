
import 'package:fire_stor/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
final  AuthServica _auth =AuthServica();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.brown[500],
      appBar: AppBar(
        title:const Text("coffi"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: ()async{
await _auth.sineOut();
            }, 
            label: Text(''),icon: 
            Icon(Icons.person),)
        ],
      ),
    );
  }
}