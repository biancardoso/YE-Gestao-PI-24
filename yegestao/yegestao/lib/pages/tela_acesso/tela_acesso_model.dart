import '/flutter_flow/flutter_flow_util.dart';
import 'tela_acesso_widget.dart' show TelaAcessoWidget;
import 'package:flutter/material.dart';

class TelaAcessoModel extends FlutterFlowModel<TelaAcessoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
