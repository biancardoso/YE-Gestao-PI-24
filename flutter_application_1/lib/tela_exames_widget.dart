import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'tela_exames_model.dart';
export 'tela_exames_model.dart';

class TelaExamesWidget extends StatefulWidget {
  const TelaExamesWidget({super.key});

  @override
  State<TelaExamesWidget> createState() => _TelaExamesWidgetState();
}

class _TelaExamesWidgetState extends State<TelaExamesWidget> {
  late TelaExamesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaExamesModel());
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
          leading: FlutterFlowIconButton(
            borderRadius: 20,
            borderWidth: 1,
            buttonSize: 40,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 30,
            ),
            // onPressed: () async {
            //   context.pushNamed('homepage');
            // },
          ),
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
              child: Text(
                'Histórico de Exames',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 30, 5, 0),
                child: StreamBuilder<List<ExameRecord>>(
                  stream: queryExameRecord(
                    queryBuilder: (exameRecord) =>
                        exameRecord.orderBy('data_exame', descending: true),
                    singleRecord: true,
                  ),
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
                    List<ExameRecord> containerExameRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerExameRecord =
                        containerExameRecordList.isNotEmpty
                            ? containerExameRecordList.first
                            : null;
                    return Container(
                      width: 392,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Color(0x9E729487),
                          width: 3,
                        ),
                      ),
                      child: Text(
                        valueOrDefault<String>(
                          containerExameRecord?.dataExame?.toString(),
                          'data',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                child: StreamBuilder<List<ExameRecord>>(
                  stream: queryExameRecord(
                    queryBuilder: (exameRecord) =>
                        exameRecord.orderBy('resultado'),
                    singleRecord: true,
                  ),
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
                    List<ExameRecord> containerExameRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerExameRecord =
                        containerExameRecordList.isNotEmpty
                            ? containerExameRecordList.first
                            : null;
                    return Container(
                      width: 392,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Color(0x9E729487),
                          width: 3,
                        ),
                      ),
                      child: Text(
                        valueOrDefault<String>(
                          containerExameRecord?.resultado?.toString(),
                          'resultado',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
