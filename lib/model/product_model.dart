import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String price;
  final String productName;
  final String productDescription;
  final String productStock;
  late final String productImage;

  Product({
    required this.price,
    required this.productStock,
    required this.productName,
    required this.productDescription,
    required this.productImage,
  });
}


Map<String, dynamic> getProductData(DocumentSnapshot productSnapshot) {
  return {
    'p_name': productSnapshot['p_name'],
    'p_price': productSnapshot['p_price'],
    'p_stock': productSnapshot['p_stock'],
    'p_description': productSnapshot['p_description'],
    'p_image': productSnapshot['p_image'],
    'p_rate': productSnapshot['p_rate']/ 5,
    'doc_id': productSnapshot.id,
    'reference': productSnapshot.reference,
  };
}
