import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'dart:io';

class ExtratorTextoImagem extends StatefulWidget {
  @override
  _ExtratorTextoImagemState createState() => _ExtratorTextoImagemState();
}

class _ExtratorTextoImagemState extends State<ExtratorTextoImagem> {
  final Color _corPrimaria = Color.fromRGBO(0, 176, 240, 1.0);
  final Color _corSecundaria = Color.fromRGBO(251, 235, 239, 1);
  final _detectorTexto = GoogleMlKit.vision.textDetector();
  final ImagePicker _geradorImagem = ImagePicker();

  DecorationImage? _imagemTexto;
  String _resultado = '';
  bool _detectorTextoOcupado = false;

  void _detectarTextoImagem() async {
    if (_detectorTextoOcupado) return;

    PickedFile? imagem =
    await _geradorImagem.getImage(source: ImageSource.gallery);

    if (imagem != null) {
      File arquivo = File(imagem.path);

      setState(() {
        _imagemTexto =
            DecorationImage(image: FileImage(arquivo), fit: BoxFit.scaleDown);
        _resultado = 'Processando...';
        _detectorTextoOcupado = true;
      });

      RecognisedText textoDetectado =
      await _detectorTexto.processImage(InputImage.fromFile(arquivo));

      setState(() {
        _resultado = textoDetectado.text;
        _detectorTextoOcupado = false;
      });
    }
  }
  void _recarregarTela() {
    if (_detectorTextoOcupado) return;
    setState(() {
      _imagemTexto = null;
      _resultado = '';
    });
  }

  @override
  void dispose() {
    _detectorTexto.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Extrator de texto'),
        centerTitle: true,
        backgroundColor: _corPrimaria,
        actions: <Widget>[
          IconButton(
            onPressed: _recarregarTela,
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Selecione Imagem na Galeria',
                style: TextStyle(
                  color: _corPrimaria,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: _detectarTextoImagem,
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: _imagemTexto,
                    border: Border.all(
                      color: _corPrimaria,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: _corSecundaria,
                  ),
                  child: _imagemTexto == null
                      ? Center(
                    child: Image(
                      image: AssetImage('assets/icon-cam.png'),
                    ),
                  )
                      : null,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Texto Detectado:',
                style: TextStyle(
                  color: _corPrimaria,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _corPrimaria,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(5),
                color: _corSecundaria,
              ),
              child: SelectableText(
                _resultado,
                style: TextStyle(
                  color: _corPrimaria,
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
