import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'historico_consulta_model.dart';
export 'historico_consulta_model.dart';

class HistoricoConsultaWidget extends StatefulWidget {
  const HistoricoConsultaWidget({
    super.key,
    required this.nomeConsulta,
    required this.data,
    required this.resumo,
  });

  final ConsultasRecord? nomeConsulta;
  final ConsultasRecord? data;
  final ConsultasRecord? resumo;

  @override
  State<HistoricoConsultaWidget> createState() =>
      _HistoricoConsultaWidgetState();
}

class _HistoricoConsultaWidgetState extends State<HistoricoConsultaWidget> {
  late HistoricoConsultaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoricoConsultaModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF729487),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
              child: Text(
                'Consultas',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(5.0, 30.0, 5.0, 0.0),
                    child: Container(
                      width: 400.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                          color: const Color(0xFF729487),
                          width: 2.0,
                        ),
                      ),
                      child: Text(
                        valueOrDefault<String>(
                          widget.nomeConsulta?.especialidade,
                          'nome',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(5.0, 100.0, 5.0, 0.0),
                    child: Container(
                      width: 400.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                          color: const Color(0xFF729487),
                          width: 2.0,
                        ),
                      ),
                      child: Text(
                        valueOrDefault<String>(
                          widget.data?.dia?.toString(),
                          '10/06/2024',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 170.0, 5.0, 0.0),
                child: Container(
                  width: 400.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(
                      color: const Color(0xFF729487),
                      width: 2.0,
                    ),
                  ),
                  child: Text(
                    valueOrDefault<String>(
                      widget.resumo?.resumo,
                      'resumo',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}