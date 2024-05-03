import 'dart:convert';

import 'package:_iwu_pack/_iwu_pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/src/presentation/widgets/widget_dialog_container.dart';
import 'package:temp_package_name/src/presentation/widgets/widgets.dart';
import 'package:temp_package_name/src/resources/firestore/constants.dart';
import 'package:temp_package_name/src/resources/firestore/firestore.dart';
import 'package:temp_package_name/src/resources/firestore/firestore_resources.dart';
import 'package:temp_package_name/src/utils/utils.dart';

import '../cubit/users_cubit.dart';

class WidgetFormCreateUser extends StatefulWidget {
  const WidgetFormCreateUser({super.key});

  @override
  State<WidgetFormCreateUser> createState() => _WidgetFormCreateUserState();
}

class _WidgetFormCreateUserState extends State<WidgetFormCreateUser> {
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isSetPublic = true;
  bool loading = false;

  _submit() async {
    setState(() {
      loading = true;
    });
    var id = timestampId;
    Map<String, dynamic> data = {
      kdbid: id,
      kdbdisplayName: displayNameController.text.trim(),
      kdbfullname: fullNameController.text.trim(),
      kdbphonenumber: phoneController.text.trim(),
      kdbemail: emailController.text.trim(),
      kdbisEnable: isSetPublic,
    };
    loading = false;
    await colUsers.doc('$id').set(data);
    if (mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WidgetDialogContainer(
      heroTag: "WidgetFormCreateUser",
      child: SingleChildScrollView(
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Users",
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
                        controller: displayNameController,
                        label: 'Displayname',
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
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
                WidgetTextField(
                  controller: fullNameController,
                  label: 'Fullname',
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const Gap(16),
                WidgetTextField(
                  controller: phoneController,
                  label: 'Phone number',
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const Gap(16),
                WidgetTextField(
                  controller: emailController,
                  label: 'Email',
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                // const Gap(16),
                // WidgetCheck(
                //   status: isSetPublic,
                //   label: 'Set to enable',
                //   callback: (value) {
                //     setState(() {
                //       isSetPublic = !isSetPublic;
                //     });
                //   },
                // )
              ],
              const Gap(24),
              WidgetButton(
                enable: displayNameController.text.isNotEmpty,
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