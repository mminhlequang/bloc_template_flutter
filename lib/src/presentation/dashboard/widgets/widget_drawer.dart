import 'package:_iwu_pack/_iwu_pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/src/utils/utils.dart';

import '../cubit/dashboard_cubit.dart';

class WidgetDrawer extends StatefulWidget {
  const WidgetDrawer({super.key});

  @override
  State<WidgetDrawer> createState() => _WidgetDrawerState();
}

class _WidgetDrawerState extends State<WidgetDrawer> {
  DashboardCubit get dashboardCubit => context.read<DashboardCubit>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: appContext.height,
      decoration: BoxDecoration(color: appColorElement),
      alignment: Alignment.topCenter,
      child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                      const SizedBox(
                        height: 40
                      ),
                    ] +
                    DashboardMenu.values
                        .map<Widget>(
                          (e) => InkWell(
                            onTap: () {
                              context.pop();
                              dashboardCubit.changeMenu(e);
                            },
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 32),
                              child: Row(
                                children: [
                                  Icon(
                                    e.icon,
                                    color: state.menu == e
                                        ? appColorPrimary
                                        : appColorText.withOpacity(.7),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      e.text,
                                      style: w400TextStyle(
                                        fontSize: 16,
                                        color: state.menu == e
                                            ? appColorPrimary
                                            : appColorText.withOpacity(.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        );
      }),
    );
  }
}
