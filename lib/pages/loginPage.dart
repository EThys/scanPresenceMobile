import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scan_presence/widgets/ChampSaisie.dart';
import 'package:scan_presence/widgets/Chargement.dart';
import 'package:scan_presence/controllers/AuthentificationCtrl.dart';
import 'package:scan_presence/utils/MessageSnack.dart';
import 'package:scan_presence/utils/Routes.dart';

class AuthentificationPage extends StatefulWidget {
  const AuthentificationPage({Key? key}) : super(key: key);

  @override
  State<AuthentificationPage> createState() => _AuthentificationPageState();
}

class _AuthentificationPageState extends State<AuthentificationPage> {

  @override

  bool isRememberMe = false;
  bool isVisible = false;
  String errorMsg = "";
  bool isPassword = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  LoginPressed() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (!formKey.currentState!.validate()) {
      return;
    }
    isVisible = true;
    setState(() {});
    var ctrl = context.read<AuthentificationCtrl>();
    Map datas = {"email": emailLogin.text, "password": passwordLogin.text};
    print(datas);
    var res = await ctrl.login(datas);
    print(res);
    await Future.delayed(Duration(seconds: 2));
    isVisible = false;
    setState(() {});

    if (res.data?['status']==200) {
      //await Future.delayed(Duration(seconds: 1));
      setState(() {});
      Navigator.pushReplacementNamed(context, Routes.HomePageRoute);
    } else {
      passwordLogin.clear();
      var msg = res.isException == true ? res.errorMsg : (res.data?['message']);
      Message.afficherSnack(context, msg);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_body(context), Chargement(isVisible)],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        children: [
          _titre_widget(),
          _formulaire_widget(),
          _button_widget(),

          // _copyWidget()
        ],
      ),
    );
  }

  Widget _titre_widget() {
    return Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 300,

          child: Container(
            padding: EdgeInsets.only(top: 90,),
            color: Colors.black.withOpacity(.65),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Welcome to",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 49,
                            )
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          text: "Scan Check",
                            style: GoogleFonts.lato(
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold,
                                fontSize: 38
                            ),
                        ),
                      ),
                    ],

                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _formulaire_widget() {
    return Positioned(
        top: 250,
        child: Container(
          padding: EdgeInsets.all(20),
          height: 400,
          width: MediaQuery.of(context).size.width - 40,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5)
              ]),
          child: Column(
            children: [
              Text(
                "Authentification",
                style: TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    fontFamily: "Schyler"),
              ),
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 5,right: 5,left: 5),
                child: ChampSaisie(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "votre adresse email*";
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Entrez une addresse valide*';
                    }
                    return null;
                  },
                  label: "Email",

                  ctrl: emailLogin,
                  prefixIcon: Icons.email,
                  type: TextInputType.emailAddress,
                  required: true,
                  isPassword: false,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 5,right: 5,left: 5),
                child: ChampSaisie(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "votre mot de passe*";
                      }
                      return null;
                    },
                    ctrl: passwordLogin,
                    label: "Mot de passe",
                    prefixIcon: Icons.lock,
                    type: TextInputType.text,
                    isPassword: true,
                    required: true),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                      value: isRememberMe,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          isRememberMe = !isRememberMe;
                        });
                      }),
                  Text(
                    "Rester connecté",
                    style: TextStyle(color: Colors.cyan),
                  ),
                  GestureDetector(
                    child: Text(
                      "Mot de passe oublié?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    onTap: () {

                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _button_widget() {
    return Positioned(
      top: 545,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          width: 200,
          height: 81,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: () => LoginPressed(),
            child: Text(
              "Se connecter",
              style: TextStyle(
                  color:Colors.cyan,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Schyler',
                  fontSize: 19),
            ),
          ),
        ),
      ),
    );
  }





}
