
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_stor/screens/home/brew_list.dart';
import 'package:fire_stor/screens/home/setting_form.dart';
import 'package:fire_stor/services/auth.dart';
import 'package:fire_stor/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
final  AuthServica _auth =AuthServica();

  get uid => null;

  @override
  Widget build(BuildContext context) {
     void _showSettingpanel(){
showModalBottomSheet(context: context, builder:(context){
return Container(
  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
  child:SettingsForm(),
);
} );
     }


    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService(uid: '').brews,
    initialData: (this.uid),
     
      
      child: Scaffold(
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
              label: Text('hi'),icon: 
              Icon(Icons.person),),
              ElevatedButton.icon(onPressed: (){
                _showSettingpanel();
              },
               icon: Icon(Icons.settings_applications), label: Text('settings'))
          ],
        ),
        body:BrewList() ,
      ),
    );
  }
}