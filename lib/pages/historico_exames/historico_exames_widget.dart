import 'package:firebase_storage/firebase_storage.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'historico_exames_model.dart';
export 'historico_exames_model.dart';

class HistoricoExamesWidget extends StatefulWidget {
  String categoria;

  HistoricoExamesWidget({super.key, required this.categoria});

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
      onTap: () =>
      _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme
            .of(context)
            .primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF729487),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme
                    .of(context)
                    .secondaryBackground,
                size: 24.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  0.0, 0.0, 40.0, 0.0),
              child: Text(
                'Histórico de Exames',
                style: FlutterFlowTheme
                    .of(context)
                    .headlineMedium
                    .override(
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(
                          0.0, 30.0, 0.0, 10.0),
                      child: Text(
                        'Exames Realizados',
                        style: FlutterFlowTheme
                            .of(context)
                            .bodyMedium
                            .override(
                          fontFamily: 'Readex Pro',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
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
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme
                                .of(context)
                                .primary,
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
                      return (widget.categoria.toUpperCase() ==
                          listViewExameRecord.nomeExame.toUpperCase())
                          ? Container(
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
                                        listViewExameRecord.resultado
                                            .toString(),
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                      Text(
                                        dateTimeFormat(
                                          'd/M/y',
                                          listViewExameRecord.dataExame!,
                                          locale: FFLocalizations
                                              .of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(
                                        0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional
                                          .fromSTEB(
                                          200.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: const Color(0xFF3A514A),
                                        borderRadius: 8.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: const Icon(
                                          Icons.image,
                                          color: Color(0xFF3A514A),
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          if (listViewExameRecord.idImagem.isNotEmpty) {
                                            String downloadURL = await FirebaseStorage
                                                .instance
                                                .ref()
                                                .child(
                                                "${listViewExameRecord.idImagem}.jpg")
                                                .getDownloadURL();
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Imagem Exibida'),
                                                  content: Image.network(
                                                      downloadURL),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text('Fechar'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
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
                      )
                          : Container();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
