import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'tela_acesso_model.dart';
import 'tela_login_widget.dart'; 

class TelaAcessoWidget extends StatefulWidget {
  const TelaAcessoWidget({Key? key}) : super(key: key);

  @override
  State<TelaAcessoWidget> createState() => _TelaAcessoWidgetState();
}

class _TelaAcessoWidgetState extends State<TelaAcessoWidget> {
  late TelaAcessoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaAcessoModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Container(
                    width: 327,
                    height: 449,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Casual-6.png',
                        ).image,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  'Seja bem-vindo!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF729487),
                        fontSize: 22,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Text(
                  'Como deseja acessar?',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF5B7669),
                        fontSize: 15,
                        letterSpacing: 0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Login com Google',
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    size: 20,
                  ),
                  options: FFButtonOptions(
                    width: 380,
                    height: 45,
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF729487),
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
              Padding(
  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
  child: FFButtonWidget(
    onPressed: () async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLoginWidget()));
    },
    text: 'Outras formas',
    options: FFButtonOptions(
      width: 380,
      height: 45,
      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      color: FlutterFlowTheme.of(context).secondaryBackground,
      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
        fontFamily: 'Montserrat',
        color: Color(0xFF729487),
        letterSpacing: 0,
      ),
      elevation: 3,
      borderSide: BorderSide(
        color: Color(0xFF729487),
        width: 2,
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
