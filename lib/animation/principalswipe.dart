import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//TELA PRINCIPAL: AQUI ESTÁ O SWIPE QUE OFERECE TODAS AS OPÇÕES AO USUARIO

class PrincipalSwipe extends StatefulWidget {
  PrincipalSwipe({Key key}) : super(key: key);

  @override
  _PrincipalSwipeState createState() => _PrincipalSwipeState();
}

class _PrincipalSwipeState extends State<PrincipalSwipe> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    //QUESTÕES DE RESPONSIVIDADE PARA TELAS GRANDES E PEQUENAS
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;
    double altura = 0.0;
    double largura = 550.0;
    double larguraCartao = 550.0;
    double larguraOutros = 0.0;
    
    if (alturaTela > 650) {
      altura = 750;
      largura = 460;
      larguraCartao = 420;
    } else {
      altura = 550;
      largura = 550;
      larguraCartao = 550;
    }
    if (alturaTela > 650) {
      larguraOutros = 750;
    } else {
      larguraOutros = 550;
    }

    //DETECÇÃO DO TOQUE PARA SUBIR OU DESCER O CONTAINER
    //SE FOR DETECTADO O TOQUE O ESTADO DO SELECTED MUDA
    return GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: AnimatedContainer(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[900],
                  blurRadius: selected ? 500.0 : 0,
                ),
              ],
              color: selected ? Colors.grey[800] : Colors.grey[600],
            ),
            width: larguraTela,
            //FOI SELECIONADO? SE SIM MUDE A ALTURA DA TELA (ANIMAÇÃO DE SUBIDA E DECIDA)
            height: selected ? alturaTela / 3 : alturaTela / 10,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: ListView(children: <Widget>[
              Icon(
                selected ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                size: 35.0,
                color: Colors.white,
              ),
              new Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                height: alturaTela / 5,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      child: new Container(
                        child: new Card(
                          color: Colors.transparent,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              new Padding(
                                padding: new EdgeInsets.only(
                                    right: 100, top: 5, bottom: 5),
                              ),
                              Icon(
                                Icons.people,
                                color: Colors.transparent,
                                size: alturaTela / 20,
                              ),
                              new Padding(
                                padding: new EdgeInsets.only(
                                  top: 5,
                                ),
                              ),
                              Text("Buscar \ncidadão",
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.transparent)),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 0,
                          margin: EdgeInsets.all(10),
                        ),
                      ),
                      onTap: () async {
                        await launch('https://www.fiap.com.br/');
                      },
                    ),
                    GestureDetector(
                      child: new Container(
                        child: new Card(
                          color: Colors.grey[700],
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              new Padding(
                                padding: new EdgeInsets.only(
                                    right: 100, top: 5, bottom: 5),
                              ),
                              Icon(
                                Icons.school,
                                color: Colors.white,
                                size: alturaTela / 20,
                              ),
                              new Padding(
                                padding: new EdgeInsets.only(
                                  top: 5,
                                ),
                              ),
                              Text("Website \noficial",
                                  style: new TextStyle(
                                      fontSize: 15.0, color: Colors.white)),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 0,
                          margin: EdgeInsets.all(10),
                        ),
                      ),
                      onTap: () async {
                        await launch('https://www.fiap.com.br/');
                      },
                    ),
                    GestureDetector(
                      child: new Container(
                        child: new Card(
                          color: Colors.grey[700],
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              new Padding(
                                padding: new EdgeInsets.only(
                                    right: 100, top: 5, bottom: 5),
                              ),
                              Icon(
                                Icons.notification_important,
                                color: Colors.white,
                                size: alturaTela / 20,
                              ),
                              new Padding(
                                padding: new EdgeInsets.only(
                                  top: 5,
                                ),
                              ),
                              Text("Avisos e \ninformações",
                                  style: new TextStyle(
                                      fontSize: 15.0, color: Colors.white)),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 0,
                          margin: EdgeInsets.all(10),
                        ),
                      ),
                      onTap: () async {
                        await launch(
                            'https://www.fiap.com.br/institucional/#conceito');
                      },
                    ),
                    GestureDetector(
                      child: new Container(
                        child: new Card(
                          color: Colors.grey[700],
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              new Padding(
                                padding: new EdgeInsets.only(
                                    right: 100, top: 5, bottom: 5),
                              ),
                              Icon(
                                Icons.call,
                                color: Colors.white,
                                size: alturaTela / 20,
                              ),
                              new Padding(
                                padding: new EdgeInsets.only(
                                  top: 5,
                                ),
                              ),
                              Text("Ligação \nao campus",
                                  style: new TextStyle(
                                      fontSize: 15.0, color: Colors.white)),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 0,
                          margin: EdgeInsets.all(10),
                        ),
                      ),
                      onTap: () async {
                        await launch(
                            'https://www.fiap.com.br/institucional/#conceito');
                      },
                    ),
                  ],
                ),
              ),
            ])));
  }
}
