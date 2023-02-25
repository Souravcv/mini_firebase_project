import 'package:fire_stor/screens/authenticate/authenticate.dart';
import 'package:fire_stor/services/auth.dart';
import 'package:fire_stor/shared/consttants.dart';
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
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String passworde = '';
  String error = '';
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
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
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
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Passworde'),
                  validator: (val) =>
                      val!.length < 6 ? 'Enter an Passworde 6+ long' : null,
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
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic reselt = await _auth.signInWithEmailAndPassword(
                            email, passworde);

                        if (reselt == null) {
                          setState(() {
                            error = "Could not sign in with those cedentials ";
                          });
                        } else {}
                      }
                    },
                    child: Text('Sign in')),
                SizedBox(
                  height: 12,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                )
              ],
            )),
      ),
    );
  }
}
