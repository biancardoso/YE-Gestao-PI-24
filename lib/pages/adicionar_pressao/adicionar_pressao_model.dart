import '/flutter_flow/flutter_flow_util.dart';
import 'adicionar_pressao_widget.dart' show AdicionarPressaoWidget;
import 'package:flutter/material.dart';

class AdicionarPressaoModel extends FlutterFlowModel<AdicionarPressaoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
