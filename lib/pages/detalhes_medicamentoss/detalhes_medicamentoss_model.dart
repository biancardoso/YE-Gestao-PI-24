import '/flutter_flow/flutter_flow_util.dart';
import 'detalhes_medicamentoss_widget.dart' show DetalhesMedicamentossWidget;
import 'package:flutter/material.dart';

class DetalhesMedicamentossModel
    extends FlutterFlowModel<DetalhesMedicamentossWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
