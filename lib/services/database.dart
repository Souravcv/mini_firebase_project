import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_stor/models/brew.dart';


class DatabaseService{
  final String uid;
  DatabaseService({required this.uid });
  final CollectionReference brewCollection =FirebaseFirestore.instance.collection('nrews');
  Future updateUserData(String sugars,String name, int strenght)async{
    return brewCollection.doc(uid).set({
      'sugars':sugars,
      'name':name,
      'strenght':strenght,
    });

  }
  // Iterable<Brew>_brewListFromSnapeshot(QuerySnapshot snapshot){
  //   return snapshot.docs.map((doc) {
  //     return Brew(
  //       name: '',
     
  //      strenght: 0,
  //       sugars: '0');
      
  //   },);
  // }
  Stream<QuerySnapshot>get brews{
  
  return brewCollection.snapshots();
  
}
}

