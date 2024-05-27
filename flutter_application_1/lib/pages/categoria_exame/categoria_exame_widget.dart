import 'package:flutter/material.dart';
import 'package:yegestao/index.dart';
import 'package:yegestao/pages/categoria_exame/categoria_exame_model.dart';

import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_model.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
class CategoriaExameWidget extends StatefulWidget {
  const CategoriaExameWidget({super.key});

  @override
  State<CategoriaExameWidget> createState() => _CategoriaExameWidgetState();
}

class _CategoriaExameWidgetState extends State<CategoriaExameWidget> {
  List<String> listCategory = [
    'Hemograma',
    'Colonoscopia',
    'Papanicolau'
  ];
  late CategoriaExameModel _model;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriaExameModel());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 24.0,
          ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ),
      title: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 0.0),
          child: Text(
            'Categoria Exame',
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 10.0),
                    child: Text(
                      'Exames Realizados',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listCategory.length,
              itemBuilder: (context, listViewIndex) {
                final categoria =
                listCategory[listViewIndex];
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
                                  categoria,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const HistoricoExamesWidget()),
                                    );
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
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 35.0,
                  borderWidth: 1.0,
                  buttonSize: 75.0,
                  fillColor: const Color(0x7A5B7669),
                  icon: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 50.0,
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ResultadosExamesWidget()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
