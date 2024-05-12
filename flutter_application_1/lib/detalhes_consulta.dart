import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'detalhes_consulta_model.dart';
export 'detalhes_consulta_model.dart';

class DetalhesConsultaWidget extends StatefulWidget {
  const DetalhesConsultaWidget({super.key});

  @override
  State<DetalhesConsultaWidget> createState() => _DetalhesConsultaWidgetState();
}

class _DetalhesConsultaWidgetState extends State<DetalhesConsultaWidget> {
  late DetalhesConsultaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesConsultaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final _datePicked1Date = await showDatePicker(
        context: context,
        initialDate: getCurrentTimestamp,
        firstDate: getCurrentTimestamp,
        lastDate: DateTime(2050),
        builder: (context, child) {
          return wrapInMaterialDatePickerTheme(
            context,
            child!,
            headerBackgroundColor: FlutterFlowTheme.of(context).primary,
            headerForegroundColor: FlutterFlowTheme.of(context).info,
            headerTextStyle:
                FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Outfit',
                      fontSize: 32,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
            pickerBackgroundColor:
                FlutterFlowTheme.of(context).secondaryBackground,
            pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
            selectedDateTimeBackgroundColor:
                FlutterFlowTheme.of(context).primary,
            selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
            actionButtonForegroundColor:
                FlutterFlowTheme.of(context).primaryText,
            iconSize: 24,
          );
        },
      );

      if (_datePicked1Date != null) {
        safeSetState(() {
          _model.datePicked1 = DateTime(
            _datePicked1Date.year,
            _datePicked1Date.month,
            _datePicked1Date.day,
          );
        });
      }
    });

    _model.especialidadeTextController ??= TextEditingController();
    _model.especialidadeFocusNode ??= FocusNode();

    _model.resumoTextController ??= TextEditingController();
    _model.resumoFocusNode ??= FocusNode();
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
              context.pushNamed('registro_consulta');
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
              child: Text(
                'Detalhes da consulta',
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 85, 5, 0),
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
                      controller: _model.especialidadeTextController,
                      focusNode: _model.especialidadeFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                        hintText: 'Escreva aqui..',
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
                      validator: _model.especialidadeTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.92, -0.83),
                child: Text(
                  'Especialidade:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 18,
                        letterSpacing: 0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.93, -0.52),
                child: Text(
                  'Data:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 18,
                        letterSpacing: 0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.4),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final _datePicked2Date = await showDatePicker(
                        context: context,
                        initialDate: getCurrentTimestamp,
                        firstDate: getCurrentTimestamp,
                        lastDate: DateTime(2050),
                        builder: (context, child) {
                          return wrapInMaterialDatePickerTheme(
                            context,
                            child!,
                            headerBackgroundColor: Color(0x9E729487),
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
                            pickerBackgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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

                      if (_datePicked2Date != null) {
                        safeSetState(() {
                          _model.datePicked2 = DateTime(
                            _datePicked2Date.year,
                            _datePicked2Date.month,
                            _datePicked2Date.day,
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
                            alignment: AlignmentDirectional(-0.81, -0.08),
                            child: Text(
                              dateTimeFormat(
                                'MMMMEEEEd',
                                _model.datePicked2,
                                locale:
                                    FFLocalizations.of(context).languageCode,
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
                            alignment: AlignmentDirectional(0.9, 0.01),
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
              ),
              Align(
                alignment: AlignmentDirectional(8, -0.18),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 80, 5, 0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final _datePicked3Time = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                        builder: (context, child) {
                          return wrapInMaterialTimePickerTheme(
                            context,
                            child!,
                            headerBackgroundColor:
                                FlutterFlowTheme.of(context).primary,
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
                            pickerBackgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            pickerForegroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            selectedDateTimeBackgroundColor: Color(0xFF3A514A),
                            selectedDateTimeForegroundColor:
                                FlutterFlowTheme.of(context).info,
                            actionButtonForegroundColor:
                                FlutterFlowTheme.of(context).primaryText,
                            iconSize: 24,
                          );
                        },
                      );
                      if (_datePicked3Time != null) {
                        safeSetState(() {
                          _model.datePicked3 = DateTime(
                            getCurrentTimestamp.year,
                            getCurrentTimestamp.month,
                            getCurrentTimestamp.day,
                            _datePicked3Time.hour,
                            _datePicked3Time.minute,
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
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.94, -0.18),
                child: Text(
                  'Horário:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 18,
                        letterSpacing: 0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.86, -0.04),
                child: FlutterFlowIconButton(
                  borderColor: Color(0xFF729487),
                  borderRadius: 8,
                  borderWidth: 2,
                  buttonSize: 40,
                  icon: Icon(
                    Icons.access_time_filled_outlined,
                    color: Color(0xFF729487),
                    size: 24,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.77, -0.04),
                child: Text(
                  dateTimeFormat(
                    'Hm',
                    _model.datePicked3,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.92, 0.13),
                child: Text(
                  'Resumo da consulta:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 18,
                        letterSpacing: 0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.93, 0.34),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                  child: Container(
                    width: 392,
                    height: 80,
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
                        controller: _model.resumoTextController,
                        focusNode: _model.resumoFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                          hintText: 'Escreva aqui..',
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
                        maxLines: null,
                        minLines: 1,
                        validator: _model.resumoTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.09, 0.83),
                child: FFButtonWidget(
                  onPressed: () async {
                    unawaited(
                      () async {
                        await ConsultasRecord.collection
                            .doc()
                            .set(createConsultasRecordData(
                              resumo: _model.resumoTextController.text,
                              dia: _model.datePicked2,
                              horarioConsulta: _model.datePicked3,
                              status: false,
                              especialidade:
                                  _model.especialidadeTextController.text,
                            ));
                      }(),
                    );
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Informação'),
                          content: Text('Consulta adicionada com sucesso'),
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

                    context.pushNamed('registro_consulta');
                  },
                  text: 'Registrar consulta',
                  options: FFButtonOptions(
                    width: 300,
                    height: 40,
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF3A514A),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
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

