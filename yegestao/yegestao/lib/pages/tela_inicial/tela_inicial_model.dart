import '/flutter_flow/flutter_flow_util.dart';
import 'tela_inicial_widget.dart' show TelaInicialWidget;
import 'package:flutter/material.dart';

class TelaInicialModel extends FlutterFlowModel<TelaInicialWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
