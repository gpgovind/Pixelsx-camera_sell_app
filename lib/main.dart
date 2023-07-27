

import 'dart:developer';

import 'package:camera_sell_app/services/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    log('Error initializing Firebase: $e');
    // Handle the error appropriately (e.g., show an error message to the user).
  }
  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(478.48, 1036.08),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Camera Sell App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const AuthPage(),
      ),
    );
  }
}
   