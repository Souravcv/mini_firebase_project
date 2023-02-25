import 'package:fire_stor/services/auth.dart';
import 'package:fire_stor/shared/consttants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: const Text('Riguster in to brucru'),
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
                  decoration: textInputDecoration.copyWith(hintText: 'email'),
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
                  obscureText: true,
                  validator: (val) =>
                      val!.length < 6 ? 'Enter an Passworde 6+ long' : null,
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
                        dynamic reselt = await _auth
                            .registerWithEmailAndPassword(email, passworde);
                        if (reselt == null) {
                          setState(() {
                            error = "please enter  a valid email ";
                          });
                        } else {}
                      }
                    },
                    child: Text('Register')),
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
