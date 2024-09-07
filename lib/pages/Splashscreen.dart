import 'package:scan_presence/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:scan_presence/pages/QrcodeScan.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AuthentificationPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.only(top: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/qrcode.png",
                width: 500,
                height: 250,
              ),
              SpinKitChasingDots(
                color: Colors.orange,
                size: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}