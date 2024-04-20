import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/src/utils/utils.dart';

part 'dashboard_state.dart';

DashboardCubit get dashboardCubit => findInstance<DashboardCubit>();

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  init() {
    changeMenu(DashboardMenu.home);
  }

  changeMenu(DashboardMenu menu, {bool redirect = true}) {
    emit(state.update(menu: menu));
    if (redirect) appContext.pushReplacement(menu.route);
  }
}
