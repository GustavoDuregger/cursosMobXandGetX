import 'package:curso/models/curso_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DetalhesScreen extends StatelessWidget {
  CursoModel cursoModel;

  @override
  Widget build(BuildContext context) {
    cursoModel = ModalRoute.of(context).settings.arguments;

    final levelIndicator = Container(
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[400],
            value: (cursoModel.percentualConclusao/100),
            valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
          ),
        ),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: new Text(
          "BRL: " + cursoModel.preco.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        Icon(
          Icons.computer,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.white),
        ),
        SizedBox(height: 10.0),
        Text(
          cursoModel.nome,
          style: TextStyle(
            color: Colors.white,
            fontSize: 45.0,
          ),
        ),
        SizedBox(height: 22.7),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: levelIndicator,
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  cursoModel.nivel,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: coursePrice,
            ),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new NetworkImage(cursoModel.imagem),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.black87.withOpacity(0.8)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );

    final bottomContentText =  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
      cursoModel.conteudo,
      style: TextStyle(fontSize: 18.0),
      textAlign: TextAlign.justify,
    ),SizedBox(height: 30.0),
      Text("Amigos que estão fazendo o curso",style: TextStyle(fontSize: 18.0),)
    ]);

    final readButton = Container(
      child: _rowCards()
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
            readButton,
          ],
        ),
      ),
    );
    return Scaffold(
      body: Column(
        children: <Widget>[
          topContent,
          bottomContent,
        ],
      ),
    );
  }
}
 Widget _rowCards(){
    return Container(
      margin: EdgeInsets.symmetric(vertical:10.0),
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Image.network('https://media.creativemornings.com/uploads/user/avatar/2279/kim_face_circle.jpeg'),
          new Padding(padding: new EdgeInsets.only(left: 7.0, right: 7.0),),
          new Image.network('https://mattkahn.org/wp-content/uploads/2018/04/Matt-Face-in-Circle.png'),
          new Padding(padding: new EdgeInsets.only(left: 7.0, right: 7.0),),
          new Image.network('https://images.squarespace-cdn.com/content/v1/59d2f85703596eacb7278fd7/1520345288040-J6JMSA80GFBEN678VAWU/ke17ZwdGBToddI8pDm48kElf-1NtMx1P75kgTI5E1HV7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1Uc60wb18XEXDiPrMobPpvNqVmxF5jnK4ovlX-RV0B52CP7cJNZlDXbgJNE9ef52e8w/Michelle+Foo+profile-circle.png'),
          new Padding(padding: new EdgeInsets.only(left: 7.0, right: 7.0),),
          new Image.network('https://www.robolink.com/wp-content/uploads/2019/01/han_circle.png'),
          new Padding(padding: new EdgeInsets.only(left: 7.0, right: 7.0),),
          new Image.network('https://media.creativemornings.com/uploads/user/avatar/2279/kim_face_circle.jpeg'),
          new Padding(padding: new EdgeInsets.only(left: 7.0, right: 7.0),),
          new Image.network('https://mattkahn.org/wp-content/uploads/2018/04/Matt-Face-in-Circle.png'),
        ],
      ),
    );
  }