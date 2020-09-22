import 'package:curso/models/curso_model.dart';
import 'package:curso/screens/detalhes_screen.dart';
import 'package:curso/services/curso_service.dart';
import 'package:curso/stores/curso_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CursoListView extends StatelessWidget {
  
  const CursoListView({
    Key key,
    @required this.cursos,
  }) : super(key: key);

  final List<CursoModel> cursos;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: cursos == null ? 0 : cursos.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Dismissible(
          onDismissed: (direction) {
            CursoService _cursoService = CursoService();
            _cursoService.delete(cursos[index]);
          },
          key: Key(cursos[index].id.toString()),
          child: cardCurso(cursos[index]),
          direction: DismissDirection.endToStart,
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  

  Card cardCurso(CursoModel curso) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        margin: new EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 5.0,
            ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),),),

             child: Image.network(curso.imagem, width: 100, height: 100,fit: BoxFit.fill,)),
            title: Text(
              curso.nome,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[400],
                      value: (curso.percentualConclusao / 100),
                      valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      curso.nivel,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black,
              size: 30.0,
            ),
            onTap: () {
              Get.to(DetalhesScreen(),arguments: curso);
          },
        ),
      ),
    );
  }
}
