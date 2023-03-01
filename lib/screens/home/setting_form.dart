import 'package:fire_stor/models/user.dart';
import 'package:fire_stor/services/database.dart';
import 'package:fire_stor/shared/consttants.dart';
import 'package:fire_stor/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  late String _currentName;
  late String _currentSugare;
  late int _currentStrength;
  @override
  Widget build(BuildContext context) {
    final person = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: person.uid).userdata,
        builder: (context, snapshot) {
          UserData? userdata = snapshot.data;
          if (snapshot.hasData) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Update your brew setting.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userdata!.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() {
                      _currentName = val;
                    }),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  DropdownButtonFormField(
                    value: _currentSugare ?? userdata!.sugare,
                    decoration: textInputDecoration,
                    items: sugars.map((suger) {
                      return DropdownMenuItem(
                        value: suger,
                        child: Text('$suger sugars'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() {
                      _currentSugare = val!;
                    }),
                  ),
                  Slider(
                      min: 100.0,
                      max: 900.0,
                      divisions: 8,
                      value: (_currentStrength ?? 100).toDouble(),
                      activeColor: Colors.brown[_currentStrength ?? 100],
                      inactiveColor: Colors.brown[_currentStrength ?? 100],
                      onChanged: (val) => setState(() {
                            _currentStrength = val.round();
                          })),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await DatabaseService(uid: person.uid).updateUserData(
                              _currentSugare, _currentName, _currentStrength);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}
