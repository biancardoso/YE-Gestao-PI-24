import 'resultados_exames_widget.dart' show ResultadosExamesWidget;
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class ResultadosExamesModel extends FlutterFlowModel<ResultadosExamesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nomeExame widget.
  FocusNode? nomeExameFocusNode;
  TextEditingController? nomeExameTextController;
  String? Function(BuildContext, String?)? nomeExameTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for resultado widget.
  FocusNode? resultadoFocusNode;
  TextEditingController? resultadoTextController;
  String? Function(BuildContext, String?)? resultadoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nomeExameFocusNode?.dispose();
    nomeExameTextController?.dispose();

    resultadoFocusNode?.dispose();
    resultadoTextController?.dispose();
  }
}
