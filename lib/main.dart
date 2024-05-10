import 'package:flutter/material.dart';
import 'tela_inicial_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TelaInicialWidget(),
    
    );
  }
}
// import 'package:flutter/material.dart';
// import 'tela_inicial_widget.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Image from assets"),
//         ),
//         body: Image.asset('assets/image/principalLogo.jpg'), //   <--- image
//       ),      
//     );
//   }
// }