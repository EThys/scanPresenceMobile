import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan_presence/utils/requetes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_presence/controllers/ScanCtrl.dart';
import 'package:scan_presence/widgets/showMsg.dart';

import 'HomePage.dart';


class QrcodeScan extends StatefulWidget {

  QrcodeScan({Key? key}) : super(key: key);

  @override
  State<QrcodeScan> createState() => _QrcodeScanState();
}

class _QrcodeScanState extends State<QrcodeScan> {
  bool flashOn = false;
  bool frontCam = false;
  GlobalKey qrKey = GlobalKey();
  QRViewController? qrController;
  String? resultScan;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        QRView(
            key: qrKey,
            overlay: QrScannerOverlayShape(borderColor: Colors.white),
            onQRViewCreated: (QRViewController controller) {
              this.qrController = controller;
              controller.scannedDataStream.listen((scanData) async {
                resultScan = scanData.code;
                print("=======+++++++++++++++++++============$resultScan");
                print('hello999999999999999999999999999999999999999999999');
                controller.dispose();
                if (resultScan!.isNotEmpty) {
                  _gererScan(context, resultScan, controller);
                } else {
                  return;
                }
              });
            }),
       
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 45),
            child: Text(
              'DemoApp Scan',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  color: Colors.white,
                  icon: Icon(flashOn ? Icons.flash_on : Icons.flash_off),
                  onPressed: () {
                    setState(() {
                      flashOn = true;
                    });
                    qrController!.toggleFlash();
                  }),
              IconButton(
                  color: Colors.white,
                  icon: Icon(frontCam ? Icons.camera_front : Icons.camera_rear),
                  onPressed: () {
                    setState(() {
                      frontCam = true;
                    });
                    qrController!.flipCamera();
                  }),
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()), // Remplacez HomePage par votre page d'accueil
                        (Route<dynamic> route) => false, // Retire toutes les pages précédentes
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> _gererScan(BuildContext context,
      dynamic resultScan, controller) async {
    var ScanCtrl = context.read<ScanController>();
    Map<String, dynamic> scanDataJson = {'qrcode': resultScan};
    HttpResponse result = await ScanCtrl.setPhoneApi(scanDataJson);
    print("${result.data!['message']}likaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaamaaaaaaaa");

        switch (result.data!['message']) {
          case "scan":
            showMsg(
                context, true, "Valide");
            controller.dispose();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Remplacez HomePage par votre page d'accueil
                  (Route<dynamic> route) => false, // Retire toutes les pages précédentes
            );
            break;
          case "noscan":
            showMsg(context, false, "Déjà scanné");
            controller.dispose();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Remplacez HomePage par votre page d'accueil
                  (Route<dynamic> route) => false, // Retire toutes les pages précédentes
            );
            break;
            case "no":
            showMsg(context, false, "Non identifié");
            controller.dispose();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Remplacez HomePage par votre page d'accueil
                  (Route<dynamic> route) => false, // Retire toutes les pages précédentes
            );
            break;
          default:
            controller.dispose();
    }
}
}
