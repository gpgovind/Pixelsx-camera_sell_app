import 'dart:developer';

import 'package:camera_sell_app/utils/const_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProvider {
  blockUser({required isBlocked, required uid}) {
    log(uid);
    final docRef = firestore.collection(usersCollection).doc(uid);
    return docRef.update({
      'isBlocked': isBlocked,
    }).then((value) {
      log('isUserBlocked called successfully');
    }).catchError((error) {
      log('Error updating isBlocked: $error');
    });
  }

  Future<String?> findDocumentIdByEmail(String email) async {
    String? id;
    log('called');
    final QuerySnapshot querySnapshot = await firestore
        .collection(usersCollection)
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Return the document ID of the first matching document
      log(querySnapshot.docs.first.id);
      id = querySnapshot.docs.first.id;
    } else {
      log('error'); // Return null if no matching document found
    }
    return id;
  }

  Future<bool?> userBlockedOrNot(
      {required BuildContext context,
      required WidgetRef ref,
      required String email}) async {
    final uid = await findDocumentIdByEmail(email);
    final docRef = firestore.collection(usersCollection).doc(uid);
    bool? isBlocked;

    try {
      final docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        final userData = docSnapshot.data() as Map<String, dynamic>;
        isBlocked = userData['isBlocked'] as bool;
      }
    } catch (error) {
      log('Error retrieving user data: $error');
    }
    return isBlocked;
  }

  ///-----------------//

  Future<void> storeUserData(
      {required name, required email, image, isBlocked = true}) async {
    try {
      final id = await findDocumentIdByEmail(email);
      if (id == null) {
        DocumentReference store =
            firestore.collection(usersCollection).doc(email);

        await store.set({
          'name': name,
          'id': currentUser!.uid,
          'email': email,
          'imageUrl': image,
          'isBlocked': isBlocked,
          'phoneNumber': 'null'
        });
      }

      debugPrint('Firestore data has been stored successfully');
      log('firestore has data');
    } catch (e) {
      debugPrint('Error storing data to Firestore: $e');
    }
  }

  ///--------------------//
  Future<void> verifyUser() async {
    try {
      await auth.currentUser!.reload();
      if (auth.currentUser!.emailVerified) {
      } else {}
    } catch (error) {
      // Handle any errors that occur during the verification process
      log('Error verifying user: $error');
    }
  }

  //---------------------------//

  Future<void> updateUserData(
      {required String name,required image, context, required String phoneNumber}) async {
    try {
      final id = await findDocumentIdByEmail(currentUser!.email!);
      log('$id user id');
      log('$image image url');
      log('$name usrname');
      if (id != null) {
        DocumentReference store = firestore.collection(usersCollection).doc(id);

        await store.update(
            {'name': name, 'imageUrl': image, 'phoneNumber': phoneNumber});
      }

      debugPrint('Firestore data has been stored successfully');
      log('firestore has data');
    } catch (e) {
      debugPrint('Error storing data to Firestore: $e');
    }
  }
}
