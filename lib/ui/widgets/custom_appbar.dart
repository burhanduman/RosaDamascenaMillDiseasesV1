import 'package:flutter/material.dart';
import 'package:predicting_rose_diseases/common/constants/app_constant.dart';
import 'package:predicting_rose_diseases/core/utils/routing/route_constant.dart';
import 'package:predicting_rose_diseases/core/utils/themes/custom_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.showBackButton,
  }) : super(key: key);

  final bool showBackButton;

  void navigateToHomePage(BuildContext context) {
    Navigator.pushNamed(context, RouteConstant.homeScreenRoute2);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: CustomColors.textColor2,
      backgroundColor: CustomColors.transparentColor,
      elevation: 0.0,
      toolbarHeight: 50,
      centerTitle: true,
      title: GestureDetector(
        onTap: () {
          navigateToHomePage(context);
        },
        child: const Text(
          AppConstant.appName,
          style: TextStyle(
              color: CustomColors.textColor2,
              fontWeight: FontWeight.bold,
              fontFamily: 'Arciform'),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(20, 20),
                bottomRight: Radius.elliptical(20, 20)),
            gradient: LinearGradient(colors: [
              CustomColors.textColor,
              CustomColors.mainAuxiliaryColor
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      ),
      leading: showBackButton
          ? IconButton(
              icon:
                  const Icon(Icons.arrow_back, color: CustomColors.textColor2),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
