import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'detalhes_medicamentos_model.dart';
export 'detalhes_medicamentos_model.dart';

class DetalhesMedicamentosWidget extends StatefulWidget {
  const DetalhesMedicamentosWidget({
    super.key,
    required this.nomeMedicamento,
  });

  final DocumentReference? nomeMedicamento;

  @override
  State<DetalhesMedicamentosWidget> createState() =>
      _DetalhesMedicamentosWidgetState();
}

class _DetalhesMedicamentosWidgetState
    extends State<DetalhesMedicamentosWidget> {
  late DetalhesMedicamentosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesMedicamentosModel());
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
          leading: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
              ),
            ],
          ),
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 0.0),
              child: Text(
                'Medicamentos',
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
              Align(
                alignment: const AlignmentDirectional(0.0, -1.34),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      5.0, 120.0, 5.0, 0.0),
                  child: StreamBuilder<List<AdicionarMedicamentoRecord>>(
                    stream: queryAdicionarMedicamentoRecord(
                      queryBuilder: (adicionarMedicamentoRecord) =>
                          adicionarMedicamentoRecord
                              .orderBy('nome_medicamento'),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<AdicionarMedicamentoRecord>
                          containerAdicionarMedicamentoRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final containerAdicionarMedicamentoRecord =
                          containerAdicionarMedicamentoRecordList.isNotEmpty
                              ? containerAdicionarMedicamentoRecordList.first
                              : null;
                      return Container(
                        width: 391.0,
                        height: 54.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: const Color(0xFF729487),
                            width: 2.0,
                          ),
                        ),
                        child: Text(
                          valueOrDefault<String>(
                            containerAdicionarMedicamentoRecord
                                ?.nomeMedicamento,
                            'nome',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.06, -0.7),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: StreamBuilder<List<AdicionarMedicamentoRecord>>(
                    stream: queryAdicionarMedicamentoRecord(
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<AdicionarMedicamentoRecord>
                          containerAdicionarMedicamentoRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final containerAdicionarMedicamentoRecord =
                          containerAdicionarMedicamentoRecordList.isNotEmpty
                              ? containerAdicionarMedicamentoRecordList.first
                              : null;
                      return Container(
                        width: 391.0,
                        height: 54.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: const Color(0xFF729487),
                            width: 2.0,
                          ),
                        ),
                        child: Text(
                          valueOrDefault<String>(
                            containerAdicionarMedicamentoRecord
                                ?.dosagemMedicacao,
                            'dosagem',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -0.85),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      5.0, 120.0, 5.0, 0.0),
                  child: StreamBuilder<List<AdicionarMedicamentoRecord>>(
                    stream: queryAdicionarMedicamentoRecord(
                      queryBuilder: (adicionarMedicamentoRecord) =>
                          adicionarMedicamentoRecord
                              .orderBy('nome_medicamento'),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<AdicionarMedicamentoRecord>
                          containerAdicionarMedicamentoRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final containerAdicionarMedicamentoRecord =
                          containerAdicionarMedicamentoRecordList.isNotEmpty
                              ? containerAdicionarMedicamentoRecordList.first
                              : null;
                      return Container(
                        width: 391.0,
                        height: 54.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: const Color(0xFF729487),
                            width: 2.0,
                          ),
                        ),
                        child: Text(
                          valueOrDefault<String>(
                            containerAdicionarMedicamentoRecord
                                ?.horarioMedicacao
                                ?.toString(),
                            'nome',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -0.63),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      5.0, 125.0, 5.0, 0.0),
                  child: StreamBuilder<List<AdicionarMedicamentoRecord>>(
                    stream: queryAdicionarMedicamentoRecord(
                      queryBuilder: (adicionarMedicamentoRecord) =>
                          adicionarMedicamentoRecord
                              .orderBy('nome_medicamento'),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<AdicionarMedicamentoRecord>
                          containerAdicionarMedicamentoRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final containerAdicionarMedicamentoRecord =
                          containerAdicionarMedicamentoRecordList.isNotEmpty
                              ? containerAdicionarMedicamentoRecordList.first
                              : null;
                      return Container(
                        width: 391.0,
                        height: 54.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: const Color(0xFF729487),
                            width: 2.0,
                          ),
                        ),
                        child: Text(
                          valueOrDefault<String>(
                            containerAdicionarMedicamentoRecord
                                ?.frequenciaDiaria,
                            'nome',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      );
                    },
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
