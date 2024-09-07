import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/AuthentificationCtrl.dart';
import '../controllers/ScanCtrl.dart';
import '../utils/RoutesManager.dart';
import '../utils/Routes.dart';


class MonApplication extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthentificationCtrl()),
        ChangeNotifierProvider(create: (_) => ScanController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.route,
        initialRoute: Routes.Splashscreen,
      ),
    );
  }
}

// import 'package:demoappadmin/pages/BottomNavbar.dart';
// import 'package:demoappadmin/pages/HomePage.dart';
// import 'package:demoappadmin/pages/QrcodeScan.dart';
// import 'package:demoappadmin/pages/Splashscreen.dart';
// import 'package:demoappadmin/pages/loginPage.dart';
// import 'package:flutter/material.dart';

// class MonApplication extends StatelessWidget {
//   const MonApplication({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:SplashPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }


