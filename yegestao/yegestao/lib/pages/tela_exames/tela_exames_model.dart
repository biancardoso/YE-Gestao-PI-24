import '/flutter_flow/flutter_flow_util.dart';
import 'tela_exames_widget.dart' show TelaExamesWidget;
import 'package:flutter/material.dart';

class TelaExamesModel extends FlutterFlowModel<TelaExamesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
