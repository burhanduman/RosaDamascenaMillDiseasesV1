// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class UsersService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  /*
  Future<String> uploadProfilePhoto(File imageFile) async {
    try {
      String imageName = imageFile.path.split('/').last;
      Reference ref = _storage.ref().child('photos').child(imageName);

      UploadTask task = ref.putFile(imageFile);
      await task.whenComplete(() {});

      String photoURL = await ref.getDownloadURL();
      return photoURL;
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to upload profile photo.');
    }
  }
  */

  Future<void> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = _storage.ref().child('images/$fileName.jpg');

      await reference.putFile(imageFile);
      String imageUrl = await reference.getDownloadURL();

      // Resmin Firebase Storage'daki URL'sini aldık, bu URL'i dilediğiniz gibi kullanabilirsiniz.
      print('Uploaded image URL: $imageUrl');
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
    }
  }
}
