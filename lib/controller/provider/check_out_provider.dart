import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../utils/const_path.dart';

class CheckOutProvider {
  Future<void> addToOrderPage(dynamic productReference) async {
    try {
      log("$productReference reference in orderPage ");
      final buyProductReference = checkOutCollection.doc(currentUser!.email);

      if (productReference is List<DocumentReference>) {
        // If productReference is a list
        for (final ref in productReference) {
          await buyProductReference.collection('orderItems').add({
            'productReference': ref,
            'addedAt': FieldValue.serverTimestamp(),
            'p_order': 'Order Placed'
          }).whenComplete(() {
            EasyLoading.showSuccess(
                'Payment Succeeded. Thank you for your Purchase');
          });
        }
      } else if (productReference is DocumentReference) {
        log('else condition is called');
        // If productReference is a single reference
        await buyProductReference.collection('orderItems').add({
          'productReference': productReference,
          'addedAt': FieldValue.serverTimestamp(),
          'p_order': 'Order Placed',
          'p_Delivered': false
        }).whenComplete(() {
          log('order add to fire storage');
          EasyLoading.showSuccess(
              'Payment Succeeded. Thank you for your Purchase');
        });
      }

      log('Product(s) added to order.');
    } catch (error) {
      log('Error adding product(s) to order: $error');
    }
  }

  Future<void> changeOrderStatus(docId, String status) async {
    try {
      final buyProductReference = checkOutCollection.doc(currentUser!.email);

      await buyProductReference
          .collection('orderItems')
          .doc(docId)
          .update({'p_order': status});
    } catch (e) {
      log('error:$e');
    }
  }

  Future<void> orderCancel(docId) async {
    try {
      final buyProductReference = checkOutCollection.doc(currentUser!.email);

      await buyProductReference
          .collection('orderItems')
          .doc(docId)
          .update({'p_order': 'Canceled'});
    } catch (e) {
      log('error:$e');
    }
  }

  Future updateRating({required String pId, required double currentRating,required double rating}) async {
    try {
      DocumentReference productRating =
          firestore.collection(productsCollectionName).doc(pId);
      double totalRating = currentRating + rating;
      

      await productRating.update({'p_rate': totalRating}).then((value) {
        log('product added');
      });
    } catch (e) {
      log('error$e');
    }
  }
}
