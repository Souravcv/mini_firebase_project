import 'package:cloud_firestore/cloud_firestore.dart';


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
  Stream<QuerySnapshot>get brews{
  
  return brewCollection.snapshots();
}
}

