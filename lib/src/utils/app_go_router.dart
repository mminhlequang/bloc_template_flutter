import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/src/presentation/dashboard/cubit/dashboard_cubit.dart';
import 'package:temp_package_name/src/presentation/home/cubit/home_cubit.dart';

import '../presentation/dashboard/dashboard_screen.dart';
import '../presentation/departments/cubit/departments_cubit.dart';
import '../presentation/departments/departments_screen.dart';
import '../presentation/home/home_screen.dart';
import 'app_get.dart';

GlobalKey<NavigatorState> get appNavigatorKey =>
    findInstance<GlobalKey<NavigatorState>>();
bool get isAppContextReady => appNavigatorKey.currentContext != null;
BuildContext get appContext => appNavigatorKey.currentContext!;

pushWidget({
  required child,
  String? routeName,
  bool opaque = true,
}) {
  return Navigator.of(appContext).push(PageRouteBuilder(
    opaque: opaque,
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
    settings: RouteSettings(name: routeName),
  ));
}

// GoRouter configuration
final goRouter = GoRouter(
  initialLocation: '/dashboard/home',
  navigatorKey: appNavigatorKey,
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) {
        /// Example register new [bloc] using at [DashboardScreen]
        return NoTransitionPage(
          child: BlocProvider(
            create: (context) => DashboardCubit(),
            child: DashboardScreenWrap(
              child: child,
            ),
          ),
        );
      },
      routes: [
        GoRoute(
          name: '/dashboard/home',
          path: '/dashboard/home',

          /// Example register new [bloc] using at [HomeScreen]
          builder: (context, state) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          name: '/dashboard/departments',
          path: '/dashboard/departments',
          builder: (context, state) => BlocProvider(
            create: (context) => DepartmentsCubit(),
            child: const DepartmentsScreen(),
          ),
        ),
        // GoRoute(
        //   name: '/dashboard/users',
        //   path: '/dashboard/users',
        //   builder: (context, state) => BlocProvider(
        //     create: (context) => SubjectsCubit(),
        //     child: const SubjectsScreen(),
        //   ),
        // ),
        // GoRoute(
        //   name: '/dashboard/subjects',
        //   path: '/dashboard/subjects',
        //   builder: (context, state) => BlocProvider(
        //     create: (context) => SubjectsCubit(),
        //     child: const SubjectsScreen(),
        //   ),
        // ),
      ],
    ),
  ],
);
