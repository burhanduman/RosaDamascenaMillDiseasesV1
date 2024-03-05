// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:predicting_rose_diseases/common/constants/path_constant.dart';
import 'package:predicting_rose_diseases/core/utils/routing/route_constant.dart';
import 'package:predicting_rose_diseases/core/utils/themes/custom_colors.dart';

import '../../core/utils/themes/background_gradient.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BackgroundGradient().buildGradient2(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(1.0),
                    bottomRight: Radius.circular(1.0),
                  ),
                  image: DecorationImage(
                      colorFilter: ColorFilter.linearToSrgbGamma(),
                      fit: BoxFit.fill,
                      image: AssetImage(PathConstant.roseWallpaper))),
              /*
              child: Text('RosadamascenaMill.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OhChewy')),
                      */
              child: Icon(Iconsax.health, color: CustomColors.textColor2),
            ),
            ListTile(
              iconColor: CustomColors.textColor2,
              textColor: CustomColors.textColor2,
              leading: const Icon(Iconsax.home_2_copy),
              title: const Text(
                "Homepage",
                style: TextStyle(fontFamily: 'Arciform'),
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteConstant.homeScreenRoute2);
              },
            ),
            const Divider(),
            ListTile(
              iconColor: CustomColors.textColor2,
              textColor: CustomColors.textColor2,
              leading: const Icon(Iconsax.star),
              title: const Text(
                "Evaluate The Application",
                style: TextStyle(fontFamily: 'Arciform'),
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              iconColor: CustomColors.textColor2,
              textColor: CustomColors.textColor2,
              leading: const Icon(Iconsax.information_copy),
              title: const Text(
                "About Us",
                style: TextStyle(fontFamily: 'Arciform'),
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteConstant.aboutScreenRoute);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
