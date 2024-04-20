part of 'dashboard_cubit.dart';

class DashboardState {
  DashboardMenu menu;

  DashboardState({
    this.menu = DashboardMenu.home,
  });

  DashboardState update({
    DashboardMenu? menu,
  }) {
    return DashboardState(
      menu: menu ?? this.menu,
    );
  }
}

enum DashboardMenu { home, departments, users, subjects }

extension DashboardMenuExt on DashboardMenu {
  String get text {
    switch (this) {
      case DashboardMenu.home:
        return 'Dashboard';
      case DashboardMenu.departments:
        return 'Departments';
      case DashboardMenu.users:
        return 'Users';
      case DashboardMenu.subjects:
        return 'Subjects';
    }
  }

  String get route {
    switch (this) {
      case DashboardMenu.home:
        return '/dashboard/home';
      case DashboardMenu.departments:
        return '/dashboard/departments';
      case DashboardMenu.users:
        return '/dashboard/users';
      case DashboardMenu.subjects:
        return '/dashboard/subjects';
    }
  }

  IconData get icon {
    switch (this) {
      case DashboardMenu.home:
        return Icons.dashboard;
      case DashboardMenu.departments:
        return Icons.room_preferences;
      case DashboardMenu.users:
        return Icons.people_alt;
      case DashboardMenu.subjects:
        return Icons.abc_outlined;
    }
  }
}
