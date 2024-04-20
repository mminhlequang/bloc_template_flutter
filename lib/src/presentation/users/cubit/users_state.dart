part of 'users_cubit.dart';

class UsersState {
  int count;
  int countWithFilter;
  int page;
  int limit;
  List<QueryDocumentSnapshot<Map>>? items;

  bool isEnable;

  UsersState({
    this.isEnable = true,
    this.count = 0,
    this.countWithFilter = 0,
    this.page = 1,
    this.limit = 20,
    this.items,
  });

  UsersState update({
    bool? isEnable,
    int? count,
    int? countWithFilter,
    int? page,
    int? limit,
    List<QueryDocumentSnapshot<Map>>? items,
  }) {
    return UsersState(
      isEnable: isEnable ?? this.isEnable,
      count: count ?? this.count,
      countWithFilter: countWithFilter ?? this.countWithFilter,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      items: items ?? this.items,
    );
  }
}
