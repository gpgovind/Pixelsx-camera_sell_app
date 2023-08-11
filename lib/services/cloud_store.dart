import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/const_path.dart';

Future<void> storeUserData(
    {String? name, String? email, String? password}) async {
  try {
    DocumentReference store =
        firestore.collection(usersCollection).doc(currentUser!.uid);

    await store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid
    });

    debugPrint('Firestore data has been stored successfully');
    log('firestore has data');
  } catch (e) {
    debugPrint('Error storing data to Firestore: $e');
  }
}
