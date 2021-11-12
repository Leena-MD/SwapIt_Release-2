import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart';

class Storage {

  String url= "";
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;


  Future<String> uploadImage(String imagePath, String imageName) async {
final ref =  FirebaseStorage.instance
                                        .ref()
                                        .child('test/')
                                        .child(imageName);
 
    File file = File(imagePath);

    try {
      await storage.ref('test/$imageName').putFile(file);
        url = await ref.getDownloadURL();
        return url;
    } on firebase_core.FirebaseException catch (e) {
     
      print(e);
      rethrow;
      
    }
    
  }
}
