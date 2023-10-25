import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view/pages/auth screens/firebase_auth_screen.dart';
import 'utils/const_path.dart';


Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  configEasyLoading();
  runApp(const ProviderScope(child: MyApp()));
}

final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(firebaseinitializerProvider);
    return ScreenUtilInit(
      designSize: const Size(478.48, 1036.08),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Camera Sell App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        builder: EasyLoading.init(),
        home: initialize.when(
            data: (data) {
              return const AuthPage();
            },
            error: (e, stackTrace) => loading(),
            loading: () => loading()),
      ),
    );
  }
}
