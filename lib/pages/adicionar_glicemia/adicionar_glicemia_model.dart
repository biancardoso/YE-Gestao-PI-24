import '/flutter_flow/flutter_flow_util.dart';
import 'adicionar_glicemia_widget.dart' show AdicionarGlicemiaWidget;
import 'package:flutter/material.dart';

class AdicionarGlicemiaModel extends FlutterFlowModel<AdicionarGlicemiaWidget> {
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
