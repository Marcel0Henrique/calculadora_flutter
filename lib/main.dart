import 'dart:io';
import 'package:calculadora_flutter/views/home.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Fixar tamanho da janela

  //* Verifica se a plataforma é android

  if (Platform.isAndroid || Platform.isIOS) {
    runApp(const MyApp());
  } else {
    setWindowTitle("Calculadora Flutter");
    setWindowMaxSize(const Size(350, 550));
    setWindowMinSize(const Size(350, 550));
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
    );
  }
}
