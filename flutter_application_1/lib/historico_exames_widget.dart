import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'historico_exames_model.dart';
export 'historico_exames_model.dart';

class HistoricoExamesWidget extends StatefulWidget {
  const HistoricoExamesWidget({super.key});

  @override
  State<HistoricoExamesWidget> createState() => _HistoricoExamesWidgetState();
}

class _HistoricoExamesWidgetState extends State<HistoricoExamesWidget> {
  late HistoricoExamesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoricoExamesModel());
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
          backgroundColor: Color(0xFF729487),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0, 0),
            child: FlutterFlowIconButton(
              borderRadius: 20,
              borderWidth: 1,
              buttonSize: 40,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 24,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
              child: Text(
                'Histórico de Exames',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 0,
                    ),
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
                      child: Text(
                        'Exames Realizados',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              StreamBuilder<List<ExameRecord>>(
                stream: queryExameRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<ExameRecord> listViewExameRecordList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewExameRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewExameRecord =
                          listViewExameRecordList[listViewIndex];
                      return Container(
                        width: 100,
                        height: 76,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        listViewExameRecord.nomeExame,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                      Text(
                                        dateTimeFormat(
                                          'd/M/y',
                                          listViewExameRecord.dataExame!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          200, 0, 0, 0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Color(0xFF3A514A),
                                        borderRadius: 8,
                                        borderWidth: 2,
                                        buttonSize: 40,
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color(0xFF3A514A),
                                          size: 24,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed('tela_exames');
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                              color: Color(0xFF3A514A),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
                child: FlutterFlowIconButton(
                  borderColor: Color(0xFF729487),
                  borderRadius: 40,
                  borderWidth: 2,
                  buttonSize: 60,
                  fillColor: Color(0x65729487),
                  icon: Icon(
                    Icons.add,
                    color: Color(0xFF3A514A),
                    size: 40,
                  ),
                  onPressed: () async {
                    context.pushNamed('resultados_exames');
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 500, 0, 0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 35,
                    borderWidth: 1,
                    buttonSize: 75,
                    fillColor: Color(0x7A5B7669),
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 50,
                    ),
                    onPressed: () async {
                      context.pushNamed('resultados_exames');
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
