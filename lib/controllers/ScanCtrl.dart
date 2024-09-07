import 'package:flutter/material.dart';
import 'package:scan_presence/utils/requetes.dart';
import 'package:scan_presence/models/QrcodeModel.dart';
import 'package:scan_presence/utils/Endpoints.dart';

class ScanController with ChangeNotifier{

  List <QrcodeModel> ScanList = [];
  bool loading = false;

  Future<HttpResponse> setPhoneApi(Map data) async {
    var url = "${Endpoints.scanEndpoint}";
    HttpResponse  reponse = await postData(url, data);

    print("=========================${reponse.data}");
    notifyListeners();
    return reponse;
  }
  }

  void main(){
  var ctrl=ScanController();
  ctrl.setPhoneApi({
    "qrcode": "4181502898330072973384603",
  });
}



