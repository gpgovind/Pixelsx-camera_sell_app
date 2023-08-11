import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  static CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  static Stream<QuerySnapshot<Object?>> getProductsImage() {
    // Return a stream of snapshots from the 'products' collection
    return productsCollection.snapshots();
  }
}
