import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_stor/screens/home/brew_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<QuerySnapshot>(context);
   
    return ListView.builder(
     itemCount:brews.size,
     itemBuilder: (context, index) {
       return BrewTile(brew:brews);
     },
     
    );
  }
 
}

