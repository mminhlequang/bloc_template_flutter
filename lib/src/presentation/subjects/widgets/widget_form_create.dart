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

import '../cubit/subjects_cubit.dart';

class WidgetFormCreateSubject extends StatefulWidget {
  const WidgetFormCreateSubject({super.key});

  @override
  State<WidgetFormCreateSubject> createState() =>
      _WidgetFormCreateSubjectState();
}

class _WidgetFormCreateSubjectState extends State<WidgetFormCreateSubject> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController manufacturerController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController yearOfUseController = TextEditingController();
  final TextEditingController standardsOfUseController =
      TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController seriProductController = TextEditingController();
  final TextEditingController circulationNumberController =
      TextEditingController();
  final TextEditingController documentProductController =
      TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController userInChargeController = TextEditingController();
  final TextEditingController usageStatusController = TextEditingController();
  final TextEditingController usageCapacityController = TextEditingController();
  final TextEditingController periodicMaintenanceController =
      TextEditingController();
  final TextEditingController noteController = TextEditingController();

  bool isSetPublic = true;
  bool loading = false;

  _submit() async {
    setState(() {
      loading = true;
    });
    var id = timestampId;
    Map<String, dynamic> data = {
      kdbid: id,
      kdbproductName: productNameController.text.trim(),
      kdbmodel: modelController.text.trim(),
      kdbmanufacturer: manufacturerController.text.trim(),
      kdbcountry: countryController.text.trim(),
      kdbyearOfUse: yearOfUseController.text.trim(),
      kdbstandardsOfUse: standardsOfUseController.text.trim(),
      kdbquantity: quantityController.text.trim(),
      kdbunitPrice: unitPriceController.text.trim(),
      kdbprice: priceController.text.trim(),
      kdbseriProduct: seriProductController.text.trim(),
      kdbcirculationNumber: circulationNumberController.text.trim(),
      kdbdocumentProduct: documentProductController.text.trim(),
      kdbdepartment: departmentController.text.trim(),
      kdbuserInCharge: userInChargeController.text.trim(),
      kdbusageStatus: usageStatusController.text.trim(),
      kdbusageCapacity: usageCapacityController.text.trim(),
      kdbperiodicMaintenance: periodicMaintenanceController.text.trim(),
      kdbnote: noteController.text.trim(),
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
      heroTag: "WidgetFormCreateSubject",
      width: 980,
      child: SingleChildScrollView(
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Subjects",
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
              WidgetTextField(
                controller: productNameController,
                label: 'productName',
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: modelController,
                      label: 'model',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: manufacturerController,
                      label: 'manufacturer',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: countryController,
                      label: 'country',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: yearOfUseController,
                      label: 'yearOfUse',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: standardsOfUseController,
                      label: 'standardsOfUse',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: quantityController,
                      label: 'quantity',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: unitPriceController,
                      label: 'unitPrice',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: priceController,
                      label: 'price',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: seriProductController,
                      label: 'seriProduct',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: circulationNumberController,
                      label: 'circulationNumber',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: documentProductController,
                      label: 'documentProduct',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: departmentController,
                      label: 'department',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: userInChargeController,
                      label: 'userInCharge',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: usageStatusController,
                      label: 'usageStatus',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: usageCapacityController,
                      label: 'usageCapacity',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    flex: 4,
                    child: WidgetTextField(
                      controller: periodicMaintenanceController,
                      label: 'periodicMaintenance',
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const Gap(16),
              WidgetTextField(
                controller: noteController,
                maxLines: 4,
                label: 'note',
                onChanged: (value) {
                  setState(() {});
                },
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
              ),
              const Gap(24),
              WidgetButton(
                enable: productNameController.text.isNotEmpty,
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
