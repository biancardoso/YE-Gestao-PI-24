// import 'package:flutterflow_ui/flutterflow_ui.dart';
// import 'tela_inicial_widget.dart' show TelaInicialWidget;
// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class TelaInicialModel {
  final unfocusNode = FocusNode();

  void dispose() {
    unfocusNode.dispose();
  }
}

