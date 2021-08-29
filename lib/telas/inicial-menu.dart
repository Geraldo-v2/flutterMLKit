import 'package:flutter/material.dart';
import 'package:flutterkit/widgets/options-menu.dart';
import 'package:flutterkit/telas/extracao-texto.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Extrator de texto'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(43, 43, 43, 1.0),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(80, 80, 80, 80),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: MenuItem(
                  'assets/icone-menu-imagem.png',
                  'ENTRAR',
                  Color.fromRGBO(0, 176, 240, 1.0),
                  ExtratorTextoImagem(),
                ),
              ),
              Text(
                'App Desenvolvido',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Para Pós-graduação DevWeb',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromRGBO(0, 176, 240, 1.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
