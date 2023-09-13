
import 'package:camera_sell_app/services/provider/product_provider.dart';
import 'package:camera_sell_app/services/provider/user_provider.dart';
import 'package:camera_sell_app/utils/const_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/provider/authentication.dart';

final productProvider = Provider((ref) => ProductProvider());

// final addProductProvider = Provider<ProductProvider>((ref) {
//   return ref.read(productProvider);
// });

final productListProvider = StreamProvider<List<DocumentSnapshot>>((ref) {
  return productsCollection.snapshots().map((querySnapshot) {
    return querySnapshot.docs;
  });
});

final productCategory = StreamProvider<List<DocumentSnapshot>>((ref) {
  return categoryList.snapshots().map((querySnapshot) {
    return querySnapshot.docs;
  });
});

final authenticationProvider = Provider<Authentication>((ref) {
  return Authentication();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authStateChange;
});

final userProvider = Provider((ref) => UserProvider());

final userListProvider = StreamProvider<List<DocumentSnapshot>>((ref) {
  return userList.snapshots().map((querySnapshot) {
    return querySnapshot.docs;
  });
});

final cartContentsProvider =
    StreamProvider<List<DocumentSnapshot<Object?>>>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final userId = user.email;
    final cartReference =
        FirebaseFirestore.instance.collection('carts').doc(userId);
    final cartItemsReference = cartReference.collection('cartItems');

    return cartItemsReference.snapshots().map((querySnapshot) {
      return querySnapshot.docs;
    });
  } else {
    // Handle the case when the user is not signed in or user is null
    return Stream.value([]);
  }
});

// final userWishListProvider = StreamProvider<List<DocumentSnapshot>>((ref) {
//   return wishList.snapshots().map((querySnapshot) {
//     return querySnapshot.docs;
//   });
// });

final userCurrentDetails = StreamProvider<DocumentSnapshot?>((ref) {
  return userList.doc(currentUser!.email!).snapshots().map((documentSnapshot) {
    return documentSnapshot;
  });
});
