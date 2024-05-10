import 'package:flutter/material.dart';
import 'tela_inicial_model.dart';
import 'tela_acesso_widget.dart'; // Importe a página para a qual deseja navegar

class TelaInicialWidget extends StatefulWidget {
  const TelaInicialWidget({Key? key}) : super(key: key);

  @override
  State<TelaInicialWidget> createState() => _TelaInicialWidgetState();
}

class _TelaInicialWidgetState extends State<TelaInicialWidget> {
  late TelaInicialModel _model;

  @override
  void initState() {
    super.initState();
    _model = TelaInicialModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_model.unfocusNode.canRequestFocus) {
          FocusScope.of(context).requestFocus(_model.unfocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF729487),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/image/principalLogo.jpg',
                  width: 500,
                  height: 450,
                  fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaAcessoWidget()),
                    );
                  },
                  child: Text('Ir para a Segunda Página'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
