
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/const_path.dart';
import '../../../widgets/widget_path.dart';
import 'welcome_screen.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AdminCategoryState();
}

class _AdminCategoryState extends ConsumerState<AuthPage> {


  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
        data: (data) {
          if (data != null) return const BottomNav();
          return const WelcomeScreen();
        },
        error: (e, stackTrace) =>  loading(),
        loading: () => loading());
  }
}
