import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:temp_package_name/src/resources/firestore/firestore.dart';

part 'departments_state.dart';

class DepartmentsCubit extends Cubit<DepartmentsState> {
  DepartmentsCubit() : super(DepartmentsState());

  fetch({page, limit}) async {
    state.page = page ?? state.page;
    state.limit = limit ?? state.limit;
    emit(state.update());

    if (state.items == null || state.items!.isEmpty || state.page == 1) {
      var query = await colDepartments
          .where(kdbisEnable, isEqualTo: state.isEnable)
          .limit(state.limit)
          .get();
      emit(state.update(items: query.docs as List<QueryDocumentSnapshot<Map>>));
    } else {
      var last = state.items!.last;
      emit(state.update(items: []));

      var query = await colDepartments
          .where(kdbisEnable, isEqualTo: state.isEnable)
          .startAfterDocument(last)
          .limit(state.limit)
          .get();
      emit(state.update(items: query.docs as List<QueryDocumentSnapshot<Map>>));
    }

    AggregateQuerySnapshot querycount = await colDepartments.count().get();
    var count = querycount.count;

    AggregateQuerySnapshot querycountWithFilter = await colDepartments
        .where(kdbisEnable, isEqualTo: state.isEnable)
        .count()
        .get();
    var countWithFilter = querycountWithFilter.count;
    emit(state.update(count: count, countWithFilter: countWithFilter));
  }

  init() async {
    fetch();
  }

  changeFilter() async {
    emit(state.update());
    fetch(page: 1);
  }
}
