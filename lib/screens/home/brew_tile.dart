import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class BrewTile extends StatelessWidget {
  final brew;
  BrewTile({super.key, this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.brown[brew.strenght],
          ),
          title: Text(brew.name),
          subtitle: Text('Takes${brew.sugars}'),
        ),
      ),
    );
  }
}
