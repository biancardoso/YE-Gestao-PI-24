import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import 'RegistroConsultaModel.dart';
export 'RegistroConsultaModel.dart';

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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
          title: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Registro de Consulta',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 0,
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
                Icons.search,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24,
              ),
              onPressed: () async {
                safeSetState(() {
                  _model.simpleSearchResults = TextSearch(List.generate(
                              random_data.randomInteger(5, 30),
                              (index) => random_data.randomName(true, true))
                          .map((str) => TextSearchItem.fromTerms(str, [str]))
                          .toList())
                      .search('consulta')
                      .map((r) => r.object)
                      .toList();
                  ;
                });
              },
            ),
            FlutterFlowIconButton(
              borderRadius: 20,
              borderWidth: 1,
              buttonSize: 40,
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24,
              ),
              onPressed: () async {
                context.pushNamed('detalhes_consulta');
              },
            ),
          ],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Opacity(
                opacity: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
              Text(
                'Selecione o dia da sua consulta:',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Opacity(
                opacity: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
              FlutterFlowCalendar(
                color: Color(0xFF729487),
                iconColor: FlutterFlowTheme.of(context).secondaryText,
                weekFormat: false,
                weekStartsMonday: false,
                rowHeight: 64,
                onChange: (DateTimeRange? newSelectedDate) {
                  setState(() => _model.calendarSelectedDay = newSelectedDate);
                },
                titleStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0,
                    ),
                dayOfWeekStyle:
                    FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Montserrat',
                          letterSpacing: 0,
                        ),
                dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
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
              Text(
                'Ou digite a data',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      letterSpacing: 0,
                    ),
              ),
              Opacity(
                opacity: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          textCapitalization: TextCapitalization.none,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Label here...',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0,
                                  ),
                          keyboardType: TextInputType.datetime,
                          cursorColor: Color(0xFF729487),
                          validator: _model.textControllerValidator
                              .asValidator(context),
                          inputFormatters: [_model.textFieldMask],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
              Opacity(
                opacity: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
              Opacity(
                opacity: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
              Opacity(
                opacity: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
              Container(
                width: 402,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF729487),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
