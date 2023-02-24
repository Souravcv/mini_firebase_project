import 'package:fire_stor/screens/authenticate/authenticate.dart';
import 'package:fire_stor/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
   SignIn({super.key, required this.toggleView});


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServica _auth = AuthServica();
  String email = '';
  String passworde = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sin in to brucru'),
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                 widget.toggleView();
              },
              icon: const Icon(Icons.person),
              label: const Text('Rigister'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (val) {
                setState(() {
                  email == val;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              onChanged: (val) {
                setState(() {
                  passworde == val;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () async {}, child: Text(''))
          ],
        )),
      ),
    );
  }
}
