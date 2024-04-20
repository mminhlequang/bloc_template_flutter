import 'dart:convert';

import 'package:_iwu_pack/_iwu_pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/src/presentation/widgets/widget_dialog_container.dart';
import 'package:temp_package_name/src/presentation/widgets/widgets.dart';
import 'package:temp_package_name/src/resources/firestore/firestore.dart';
import 'package:temp_package_name/src/utils/utils.dart';

import '../cubit/subjects_cubit.dart';

class WidgetFormCreateDepartment extends StatefulWidget {
  const WidgetFormCreateDepartment({super.key});

  @override
  State<WidgetFormCreateDepartment> createState() =>
      _WidgetFormCreateDepartmentState();
}

class _WidgetFormCreateDepartmentState
    extends State<WidgetFormCreateDepartment> {
  final TextEditingController labelController = TextEditingController();
  bool isSetPublic = true;
  bool loading = false;

  _submit() async {
    setState(() {
      loading = true;
    });
    var id = timestampId;
    Map<String, dynamic> data = {
      kdbid: id,
      kdblabel: labelController.text.trim(),
      kdbisEnable: isSetPublic,
    };
    loading = false;
    await colSubjects.doc('$id').set(data);
    if (mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WidgetDialogContainer(
      heroTag: "WidgetFormCreateDepartment",
      child: SingleChildScrollView(
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Departments",
                style: w600TextStyle(fontSize: 28),
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add new item",
                    style: w400TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              ...[
                Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: WidgetTextField(
                          controller: labelController,
                          label: 'Label',
                          onChanged: (value) {
                            setState(() {});
                          },
                        )),
                    // const Gap(16),
                    // Expanded(
                    //   flex: 1,
                    //   child: WidgetTextField(
                    //     controller: code,
                    //     label: 'Language code',
                    //     onChanged: (value) {
                    //       setState(() {});
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                const Gap(16),
                WidgetCheck(
                  status: isSetPublic,
                  label: 'Set to enable',
                  callback: (value) {
                    setState(() {
                      isSetPublic = !isSetPublic;
                    });
                  },
                )
              ],
              const Gap(24),
              WidgetButton(
                enable: labelController.text.isNotEmpty,
                label: 'Submit',
                onTap: () async {
                  context.pop();
                  await _submit();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
