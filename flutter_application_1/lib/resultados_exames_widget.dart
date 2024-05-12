import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';

import 'resultados_exames_model.dart';
export 'resultados_exames_model.dart';

class ResultadosExamesWidget extends StatefulWidget {
  const ResultadosExamesWidget({super.key});

  @override
  State<ResultadosExamesWidget> createState() => _ResultadosExamesWidgetState();
}

class _ResultadosExamesWidgetState extends State<ResultadosExamesWidget> {
  late ResultadosExamesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultadosExamesModel());

    _model.nomeExameTextController ??= TextEditingController();
    _model.nomeExameFocusNode ??= FocusNode();

    _model.resultadoTextController ??= TextEditingController();
    _model.resultadoFocusNode ??= FocusNode();
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
            onPressed: () async {
              context.pushNamed('tela_exames');
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
              child: Text(
                'Resultados ',
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 80, 0, 10),
                    child: Text(
                      'Exame realizado:',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                            letterSpacing: 0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Text(
                        'Insira corretamente os dados para registrar o exame',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Container(
                  width: 392,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Color(0x9E729487),
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: TextFormField(
                      controller: _model.nomeExameTextController,
                      focusNode: _model.nomeExameFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                        hintText: 'Digite aqui..',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                      validator: _model.nomeExameTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 25, 10),
                child: Text(
                  'Coloque a data em que o exame foi realizado',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        letterSpacing: 0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final _datePickedDate = await showDatePicker(
                      context: context,
                      initialDate: getCurrentTimestamp,
                      firstDate: getCurrentTimestamp,
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return wrapInMaterialDatePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor: Color(0xFF3A514A),
                          headerForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          headerTextStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Outfit',
                                fontSize: 32,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                          pickerBackgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          pickerForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          selectedDateTimeBackgroundColor: Color(0xFF729487),
                          selectedDateTimeForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          actionButtonForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          iconSize: 24,
                        );
                      },
                    );

                    if (_datePickedDate != null) {
                      safeSetState(() {
                        _model.datePicked = DateTime(
                          _datePickedDate.year,
                          _datePickedDate.month,
                          _datePickedDate.day,
                        );
                      });
                    }
                  },
                  child: Container(
                    width: 392,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Color(0x9E729487),
                        width: 3,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.88, -0.14),
                          child: Text(
                            dateTimeFormat(
                              'MMMMEEEEd',
                              _model.datePicked,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.88, 0.17),
                          child: FlutterFlowIconButton(
                            borderColor: Color(0xFF729487),
                            borderRadius: 8,
                            borderWidth: 2,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.calendar_today,
                              color: Color(0xFF729487),
                              size: 24,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 150, 10),
                child: Text(
                  'Coloque o resultado do exame',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        letterSpacing: 0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Container(
                  width: 392,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Color(0x9E729487),
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: TextFormField(
                      controller: _model.resultadoTextController,
                      focusNode: _model.resultadoFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                        hintText: 'Coloque o resultado',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                      validator: _model.resultadoTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Adicionar laudo do exame',
                    options: FFButtonOptions(
                      width: 350,
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF729487),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await ExameRecord.collection
                        .doc()
                        .set(createExameRecordData(
                          nomeExame: _model.nomeExameTextController.text,
                          dataExame: _model.datePicked,
                          resultado: double.tryParse(
                              _model.resultadoTextController.text),
                          status: false,
                        ));
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Informação'),
                          content: Text('Exame adicionado'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );

                    context.pushNamed('historico_exames');
                  },
                  text: 'Registrar resultado de exame',
                  options: FFButtonOptions(
                    width: 350,
                    height: 40,
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF3A514A),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
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
