import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_clean_architecture/application/config/routes/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  //Providing the riverpod for our entire app
  runApp(const ProviderScope(child: MainApp()));
  //Hide the default system bottom bar
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [SystemUiOverlay.top],
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(fontFamily: 'Satoshi'),
      debugShowCheckedModeBanner: false,
    );
  }
}
