import 'package:flutter/material.dart';
import '../utils/requetes.dart';
import 'package:scan_presence/models/AuthentificationModel.dart';
import 'package:scan_presence/utils/Endpoints.dart';

class AuthentificationCtrl with ChangeNotifier {
  String _token = "";
  var user;
  AuthentificationModel _user = AuthentificationModel();
  List<AuthentificationModel> auth = [];
  bool loading = false;
  Future<HttpResponse> login(Map data) async {
    var url = "${Endpoints.authentificationEndpoint}";
    HttpResponse response = await postData(url, data);
    if (response.status) {
      notifyListeners();
    }
    print(response.data);
    return response;
  }
}

 void main(){
  var ctrl=AuthentificationCtrl();
  ctrl.login({
    "email":"josue@gmail.com",
     "password":"2023-06-1012345"
  }); }

