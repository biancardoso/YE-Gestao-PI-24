import '/flutter_flow/flutter_flow_util.dart';
import 'all_profiles_widget.dart' show AllProfilesWidget;
import 'package:flutter/material.dart';

class AllProfilesModel extends FlutterFlowModel<AllProfilesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}