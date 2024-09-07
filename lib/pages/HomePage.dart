import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../utils/Routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> _data = [];
  PlatformFile? selectedFile;
  String? filePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange,
              Colors.yellow,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenue Mr l'administrateur",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.QrCodeScannerRoute);
                        },
                        icon: Icon(Icons.qr_code_scanner),
                        label: Text('Scanner'),

                      ),  SizedBox(height: 10,),
                      ElevatedButton.icon(
                        onPressed: () async {
                           _pickFile();
                        },
                        icon: Icon(Icons.file_upload),
                        label: Text('Importer csv'),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.update),
                        label: Text('Mettre à jour'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [



                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _pickFile () async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    print(result);
  }
}