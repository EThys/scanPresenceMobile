
import 'package:scan_presence/pages/HomePage.dart';
import 'package:scan_presence/pages/Splashscreen.dart';
import 'package:scan_presence/pages/loginPage.dart';
import 'package:scan_presence/pages/QrcodeScan.dart';
import 'package:flutter/material.dart';
import 'Routes.dart';

class RoutesManager {
  static Route route(RouteSettings r) {
    switch (r.name) {
      case Routes.Authentification:
        return MaterialPageRoute(builder: (_) =>AuthentificationPage());
      case Routes.QrCodeScannerRoute:
        return MaterialPageRoute(builder: (_)=>QrcodeScan());
      case Routes.HomePageRoute:
        return MaterialPageRoute(builder: (_)=>HomePage());
      default:
        return MaterialPageRoute(builder: (_) =>SplashPage());
    }
  }
}
