import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

const usersCollection = 'user';
const productsCollectionName = 'products';
const productCategoryCollection = 'categories';

final storage = FirebaseStorage.instance;
final rootRef = storage.ref();

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;
final userCartName = currentUser!.email;
final userWishList = currentUser!.email;

CollectionReference productsCollection =
    FirebaseFirestore.instance.collection(productsCollectionName);
CollectionReference userList =
    FirebaseFirestore.instance.collection(usersCollection);
CollectionReference categoryList =
    FirebaseFirestore.instance.collection(productCategoryCollection);
CollectionReference cartAddAndList =
    FirebaseFirestore.instance.collection('carts');
CollectionReference wishList =
    FirebaseFirestore.instance.collection(' wishList');
