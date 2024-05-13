
import 'package:flutterflow_ui/flutterflow_ui.dart';

import 'historico_exames.dart' show HistoricoExamesWidget;
import 'package:flutter/material.dart';


class HistoricoExamesModel extends FlutterFlowModel<HistoricoExamesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

