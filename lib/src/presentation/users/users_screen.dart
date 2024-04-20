import 'package:_iwu_pack/_iwu_pack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:temp_package_name/src/resources/firestore/constants.dart';
import 'package:temp_package_name/src/resources/firestore/instances.dart';
import 'package:temp_package_name/src/utils/utils.dart';

import '../dashboard/dashboard_screen.dart';
import '../widgets/widgets.dart';
import 'cubit/users_cubit.dart';
import 'widgets/widget_form_create.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UsersCubit get cubit => context.read<UsersCubit>();

  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: dashboardScreenWrapHorizPadding),
      child: Scaffold(
        floatingActionButton: WidgetFABAni(
          shouldShow: true,
          animationDuration: const Duration(milliseconds: 250),
          fab: FloatingActionButton(
            heroTag: 'WidgetFormCreateUser',
            backgroundColor: appColorPrimary,
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () async {
              await pushWidget(
                child: const WidgetFormCreateUser(),
                opaque: false,
              );
              if (mounted) cubit.fetch();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        body: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Users",
                          style: w600TextStyle(fontSize: 28),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "${state.count} rows",
                          style: w400TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Spacer(),
                          SizedBox(
                            width: 280.0,
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: "Type some thing...",
                                prefixIcon: const Icon(Icons.search),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: appColorPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Row(
                          //   children: [
                          //     WidgetOverlayActions(
                          //       gestureType: state.itemsLangs != null
                          //           ? GestureType.onTap
                          //           : GestureType.none,
                          //       builder: (Widget child,
                          //           Size size,
                          //           Offset childPosition,
                          //           Offset? pointerPosition,
                          //           double animationValue,
                          //           Function hide) {
                          //         return Positioned(
                          //           left: childPosition.dx,
                          //           top: childPosition.dy + size.height + 8,
                          //           child: WidgetPopupContainer(
                          //             alignmentTail: Alignment.topLeft,
                          //             paddingTail: const EdgeInsets.only(left: 16),
                          //             child: Container(
                          //               width: 120,
                          //               padding:
                          //                   const EdgeInsets.symmetric(vertical: 12),
                          //               child: Material(
                          //                 color: Colors.transparent,
                          //                 child: Column(
                          //                   children: state.itemsLangs!
                          //                       .map(
                          //                         (e) => InkWell(
                          //                           onTap: () {
                          //                             hide();
                          //                             _bloc.add(ChangeLangSubjectsEvent(
                          //                                 e.data()));
                          //                           },
                          //                           child: Ink(
                          //                             color:
                          //                                 e.data()[kdblanguageCode] ==
                          //                                         state.language![
                          //                                             kdblanguageCode]
                          //                                     ? Colors.grey[100]
                          //                                     : Colors.transparent,
                          //                             padding:
                          //                                 const EdgeInsets.symmetric(
                          //                                     vertical: 8,
                          //                                     horizontal: 16),
                          //                             child: Align(
                          //                               alignment: Alignment.centerLeft,
                          //                               child: Text(
                          //                                 '${e.data()[kdblanguageName]}',
                          //                                 style: w400TextStyle(),
                          //                               ),
                          //                             ),
                          //                           ),
                          //                         ),
                          //                       )
                          //                       .toList(),
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //       child: Row(
                          //         children: [
                          //           if (state.language != null) ...[
                          //             Text('Language: ',
                          //                 style: w300TextStyle(
                          //                     fontSize: 14,
                          //                     color: hexColor('#68686A'))),
                          //             const Gap(4),
                          //             Text(
                          //               '${state.language![kdblanguageName]} '
                          //               "(${state.countWithFilter})",
                          //               style: w500TextStyle(),
                          //             )
                          //           ],
                          //         ],
                          //       ),
                          //     ),
                          //     const Gap(24),
                          //     InkWell(
                          //       onTap: () {
                          //         _bloc.add(ChangeFilterSubjectsEvent(
                          //             isForKid: !state.isForKid));
                          //       },
                          //       child: Row(
                          //         children: [
                          //           Text('isForKid:',
                          //               style: w300TextStyle(
                          //                   fontSize: 14, color: hexColor('#68686A'))),
                          //           const Gap(4),
                          //           CircleAvatar(
                          //             backgroundColor: state.isForKid
                          //                 ? appColorPrimary
                          //                 : appColorElement,
                          //             radius: 6,
                          //             child: !state.isForKid
                          //                 ? const SizedBox()
                          //                 : const Center(
                          //                     child: Icon(
                          //                       CupertinoIcons.check_mark,
                          //                       size: 8,
                          //                       color: Colors.white,
                          //                     ),
                          //                   ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     const Gap(24),
                          //     InkWell(
                          //       onTap: () {
                          //         _bloc.add(ChangeFilterSubjectsEvent(
                          //             isEnable: !state.isEnable));
                          //       },
                          //       child: Row(
                          //         children: [
                          //           Text('isEnable:',
                          //               style: w300TextStyle(
                          //                   fontSize: 14, color: hexColor('#68686A'))),
                          //           const Gap(4),
                          //           CircleAvatar(
                          //             backgroundColor: state.isEnable
                          //                 ? appColorPrimary
                          //                 : appColorElement,
                          //             radius: 6,
                          //             child: !state.isEnable
                          //                 ? const SizedBox()
                          //                 : const Center(
                          //                     child: Icon(
                          //                       CupertinoIcons.check_mark,
                          //                       size: 8,
                          //                       color: Colors.white,
                          //                     ),
                          //                   ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const Gap(32),
                          // Text(
                          //   'Page:',
                          //   style: w400TextStyle(),
                          // ),
                          // const Gap(4),
                          // IconButton(
                          //   onPressed: state.page == 1
                          //       ? null
                          //       : () {
                          //           _bloc.add(FetchSubjectsEvent(page: state.page - 1));
                          //         },
                          //   icon: Icon(
                          //     Icons.chevron_left_rounded,
                          //     color: state.page == 1 ? appColorElement : appColorText,
                          //   ),
                          // ),
                          // Text(
                          //   ' ${state.page} ',
                          //   style: w500TextStyle(),
                          // ),
                          // IconButton(
                          //   onPressed: state.page * state.limit >= state.count
                          //       ? null
                          //       : () {
                          //           _bloc.add(FetchSubjectsEvent(page: state.page + 1));
                          //         },
                          //   icon: Icon(
                          //     Icons.chevron_right_rounded,
                          //     color: state.page * state.limit >= state.count
                          //         ? appColorElement
                          //         : appColorText,
                          //   ),
                          // ),
                          // const Gap(12),
                          // WidgetOverlayActions(
                          //   builder: (Widget child,
                          //       Size size,
                          //       Offset childPosition,
                          //       Offset? pointerPosition,
                          //       double animationValue,
                          //       Function hide) {
                          //     return Positioned(
                          //       right: MediaQuery.of(context).size.width -
                          //           childPosition.dx -
                          //           size.width,
                          //       top: childPosition.dy + size.height + 8,
                          //       child: WidgetPopupContainer(
                          //         alignmentTail: Alignment.topRight,
                          //         child: Container(
                          //           width: 120,
                          //           padding: const EdgeInsets.symmetric(vertical: 8),
                          //           child: Material(
                          //             color: Colors.transparent,
                          //             child: Column(
                          //               children: List.generate(
                          //                 5,
                          //                 (index) => InkWell(
                          //                   onTap: () {
                          //                     hide();
                          //                     _bloc.add(FetchSubjectsEvent(
                          //                         page: 1, limit: (index + 1) * 10));
                          //                   },
                          //                   child: Ink(
                          //                     padding: const EdgeInsets.symmetric(
                          //                         vertical: 8, horizontal: 16),
                          //                     child: Row(
                          //                       children: [
                          //                         Text(
                          //                           '${(index + 1) * 10} items',
                          //                           style: w400TextStyle(),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         'Limit:',
                          //         style: w400TextStyle(),
                          //       ),
                          //       const Gap(4),
                          //       Text(
                          //         '${state.limit} items',
                          //         style: w500TextStyle(),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(32),
                Expanded(
                  child: WidgetTableContainer(
                    header: const Row(
                      children: [
                        WidgetRowValue.label(flex: 2, value: kdbid),
                        WidgetRowValue.label(flex: 1, value: kdblabel),
                        WidgetRowValue.label(value: kdbisEnable),
                        WidgetRowValue.label(flex: 1, value: ''),
                      ],
                    ),
                    data: ValueListenableBuilder(
                      valueListenable: searchController,
                      builder: (context, value, child) {
                        String keyword = value.text;
                        List<QueryDocumentSnapshot<Map>> items =
                            List.from((state.items ?? []));
                        return ListView.separated(
                          itemCount: items.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => Container(
                            height: .6,
                            color: Colors.grey.shade200,
                          ),
                          itemBuilder: (_, index) {
                            var e = items[index];

                            return WidgetRowItem(
                              key: ValueKey(e),
                              index: index,
                              child: Row(
                                children: [
                                  WidgetRowValue(
                                    flex: 2,
                                    value: e.data()[kdbid],
                                    maxLines: 99,
                                  ),

                                  // WidgetRowValue(
                                  //   flex: 2,
                                  //   valueEdit: e.data()[kdbimageUrl] ==
                                  //               null ||
                                  //           e.data()[kdbimageUrl]!.isEmpty
                                  //       ? '...'
                                  //       : e.data()[kdbimageUrl],
                                  //   value: e.data()[kdbimageUrl] == null ||
                                  //           e.data()[kdbimageUrl]!.isEmpty
                                  //       ? '...'
                                  //       : AspectRatio(
                                  //           aspectRatio: 1,
                                  //           child: WidgetAppImage(
                                  //               imageUrl:
                                  //                   e.data()[kdbimageUrl]),
                                  //         ),
                                  //   maxLines: 99,
                                  //   callback: (value) async {
                                  //     await colSubjects
                                  //         .doc('${e.data()[kdbid]}')
                                  //         .update({kdbimageUrl: value});
                                  //     subjectsCubit.fetch();
                                  //   },
                                  // ),
                                  WidgetRowValue(
                                    flex: 2,
                                    value: e.data()[kdblabel],
                                    maxLines: 99,
                                    callback: (value) async {
                                      await colSubjects
                                          .doc('${e.data()[kdbid]}')
                                          .update({kdblabel: value});
                                      cubit.fetch();
                                    },
                                  ),
                                  WidgetRowValue(
                                    flex: 1,
                                    maxLines: 99,
                                    cellDataType: CellDataType.bol,
                                    value: e.data()[kdbisEnable],
                                    label: 'Set to Enable',
                                    callback: (value) async {
                                      await colSubjects
                                          .doc('${e.data()[kdbid]}')
                                          .update({kdbisEnable: value});
                                      cubit.fetch();
                                    },
                                  ),
                                  WidgetRowValue(
                                    flex: 1,
                                    value: WidgetDeleteButton(
                                      callback: () async {
                                        await colSubjects
                                            .doc('${e.data()[kdbid]}')
                                            .delete();
                                        cubit.fetch();
                                        // findInstance<QuizsBloc>()
                                        //     .needRefresh();
                                        // var queries = await colQuizs
                                        //     .where(kdbsubjectId,
                                        //         isEqualTo: e.data()[kdbid])
                                        //     .get();
                                        // for (var doc in queries.docs) {
                                        //   colQuizs.doc(doc.id).delete();
                                        // }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NumberOfSubjects extends StatefulWidget {
  final int id;
  const _NumberOfSubjects({required this.id});

  @override
  State<_NumberOfSubjects> createState() => __NumberOfSubjectsState();
}

class __NumberOfSubjectsState extends State<_NumberOfSubjects> {
  int count = 0;
  _getCount() async {
    // AggregateQuerySnapshot query =
    //     await colUsers.where(kdbsubjectId, isEqualTo: widget.id).count().get();
    // count = query.count ?? 0;
    // setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count',
      overflow: TextOverflow.ellipsis,
      style: w300TextStyle(),
    );
  }
}
