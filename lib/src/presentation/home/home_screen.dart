import 'package:_iwu_pack/setup/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:_iwu_pack/_iwu_pack.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/src/constants/constants.dart';
import 'package:temp_package_name/src/utils/utils.dart';

import '../dashboard/cubit/dashboard_cubit.dart';
import '../dashboard/dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: dashboardScreenWrapHorizPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Admin',
                      style: w600TextStyle(fontSize: 20.sw),
                    ),
                    const Gap(4),
                    Text(
                      'This is what we\'ve got for you today',
                      style: w400TextStyle(
                          fontSize: 14.sw, color: appColorText.withOpacity(.8)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(40),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 32.sw,
                runSpacing: 32.sw,
                children: List.generate(
                  5,
                  (index) => WidgetRippleButton(
                    onTap: () {
                      dashboardCubit.changeMenu(DashboardMenu.subjects);
                    },
                    color: appColorBackground,
                    borderRadius: BorderRadius.circular(16.sw),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 24.sw, horizontal: 40.sw),
                      decoration: BoxDecoration(
                          color: appColorBackground,
                          borderRadius: BorderRadius.circular(16.sw),
                          boxShadow: [
                            BoxShadow(
                                color: appColorText.withOpacity(.12),
                                blurRadius: 16)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.margin_rounded,
                                  color: appColorText.withOpacity(.65)),
                              Gap(20.sw),
                              Text(
                                'Total departments',
                                style: w400TextStyle(
                                    fontSize: 20.sw,
                                    color: appColorText.withOpacity(.65)),
                              ),
                            ],
                          ),
                          Gap(8.sw),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '20',
                                style: w700TextStyle(fontSize: 48.sw),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
