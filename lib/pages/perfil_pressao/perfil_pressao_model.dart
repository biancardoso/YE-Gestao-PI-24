import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_pressao_widget.dart' show PerfilPressaoWidget;
import 'package:flutter/material.dart';

class PerfilPressaoModel extends FlutterFlowModel<PerfilPressaoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
