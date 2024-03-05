import 'package:flutter/material.dart';
import 'package:predicting_rose_diseases/common/constants/app_constant.dart';
import 'package:predicting_rose_diseases/core/utils/themes/custom_colors.dart';
import 'package:predicting_rose_diseases/ui/views/splash_screen.dart';
import 'core/utils/routing/route_constant.dart';
import 'core/utils/routing/route_generator.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstant.homeScreenRoute,
      onGenerateRoute: RouterGenerator.generateRoute,
      title: AppConstant.appName,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.themeColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
