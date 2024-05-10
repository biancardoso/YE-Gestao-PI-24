import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';

class ScannerPage extends StatefulWidget {
  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  List<File> _scannedImages = [];

  Future<void> _scanDocument() async {
  final imagesPath = await CunningDocumentScanner.getPictures();
  if (imagesPath != null) {
    List<File> images = imagesPath.map((path) => File(path)).toList();
    setState(() {
      _scannedImages = images;
    });
  } else {
    // Tratar o caso em que imagesPath é nulo, se necessário
  }
}

  Future<void> _createPdf() async {
    // Implementação para criar o PDF a partir das imagens
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            onPressed: _scanDocument,
            child: Text('Scan Document'),
          ),
          if (_scannedImages.isNotEmpty) ...[
            Expanded(
              child: ListView.builder(
                itemCount: _scannedImages.length,
                itemBuilder: (context, index) {
                  return Image.file(_scannedImages[index]);
                },
              ),
            ),
            ElevatedButton(
              onPressed: _createPdf,
              child: Text('Create PDF'),
            ),
          ],
        ],
      ),
    );
  }
}