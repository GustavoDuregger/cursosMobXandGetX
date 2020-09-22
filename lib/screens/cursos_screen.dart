import 'package:curso/animation/principalswipe.dart';
import 'package:curso/screens/widget/curso_listview.dart';
import 'package:curso/screens/widget/curso_listview_loading.dart';
import 'package:curso/stores/curso_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CursosScreen extends StatefulWidget {
  @override
  _CursosScreenState createState() => _CursosScreenState();
}

class _CursosScreenState extends State<CursosScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final CursoScreenStore cursoScreenStore = CursoScreenStore();

  @override
  void initState() {
    super.initState();
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    cursoScreenStore.findAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset("assets/fiap.png",width: 80,),
        actions: [
          IconButton(
            icon: Icon(Icons.short_text),
            onPressed: null,
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          new Padding(
              padding: new EdgeInsets.only(left: 12,right:12,top: 12),child:
          TextField(
            
          decoration: InputDecoration(
            prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                hintText: "Digite o nome do curso",
                hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
            
         
          onChanged: cursoScreenStore.setFilter,
        ),),
          RefreshIndicator(
            onRefresh: refreshList,
            child:Container(
              margin: const EdgeInsets.only(top: 80),
              child:Observer(
              builder: (ctx) {
                if (cursoScreenStore.isLoading) {
                  return CursoListViewLoading();
                } else {
                  return CursoListView(
                    cursos: cursoScreenStore.filtered,
                  );
                }
              },
            ),) 
          ),
          Positioned(
            bottom: 0,
            width: 600,
            child: PrincipalSwipe(),
          ),
        ],
      ),
    );
  }
}
