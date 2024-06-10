import '/flutter_flow/flutter_flow_util.dart';
import 'historico_consulta_widget.dart' show HistoricoConsultaWidget;
import 'package:flutter/material.dart';

class HistoricoConsultaModel extends FlutterFlowModel<HistoricoConsultaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
