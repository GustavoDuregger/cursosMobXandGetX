import 'package:curso/models/curso_model.dart';
import 'package:curso/services/curso_service.dart';
import 'package:mobx/mobx.dart';
part 'curso_screen_store.g.dart'; //unificando

// Declarando a classe
class CursoScreenStore = _CursoScreenStore with _$CursoScreenStore;

abstract class _CursoScreenStore with Store {
  final CursoService _cursoService = CursoService();
  List<CursoModel> _listaCursoLocal = <CursoModel>[];

  _CursoScreenStore() {
    init();
  }

  init() async {
    isLoading = true;
    _listaCursoLocal = await _cursoService.findAll();
    listaCurso = _listaCursoLocal.asObservable();
    isLoading = false;
  }

  @observable
  String filtro = "";

  @observable
  ObservableList<CursoModel> listaCurso = <CursoModel>[].asObservable();

  @observable
  bool isLoading = false;

  @action
  findAllCourses() async {
    init();
  }

  @action
  setFilter(value) {
    filtro = value;
  }

  @computed
  List<CursoModel> get filtered {
    if (filtro.isEmpty) {
      return listaCurso;
    } else {
      var lista = listaCurso
          .where((curso) => curso.nome.toLowerCase().contains(
                filtro.toLowerCase(),
              ))
          .toList();
      return lista;
    }
  }

  @computed
  int get quantidade {
    return listaCurso.length;
  }
}
