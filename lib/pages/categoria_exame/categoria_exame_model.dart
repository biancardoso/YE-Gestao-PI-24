import '/flutter_flow/flutter_flow_util.dart';
import 'categoria_exame_widget.dart' show CategoriaExameWidget;
import 'package:flutter/material.dart';

class CategoriaExameModel extends FlutterFlowModel<CategoriaExameWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
