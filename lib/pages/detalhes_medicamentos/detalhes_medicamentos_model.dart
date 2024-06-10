import '/flutter_flow/flutter_flow_util.dart';
import 'detalhes_medicamentos_widget.dart' show DetalhesMedicamentosWidget;
import 'package:flutter/material.dart';

class DetalhesMedicamentosModel
    extends FlutterFlowModel<DetalhesMedicamentosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
