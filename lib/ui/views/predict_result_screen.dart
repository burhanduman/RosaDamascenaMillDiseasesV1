import 'dart:io';

import 'package:flutter/material.dart';
import 'package:predicting_rose_diseases/common/constants/path_constant.dart';
import 'package:predicting_rose_diseases/core/utils/themes/background_gradient.dart';
import 'package:predicting_rose_diseases/core/utils/themes/custom_colors.dart';
import 'package:predicting_rose_diseases/ui/widgets/custom_appbar.dart';
import 'package:predicting_rose_diseases/ui/widgets/sidebar_menu.dart';

class PredictResultScreen extends StatefulWidget {
  const PredictResultScreen({super.key, required this.selectedImage});

  final File? selectedImage;

  @override
  State<PredictResultScreen> createState() => _PredictResultScreenState();
}

class _PredictResultScreenState extends State<PredictResultScreen> {
  late File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.selectedImage; // Seçilen resmi aldık
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Widget? selectedImageView;
    if (_selectedImage != null) {
      selectedImageView = Image.file(
        _selectedImage!,
        width: width * 0.65,
        height: height * 0.23,
        fit: BoxFit.contain,
      );
    } else {
      selectedImageView = const Placeholder(
        fallbackHeight: 200,
        fallbackWidth: 35,
      ); // Eğer resim seçilmediyse boş bir Container oluşturulur
    }

    return Scaffold(
      drawer: const SidebarMenu(),
      appBar: const CustomAppBar(showBackButton: true),
      backgroundColor: CustomColors.textColor2,
      body: Stack(
        children: [
          Positioned(
            top: -30,
            left: 60,
            child: Image.asset(
              PathConstant.warmRosePetals,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 100,
            right: 21,
            child: Image.asset(
              PathConstant.warmRosePetals,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 450,
            left: 65,
            child: Image.asset(
              PathConstant.warmRosePetals,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: width / 13,
                  width: width / 1.13,
                  height: height * 0.78,
                  child: Container(
                    width: width * 0.10, //278,
                    height: height * 0.10, //513,
                    decoration: BackgroundGradient().buildGradient(),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'RosadamescanaMill. DISEASES PREDICTION',
                            style: TextStyle(
                                height: 2,
                                //fontFamily: 'comicneuebold',
                                fontFamily: 'Arciform',
                                color: CustomColors.textColor2,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                width: width * 1.2,
                                height: width * 0.75,
                                margin: EdgeInsets.symmetric(
                                    vertical: width * 0.04,
                                    horizontal: width * 0.05),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04,
                                    vertical: height * 0.02),
                                decoration: BoxDecoration(
                                  color: CustomColors.textColor2,
                                  borderRadius: BorderRadius.circular(27),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.textColor
                                          .withOpacity(0.16),
                                      offset: const Offset(1, 1),
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      alignment: Alignment.topCenter,
                                      child: selectedImageView,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Container(
                            alignment: Alignment.topCenter,
                            width: width * 1.2,
                            height: height * 0.25,
                            margin: EdgeInsets.symmetric(
                                vertical: width * 0.02,
                                horizontal: width * 0.05),
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.06,
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Diseaese Class: ',
                                      style: TextStyle(
                                          fontFamily: 'Copse',
                                          color:
                                              CustomColors.mainAuxiliaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Healthy',
                                      style: TextStyle(
                                          fontFamily: 'Copse',
                                          color: CustomColors.textColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Text(
                                      'Prediction Rate: ',
                                      style: TextStyle(
                                          fontFamily: 'Copse',
                                          color:
                                              CustomColors.mainAuxiliaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '89.15%',
                                      style: TextStyle(
                                          fontFamily: 'Copse',
                                          color: CustomColors.textColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Text(
                                      'Inference Time: ',
                                      style: TextStyle(
                                          fontFamily: 'Copse',
                                          color:
                                              CustomColors.mainAuxiliaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '27 ms',
                                      style: TextStyle(
                                        fontFamily: 'Copse',
                                        color: CustomColors.textColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
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
