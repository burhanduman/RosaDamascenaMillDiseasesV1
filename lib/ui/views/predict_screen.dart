import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:predicting_rose_diseases/common/constants/path_constant.dart';
import 'package:predicting_rose_diseases/core/services/users_service.dart';
import 'package:predicting_rose_diseases/core/utils/themes/background_gradient.dart';
import 'package:predicting_rose_diseases/core/utils/themes/custom_colors.dart';
import 'package:predicting_rose_diseases/ui/views/predict_result_screen.dart';
import 'package:predicting_rose_diseases/ui/widgets/custom_appbar.dart';
import 'package:predicting_rose_diseases/ui/widgets/sidebar_menu.dart';

class PredictScreen extends StatefulWidget {
  const PredictScreen({super.key});

  @override
  State<PredictScreen> createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  File? _selectedImage;
  UsersService usersService = UsersService();

  String selectedProcessor = 'CPU';
  String selectedModel = 'denseNet169';

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
        usersService.uploadImageToFirebaseStorage(
            _selectedImage!); // Seçilen resmi Firebase Storage'a yükle
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Widget? selectedImageView;
    if (_selectedImage != null) {
      selectedImageView = Image.file(
        _selectedImage!,
        width: width * 0.7,
        height: height * 0.3,
      );
    } else {
      selectedImageView = Icon(
        Iconsax.document_upload,
        size: width * 0.5,
        color: CustomColors.textColor3,
      );
    }

    return Scaffold(
      drawer: const SidebarMenu(),
      appBar: const CustomAppBar(showBackButton: true),
      backgroundColor: CustomColors.textColor2,
      body: Stack(
        children: [
          Positioned(
            top: -130,
            left: 80,
            child: Image.asset(
              PathConstant.warmRosePetals,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 340,
            right: 130,
            child: Image.asset(
              PathConstant.warmRosePetals,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 250,
            left: 80,
            child: Image.asset(
              PathConstant.warmRosePetals,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 370,
            right: 90,
            child: Image.asset(
              PathConstant.warmRosePetals,
              height: 370,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 460,
            left: 170,
            child: Image.asset(
              PathConstant.warmRosePetals,
              height: 360,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: width * 0.06,
                  width: width * 0.92,
                  height: height * 0.83,
                  child: Container(
                    width: width * 0.10,
                    height: height * 0.10,
                    decoration: BackgroundGradient().buildGradient(),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                width: width * 1.2,
                                height: height * 0.48,
                                margin: EdgeInsets.symmetric(
                                    vertical: width * 0.03,
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
                                    const SizedBox(height: 5),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      alignment: Alignment.topCenter,
                                      child: selectedImageView,
                                    ),
                                    const SizedBox(height: 25),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              _getImage(ImageSource.camera);
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.0,
                                                  vertical: 5.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.camera_alt_outlined,
                                                    size: 25,
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    'Start Camera',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Arciform'),
                                                  )
                                                ],
                                              ),
                                            )),
                                        const SizedBox(height: 10),
                                        ElevatedButton(
                                            onPressed: () {
                                              _getImage(ImageSource.gallery);
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.0,
                                                  vertical: 5.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.image_outlined,
                                                    size: 25,
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    'Load Image',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Arciform'),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 1),

                          //CONTAINER 2
                          Container(
                            alignment: Alignment.topCenter,
                            width: width * 1.2,
                            height: height * 0.2,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Processor: ',
                                      style: TextStyle(
                                          fontFamily: 'Copse',
                                          color:
                                              CustomColors.mainAuxiliaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: width * 0.05),
                                    DropdownButton<String>(
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'CPU',
                                          child: Text("CPU"),
                                        ),
                                        DropdownMenuItem(
                                          value: 'GPU',
                                          child: Text("GPU"),
                                        ),
                                      ],
                                      value: selectedProcessor,
                                      onChanged: (String? newSelection) {
                                        setState(() {
                                          selectedProcessor = newSelection!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Text(
                                      'Model: ',
                                      style: TextStyle(
                                          fontFamily: 'Copse',
                                          color:
                                              CustomColors.mainAuxiliaryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: width * 0.11),
                                    DropdownButton<String>(
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'denseNet169',
                                          child: Text("DenseNet169"),
                                        ),
                                        DropdownMenuItem(
                                          value: 'mobileNetV2',
                                          child: Text("MobileNet V2"),
                                        ),
                                        DropdownMenuItem(
                                          value: 'Ensemble',
                                          child: Text("Ensemble"),
                                        ),
                                      ],
                                      value: selectedModel,
                                      onChanged: (String? newSelection) {
                                        setState(() {
                                          selectedModel = newSelection!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 1),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.8,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_selectedImage == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Upload an image first!'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PredictResultScreen(
                                            selectedImage: _selectedImage,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Predict',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Copse',
                                        fontSize: 25),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
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
