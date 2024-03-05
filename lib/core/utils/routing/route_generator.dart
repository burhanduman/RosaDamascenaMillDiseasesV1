// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:predicting_rose_diseases/ui/views/aboutpage.dart';
import 'package:predicting_rose_diseases/ui/views/home.dart';
import 'package:predicting_rose_diseases/ui/views/predict_screen.dart';
import 'route_constant.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case RouteConstant.homeScreenRoute2:
        return MaterialPageRoute(builder: (_) => Home());
      case RouteConstant.predictScreenRoute:
        return MaterialPageRoute(builder: (_) => PredictScreen());
      case RouteConstant.aboutScreenRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}
