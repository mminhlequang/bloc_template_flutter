import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temp_package_name/src/resources/firestore/constants.dart';
import 'package:temp_package_name/src/resources/firestore/instances.dart';

part 'subjects_state.dart';

class SubjectsCubit extends Cubit<SubjectsState> {
  SubjectsCubit() : super(SubjectsState());

  fetch({page, limit}) async {
    state.page = page ?? state.page;
    state.limit = limit ?? state.limit;
    emit(state.update());

    if (state.items == null || state.items!.isEmpty || state.page == 1) {
      if (state.isForKid) {
        var query = await colSubjects
            .where(kdbisEnable, isEqualTo: state.isEnable)
            .limit(state.limit)
            .get();
        emit(state.update(
            items: query.docs as List<QueryDocumentSnapshot<Map>>));
      } else {
        var query = await colSubjects
            .where(kdbisEnable, isEqualTo: state.isEnable)
            .limit(state.limit)
            .get();
        emit(state.update(
            items: query.docs as List<QueryDocumentSnapshot<Map>>));
      }
    } else {
      var last = state.items!.last;
      emit(state.update(items: []));
      if (state.isForKid) {
        var query = await colSubjects
            .where(kdbisEnable, isEqualTo: state.isEnable)
            .startAfterDocument(last)
            .limit(state.limit)
            .get();
        emit(state.update(
            items: query.docs as List<QueryDocumentSnapshot<Map>>));
      } else {
        var query = await colSubjects
            .where(kdbisEnable, isEqualTo: state.isEnable)
            .startAfterDocument(last)
            .limit(state.limit)
            .get();
        emit(state.update(
            items: query.docs as List<QueryDocumentSnapshot<Map>>));
      }
    }

    AggregateQuerySnapshot querycount = await colSubjects.count().get();
    var count = querycount.count;
    if (state.isForKid) {
      AggregateQuerySnapshot querycountWithFilter = await colSubjects
          .where(kdbisEnable, isEqualTo: state.isEnable)
          .count()
          .get();
      var countWithFilter = querycountWithFilter.count;
      emit(state.update(count: count, countWithFilter: countWithFilter));
    } else {
      AggregateQuerySnapshot querycountWithFilter = await colSubjects
          .where(kdbisEnable, isEqualTo: state.isEnable)
          .count()
          .get();
      var countWithFilter = querycountWithFilter.count;
      emit(state.update(count: count, countWithFilter: countWithFilter));
    }
  }

  init() async {
    if (state.itemsLangs != null && state.itemsLangs!.isNotEmpty) return;
    var query = await colDepartments.get();
    emit(state.update(
        itemsLangs: query.docs as List<QueryDocumentSnapshot<Map>>));
    // if (query.docs.isNotEmpty) {
    //   add(ChangeLangSubjectsEvent(state.itemsLangs!
    //       .firstWhere((e) => e.data()[kdblanguageCode] == 'vi')
    //       .data()));
    // }
  }

  changeFilter() async {
    emit(state.update());
    fetch(page: 1);
  }
}
