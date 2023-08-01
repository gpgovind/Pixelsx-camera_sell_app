import 'package:camera_sell_app/view/pages/welcome%20screen%20and%20auth%20screen/firebase_auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:motion/motion.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    const CircularProgressIndicator();
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
