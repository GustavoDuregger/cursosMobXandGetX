import 'package:curso/screens/cursos_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenIntro(),
    );
  }
}

class SplashScreenIntro extends StatefulWidget {
  SplashScreenIntro({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreenIntroState createState() => _SplashScreenIntroState();
}

class _SplashScreenIntroState extends State<SplashScreenIntro> {
  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    print(alturaTela);
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 2,
          navigateAfterSeconds: CursosScreen(),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/gif.gif"), fit: BoxFit.contain),
          ),
        ),
        new Center(child: Padding(
          padding: new EdgeInsets.only(top: alturaTela / 1.5),
          child: new Container(width: alturaTela/5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fiap.png"),
              ),
            ),
          ),
        ))
      ],
    );
  }
}