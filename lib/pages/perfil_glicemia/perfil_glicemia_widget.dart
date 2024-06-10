import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'perfil_glicemia_model.dart';
export 'perfil_glicemia_model.dart';

class PerfilGlicemiaWidget extends StatefulWidget {
  const PerfilGlicemiaWidget({super.key});

  @override
  State<PerfilGlicemiaWidget> createState() => _PerfilGlicemiaWidgetState();
}

class _PerfilGlicemiaWidgetState extends State<PerfilGlicemiaWidget> {
  late PerfilGlicemiaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilGlicemiaModel());
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
            borderRadius: 0.0,
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
            alignment: const AlignmentDirectional(-0.29, 0.0),
            child: Text(
              'Glicemia',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Text(
                  'Últimos resultados ',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: StreamBuilder<List<AfericoesRecord>>(
                  stream: queryAfericoesRecord(
                    queryBuilder: (afericoesRecord) =>
                        afericoesRecord.orderBy('glicose'),
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
                    List<AfericoesRecord> listViewAfericoesRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewAfericoesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewAfericoesRecord =
                            listViewAfericoesRecordList[listViewIndex];
                        return Container(
                          width: 100.0,
                          height: 76.0,
                          decoration: const BoxDecoration(),
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
                                          listViewAfericoesRecord.glicose
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                            'd/M/y',
                                            listViewAfericoesRecord.dataG!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            200.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: const Color(0xFF3A514A),
                                          borderRadius: 8.0,
                                          borderWidth: 2.0,
                                          buttonSize: 40.0,
                                          icon: const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Color(0xFF3A514A),
                                            size: 24.0,
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
                              const Divider(
                                thickness: 1.0,
                                indent: 20.0,
                                endIndent: 20.0,
                                color: Color(0xFF3A514A),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 40.0,
                    borderWidth: 2.0,
                    buttonSize: 60.0,
                    fillColor: const Color(0x9E729487),
                    icon: const Icon(
                      Icons.add,
                      color: Color(0xFF3A514A),
                      size: 40.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('adicionar_glicemia');
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
