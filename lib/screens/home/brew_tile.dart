

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_stor/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BrewTile extends StatelessWidget {
  final  brew;
   BrewTile({super.key,this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20,6 , 20,0 ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.brown[brew.strenght],
          ),
        ),
      ),
    );
  }
}