// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curso_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CursoScreenStore on _CursoScreenStore, Store {
  Computed<List<CursoModel>> _$filteredComputed;

  @override
  List<CursoModel> get filtered =>
      (_$filteredComputed ??= Computed<List<CursoModel>>(() => super.filtered,
              name: '_CursoScreenStore.filtered'))
          .value;
  Computed<int> _$quantidadeComputed;

  @override
  int get quantidade =>
      (_$quantidadeComputed ??= Computed<int>(() => super.quantidade,
              name: '_CursoScreenStore.quantidade'))
          .value;

  final _$filtroAtom = Atom(name: '_CursoScreenStore.filtro');

  @override
  String get filtro {
    _$filtroAtom.reportRead();
    return super.filtro;
  }

  @override
  set filtro(String value) {
    _$filtroAtom.reportWrite(value, super.filtro, () {
      super.filtro = value;
    });
  }

  final _$listaCursoAtom = Atom(name: '_CursoScreenStore.listaCurso');

  @override
  ObservableList<CursoModel> get listaCurso {
    _$listaCursoAtom.reportRead();
    return super.listaCurso;
  }

  @override
  set listaCurso(ObservableList<CursoModel> value) {
    _$listaCursoAtom.reportWrite(value, super.listaCurso, () {
      super.listaCurso = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CursoScreenStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$findAllCoursesAsyncAction =
      AsyncAction('_CursoScreenStore.findAllCourses');

  @override
  Future findAllCourses() {
    return _$findAllCoursesAsyncAction.run(() => super.findAllCourses());
  }

  final _$_CursoScreenStoreActionController =
      ActionController(name: '_CursoScreenStore');

  @override
  dynamic setFilter(dynamic value) {
    final _$actionInfo = _$_CursoScreenStoreActionController.startAction(
        name: '_CursoScreenStore.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_CursoScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filtro: ${filtro},
listaCurso: ${listaCurso},
isLoading: ${isLoading},
filtered: ${filtered},
quantidade: ${quantidade}
    ''';
  }
}
