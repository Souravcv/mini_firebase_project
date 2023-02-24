

import 'package:fire_stor/services/auth.dart';
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
  String passworde='';
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title:const Text('Riguster in to brucru'),
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
        padding:EdgeInsets.symmetric(vertical: 20.0,horizontal:50.0 ) ,

        child:Form(
          key: _formKey,
          child: Column(
            children: [
            const  SizedBox(height: 20,),
              TextFormField(
                onChanged: (val){
                  setState(() {
                    email==val;
                  });

                },
              ),
               const  SizedBox(height: 20,),
               TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    passworde == val;
                  });
                },
               ),
               const  SizedBox(height: 20,),
               ElevatedButton(
             
                onPressed: ()async{
                  if (_formKey.currentState!.validate()) {
                    print(email);
                    print(passworde);
                  }

                },
                child: Text('Register'))

            ],
          )) ,
      ),
    );
  }
}