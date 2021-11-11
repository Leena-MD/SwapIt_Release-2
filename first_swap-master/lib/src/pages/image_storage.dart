import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadImage(String imagePath, String imageName) async {
    File file = File(imagePath);

    try {
      await storage.ref('test/$imageName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }

    try {
      await storage.ref('test/$imageName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }
}
