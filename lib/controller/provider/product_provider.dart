import 'package:camera_sell_app/utils/const_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/product_model.dart';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProductProvider {
  File? productPickedImage;
  String? productImageUrl;
  int? cartTotalPrice;

  Future<void> addProduct(
      {required String categoryName, required Product product, context}) async {
    try {
      final id = await findDocumentIdByCategory(categoryName);

      if (id == null || id.isEmpty) {
        EasyLoading.showToast('category is not exist',
            toastPosition: EasyLoadingToastPosition.top);
      } else {
        DocumentReference categoryDocRef =
            firestore.collection(productsCollectionName).doc();

        await categoryDocRef.set({
          'p_price': product.price,
          'p_name': product.productName,
          'p_description': product.productDescription,
          'p_image': product.productImage,
          'p_categoryId': id,
          'p_stock': product.productStock,
          'p_rate': 0.0
        }).then((value) {
          log('product added');
          CustomNavigator.navigationPop(context: context);
        });
      }
    } catch (error) {
      // Handle error: Display an error message
      log('category is not exist');
    }
  }
  //---------------------------//

  Future<void> uploadImageToFirebase(File? imageFile) async {
    try {
      if (imageFile == null) {
        log('Image file is null');
        return;
      }

      final storageReference = firebase_storage.FirebaseStorage.instance.ref();
      final imageName = DateTime.now().millisecondsSinceEpoch.toString();

      final uploadTask =
          storageReference.child('images/$imageName.jpg').putFile(imageFile);

      final snapshot = await uploadTask;

      if (snapshot.state == firebase_storage.TaskState.success) {
        final imageUrl = await snapshot.ref.getDownloadURL();

        // Do something with the imageUrl, such as storing it in your state or database
        log("Download URL: $imageUrl");
        productImageUrl = imageUrl;
        productPickedImage = null;
      } else {
        log("Image upload task is not in success state.");
      }
    } catch (error) {
      log('Error uploading image: $error');
    }
  }

  ///---------------//
  Future addCategory(
      {required String categoryName, context, required url}) async {
    try {
      String? id = await findDocumentIdByCategory(categoryName);

      if (id == null || id.isEmpty) {
        DocumentReference categoryDocRef =
            firestore.collection(productCategoryCollection).doc();

        await categoryDocRef
            .set({'p_Category': categoryName, 'p_image': url}).then((value) {
          log('addCategory succeeded');
          CustomNavigator.navigationPop(context: context);
        });
      } else {
        message(context, 'Category already exists');
      }
    } catch (error) {
      message(context, 'An error occurred: $error');
    }
  }

  ///---------------//

  Future<String?> findDocumentIdByCategory(String category) async {
    String? id;
    log('Called findDocumentIdByCategory with category: $category');

    try {
      final QuerySnapshot querySnapshot = await firestore
          .collection(productCategoryCollection)
          .where('p_Category', isEqualTo: category)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Return the document ID of the first matching document
        log('Found matching document with ID: ${querySnapshot.docs.first.id}');
        id = querySnapshot.docs.first.id;
      } else {
        log('No matching document found for category: $category');
      }
    } catch (error) {
      log('Error in findDocumentIdByCategory: $error');
    }

    return id;
  }

  ///---------------------------------//
  Future<void> addToCart(String productId) async {
    try {
      // Get a reference to the user's cart document
      final cartReference = FirebaseFirestore.instance
          .collection('carts')
          .doc(currentUser!.email);

      // Create a reference to the product document
      final productReference =
          FirebaseFirestore.instance.collection('products').doc(productId);

      EasyLoading.show(
          indicator: esLoading(),
          maskType: EasyLoadingMaskType
              .clear); // Check if the product reference already exists in the user's cart
      final cartSnapshot = await cartReference
          .collection('cartItems')
          .where('productReference', isEqualTo: productReference)
          .get();

      if (cartSnapshot.docs.isNotEmpty) {
        EasyLoading.dismiss().then((value) {
          EasyLoading.showToast('item is already exist',
              maskType: EasyLoadingMaskType.clear,
              toastPosition: EasyLoadingToastPosition.top);
        });
      } else {
        await cartReference.collection('cartItems').add({
          'productReference': productReference,
          'addedAt': FieldValue.serverTimestamp(),
          'p_count': 1
        }).whenComplete(() {
          EasyLoading.dismiss().then((value) {
            EasyLoading.showToast('Item Add To Cart',
                maskType: EasyLoadingMaskType.clear,
                toastPosition: EasyLoadingToastPosition.top);
          });
        });
      }
    } catch (error) {
      print('Error adding product to cart: $error');
    }
  }

  ///---------------------------------//
  Future<void> updateCount(String productId, int count) async {
    try {
      final cartReference = FirebaseFirestore.instance
          .collection('carts')
          .doc(currentUser!.email);

      await cartReference
          .collection('cartItems')
          .doc(productId)
          .update({'p_count': count}).whenComplete(() {
        log(productId);
      });
    } catch (error) {
      print('Error adding product to cart: $error');
    }
  }

  ///-------------------------//

  Future<void> addToWishList(String productId) async {
    try {
      final wishListReference = FirebaseFirestore.instance
          .collection('WishList')
          .doc(currentUser!.email);

      final productReference =
          FirebaseFirestore.instance.collection('products').doc(productId);
      EasyLoading.show(
          indicator: esLoading(), maskType: EasyLoadingMaskType.clear);

      final wishListSnapshot = await wishListReference
          .collection('WishListItems')
          .where('productReference', isEqualTo: productReference)
          .get();

      if (wishListSnapshot.docs.isNotEmpty) {
        EasyLoading.dismiss().then((value) {
          EasyLoading.showToast('item is already exist',
              maskType: EasyLoadingMaskType.clear,
              toastPosition: EasyLoadingToastPosition.top);
        });
      } else {
        await wishListReference.collection('WishListItems').add({
          'productReference': productReference,
          'addedAt': FieldValue.serverTimestamp(),
          'p_count': 1
        }).whenComplete(() {
          EasyLoading.dismiss().then((value) {
            EasyLoading.showToast('Item Add To WishList',
                maskType: EasyLoadingMaskType.clear,
                toastPosition: EasyLoadingToastPosition.top);
          });
        });
      }

      print('Product added to cart.');
    } catch (error) {
      print('Error adding product to cart: $error');
    }
  }

  Future deleteCategory({required id, category}) async {
    // Delete the category document
    await firestore.collection(productCategoryCollection).doc(id).delete();

    final categoryQuery = firestore
        .collection(productsCollectionName)
        .where('p_categoryId', isEqualTo: id);
    final querySnapshot = await categoryQuery.get();

    for (final doc in querySnapshot.docs) {
      await firestore.collection(productsCollectionName).doc(doc.id).delete();
    }
  }

  Future editCategory(
      {required id, required categoryName, required imageurl, context}) async {
    DocumentReference categoryDocRef =
        firestore.collection(productCategoryCollection).doc(id);

    await categoryDocRef.update(
        {'p_Category': categoryName, 'p_image': imageurl}).then((value) {
      log('editCategory succeeded');
      CustomNavigator.navigationPop(context: context);
    });
  }

  Future editProduct(
      {required String categoryName,
      required Product product,
      required docId,
      required BuildContext context}) async {
    try {
      final id = await findDocumentIdByCategory(categoryName.toUpperCase());

      if (id == null || id.isEmpty) {
        // ignore: use_build_context_synchronously
        message(context, 'category is not exist');
        log('category is empty');
      } else {
        DocumentReference categoryDocRef =
            firestore.collection(productsCollectionName).doc(docId);

        await categoryDocRef.update({
          'p_price': product.price,
          'p_name': product.productName,
          'p_description': product.productDescription,
          'p_image': product.productImage,
          'p_categoryId': id,
          'p_stock': product.productStock
        }).then((value) {
          log('product added');
          CustomNavigator.navigationPop(context: context);
        });
      }
    } catch (error) {
      // Handle error: Display an error message

      message(context, 'category is not exist$error');
      log('$error');
    }
  }

  Future<String?> findCategory(id) async {
    DocumentReference categoryDocRef =
        firestore.collection(productCategoryCollection).doc(id);
    log(id);

    DocumentSnapshot categorySnapshot = await categoryDocRef.get();
    Map<String, dynamic>? data =
        categorySnapshot.data() as Map<String, dynamic>?;

    // Check if the document exists and contains the 'p_Category' field.
    if (data != null && data.containsKey('p_Category')) {
      return data['p_Category'];
    } else {
      return null; // Return null if the document or field doesn't exist.
    }
  }

  ///-------------//

  double calculateInitialTotal({
    required WidgetRef ref,
  }) {
    double totalAmount = 0;

    // Retrieve the cart data and product data from providers
    final cartAsync = ref.watch(cartContentsProvider);
    final productAsync = ref.watch(productListProvider);

    if (cartAsync is AsyncData<List<DocumentSnapshot<Object?>>>) {
      final userCartData = cartAsync.value;

      if (productAsync is AsyncData<List<DocumentSnapshot<Object?>>>) {
        final productData = productAsync.value;

        for (int index = 0; index < userCartData.length; index++) {
          final cartData = userCartData[index].data() as Map<String, dynamic>;
          final cartReference =
              cartData['productReference'] as DocumentReference;
          final pcount = cartData['p_count'];

          // Find the corresponding product in productData
          final matchingProduct = productData.firstWhere(
            (product) => product.reference == cartReference,
          );

          final productPrice = matchingProduct['p_price'];
          final parsedPrice =
              double.parse(productPrice.toString().replaceAll(',', ''));

          // Update the totalAmount
          totalAmount += (parsedPrice * pcount);
        }
      }
    }

    return totalAmount;
  }
}
