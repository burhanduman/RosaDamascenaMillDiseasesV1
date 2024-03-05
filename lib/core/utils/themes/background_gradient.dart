import 'package:flutter/material.dart';
import 'package:predicting_rose_diseases/core/utils/themes/custom_colors.dart';

class BackgroundGradient {
  BoxDecoration buildGradient() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          CustomColors.textColor,
          CustomColors.mainAuxiliaryColor,
          CustomColors.intermediateAuxiliaryColor
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      borderRadius: BorderRadius.circular(35),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: const Offset(0, 0),
          blurRadius: 4,
          spreadRadius: 0,
        ),
      ],
    );
  }

  BoxDecoration buildGradient2() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          CustomColors.intermediateAuxiliaryColor,
          CustomColors.mainAuxiliaryColor,
          CustomColors.textColor
        ],
      ),
    );
  }

  BoxDecoration buildGradient3() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          CustomColors.textColor2,
          CustomColors.lightColor,
        ],
      ),
    );
  }
}
