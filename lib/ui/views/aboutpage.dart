// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:predicting_rose_diseases/common/constants/app_constant.dart';
import 'package:predicting_rose_diseases/common/constants/path_constant.dart';
import 'package:predicting_rose_diseases/core/utils/themes/custom_colors.dart';
import 'package:predicting_rose_diseases/ui/widgets/custom_appbar.dart';
import 'package:predicting_rose_diseases/ui/widgets/sidebar_menu.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(
        showBackButton: false,
      ),
      drawer: const SidebarMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                PathConstant.appLogo,
                fit: BoxFit.contain,
                width: width * 0.4,
                height: height * 0.2,
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          AppConstant.appName,
                          style: TextStyle(
                            fontFamily: 'Arciform',
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: CustomColors.themeColor2,
                          ),
                        ),
                        Text(
                          'Version 1.0.0+1',
                          style: TextStyle(
                            fontFamily: 'Arciform',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: CustomColors.textColor4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  const Center(
                    child: Text(
                      'ABOUT',
                      style: TextStyle(
                        fontFamily: 'Arciform',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: CustomColors.textColor3,
                      ),
                    ),
                  ),
                  Text(
                    'Rose cultivation is a subtle art and taking care of the health of the plants is an important part of this art. The health of rose plants can sometimes be diagnosed by the symptoms of diseases. We facilitate this process with the mobile application we have developed.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: CustomColors.textColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'RosadamascenaMill. is a tool equipped with artificial intelligence and image processing technologies. Users can use our app to detect signs of disease by taking photos of rose plants or uploading them from their gallery.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: CustomColors.textColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'RosadamascenaMill. can be used to protect the health and quality of rose crops, detect diseases early, prevent the spread of diseases and fight against diseases. This practice can also contribute to increase rose production and productivity, protect rose resources and develop the rose sector.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: CustomColors.textColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18.0),
          ],
        ),
      ),
    );
  }
}
