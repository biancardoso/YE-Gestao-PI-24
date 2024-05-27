import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tela_inicial_model.dart';
export 'tela_inicial_model.dart';

class TelaInicialWidget extends StatefulWidget {
  const TelaInicialWidget({super.key});

  @override
  State<TelaInicialWidget> createState() => _TelaInicialWidgetState();
}

class _TelaInicialWidgetState extends State<TelaInicialWidget> {
  late TelaInicialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaInicialModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF729487),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Gardenia_Fashion_Brand_Art_Design_Logo.png',
                width: 500.0,
                height: 450.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
