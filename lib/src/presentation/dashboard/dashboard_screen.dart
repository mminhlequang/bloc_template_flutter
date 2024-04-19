import 'package:_iwu_pack/_iwu_pack.dart';
import 'package:flutter/material.dart';
import 'package:temp_package_name/src/constants/constants.dart';
import 'package:temp_package_name/src/utils/utils.dart';
import 'widgets/widget_drawer.dart';

double get dashboardScreenWrapHorizPadding => 20.sw;

class DashboardScreenWrap extends StatefulWidget {
  final Widget child;
  const DashboardScreenWrap({super.key, required this.child});

  @override
  State<DashboardScreenWrap> createState() => _DashboardScreenWrapState();
}

class _DashboardScreenWrapState extends State<DashboardScreenWrap> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: appColorBackground,
      drawer: const WidgetDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: dashboardScreenWrapHorizPadding, vertical: 12),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu_rounded,
                    color: appColorText,
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: appChangedTheme,
                    icon: Icon(AppPrefs.instance.isDarkTheme
                        ? Icons.sunny
                        : Icons.dark_mode_sharp)),
              ],
            ),
          ),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
