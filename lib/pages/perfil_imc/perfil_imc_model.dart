import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_imc_widget.dart' show PerfilImcWidget;
import 'package:flutter/material.dart';

class PerfilImcModel extends FlutterFlowModel<PerfilImcWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
