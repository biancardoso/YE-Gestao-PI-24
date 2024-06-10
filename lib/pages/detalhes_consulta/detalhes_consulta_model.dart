import '/flutter_flow/flutter_flow_util.dart';
import 'detalhes_consulta_widget.dart' show DetalhesConsultaWidget;
import 'package:flutter/material.dart';

class DetalhesConsultaModel extends FlutterFlowModel<DetalhesConsultaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked1;
  // State field(s) for especialidade widget.
  FocusNode? especialidadeFocusNode;
  TextEditingController? especialidadeTextController;
  String? Function(BuildContext, String?)? especialidadeTextControllerValidator;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for resumo widget.
  FocusNode? resumoFocusNode;
  TextEditingController? resumoTextController;
  String? Function(BuildContext, String?)? resumoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    especialidadeFocusNode?.dispose();
    especialidadeTextController?.dispose();

    resumoFocusNode?.dispose();
    resumoTextController?.dispose();
  }
}
