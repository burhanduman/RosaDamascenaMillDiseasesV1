import 'package:flutter/material.dart';
import 'package:predicting_rose_diseases/common/constants/path_constant.dart';
import 'package:predicting_rose_diseases/core/utils/routing/route_constant.dart';
import 'package:predicting_rose_diseases/core/utils/themes/background_gradient.dart';
import 'package:predicting_rose_diseases/core/utils/themes/custom_colors.dart';
import 'package:predicting_rose_diseases/ui/widgets/custom_appbar.dart';
import 'package:predicting_rose_diseases/ui/widgets/sidebar_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const SidebarMenu(),
      appBar: const CustomAppBar(showBackButton: false),
      body: Stack(
        children: [
          Positioned(
            top: -110,
            left: 80,
            child: Image.asset(
              PathConstant.warmRosePetals,
              height: 360,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 170,
            right: 70,
            child: Image.asset(
              PathConstant.warmRosePetals,
              height: 370,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 400,
            left: 100,
            child: Image.asset(
              PathConstant.warmRosePetals,
              height: 380,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: width * 0.2,
                  width: width * 0.93,
                  height: height * 0.5,
                  child: Container(
                    width: width * 0.10,
                    height: height * 0.35,
                    decoration: BackgroundGradient().buildGradient(),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Welcome',
                            style: TextStyle(
                                height: 2,
                                fontFamily: 'Arciform',
                                color: CustomColors.textColor2,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            transformAlignment: Alignment.center,
                            width: width * 0.9,
                            height: height * 0.36,
                            margin: EdgeInsets.symmetric(
                                vertical: width * 0.02,
                                horizontal: width * 0.05),
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.07,
                                vertical: height * 0.02),
                            decoration: BoxDecoration(
                              color: CustomColors.textColor2,
                              borderRadius: BorderRadius.circular(27),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      CustomColors.textColor.withOpacity(0.16),
                                  offset: const Offset(1, 1),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 5),
                                const Text(
                                  'RosadamascenaMill',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Copse',
                                      color: CustomColors.mainAuxiliaryColor,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'Disease Detection',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Copse',
                                      color: CustomColors.mainAuxiliaryColor,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      PathConstant.qrCodeScanner,
                                      width: 50,
                                      height: 50,
                                    ),
                                    Text(
                                      String.fromCharCode(Icons
                                          .arrow_forward_ios_outlined
                                          .codePoint),
                                      style: TextStyle(
                                        inherit: false,
                                        color: CustomColors.mainAuxiliaryColor,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Icons
                                            .arrow_forward_ios_outlined
                                            .fontFamily,
                                        package: Icons
                                            .arrow_forward_ios_outlined
                                            .fontPackage,
                                      ),
                                    ),
                                    Image.asset(
                                      PathConstant.documentPaper,
                                      width: 53,
                                      height: 53,
                                    ),
                                    Text(
                                      String.fromCharCode(Icons
                                          .arrow_forward_ios_outlined
                                          .codePoint),
                                      style: TextStyle(
                                        inherit: false,
                                        color: CustomColors.mainAuxiliaryColor,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Icons
                                            .arrow_forward_ios_outlined
                                            .fontFamily,
                                        package: Icons
                                            .arrow_forward_ios_outlined
                                            .fontPackage,
                                      ),
                                    ),
                                    Image.asset(
                                      PathConstant.rose,
                                      width: 57,
                                      height: 57,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          RouteConstant.predictScreenRoute);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.12,
                                          vertical: height * 0.011),
                                      child: const Text(
                                        'Let\'s Start',
                                        style: TextStyle(
                                            fontFamily: 'Arciform',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
