import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:predicting_rose_diseases/common/constants/app_constant.dart';
import 'package:predicting_rose_diseases/common/constants/path_constant.dart';
import 'package:predicting_rose_diseases/core/utils/themes/custom_colors.dart';
import 'package:predicting_rose_diseases/ui/views/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Home()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: CustomColors.textColor2,
        width: double.infinity,
        /*
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF180101), Color(0xFFB41308), Color(0xFFDE0F00)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        */
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(PathConstant.appLogo),
              fit: BoxFit.contain,
              //width: width * 0.42,
              //height: height * 0.2,
              width: width * 0.5,
              height: height * 0.2,
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                textAlign: TextAlign.center,
                '${AppConstant.appName} Disease Detection',
                style: TextStyle(
                  fontFamily: 'Arciform',
                  fontWeight: FontWeight.bold,
                  color: CustomColors.themeColor2, //Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
