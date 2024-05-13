import 'package:flutter_application_1/detalhes_consulta.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';


import 'registro_consulta_model.dart';
export 'registro_consulta_model.dart';

class RegistroConsultaWidget extends StatefulWidget {
  const RegistroConsultaWidget({super.key});

  @override
  State<RegistroConsultaWidget> createState() => _RegistroConsultaWidgetState();
}

class _RegistroConsultaWidgetState extends State<RegistroConsultaWidget> {
  late RegistroConsultaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistroConsultaModel());
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
              size: 24,
            ),
            // onPressed: () async {
            //   context.pushNamed('homepage'); adicionar a home depois!!
            // },
          ),
          title: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 3, 0),
                  child: Text(
                    'Consultas',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 22,
                          letterSpacing: 0,
                        ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 20,
              borderWidth: 1,
              buttonSize: 40,
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 24,
              ),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetalhesConsultaWidget()));
              },
            ),
          ],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(3, 50, 3, 0),
                child: Container(
                  width: 393,
                  height: 497,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0x9E729487),
                      width: 3,
                    ),
                  ),
                  child: Stack(
                    children: [
                      FlutterFlowCalendar(
                        color: Color(0xFF729487),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        weekFormat: false,
                        weekStartsMonday: true,
                        initialDate: getCurrentTimestamp,
                        rowHeight: 64,
                        onChange: (DateTimeRange? newSelectedDate) {
                          setState(() =>
                              _model.calendarSelectedDay = newSelectedDate);
                        },
                        titleStyle:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                ),
                        dayOfWeekStyle:
                            FlutterFlowTheme.of(context).labelLarge.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                        dateStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                        selectedDateStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                        inactiveDateStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.01, 0.82),
                        child: Text(
                          dateTimeFormat(
                            'MMMMEEEEd',
                            _model.calendarSelectedDay!.start,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    'Selecione uma data:',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 18,
                          letterSpacing: 0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.01, 0.78),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetalhesConsultaWidget()));
                  },
                  text: 'Adicionar nova consulta',
                  options: FFButtonOptions(
                    height: 40,
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF3A514A),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 0,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
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
