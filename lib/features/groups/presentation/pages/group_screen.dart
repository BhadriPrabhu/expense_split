// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:split_arch/app_routes.dart';
// import 'package:split_arch/app_routes.dart';
import 'package:split_arch/core/constants/app_colors.dart';
import 'package:split_arch/core/constants/app_text_styles.dart';
import 'package:split_arch/core/constants/strings.dart';
import 'package:split_arch/features/groups/domain/entities/group_list.dart';
import 'package:split_arch/features/groups/domain/entities/member.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  final List<Member> memList = [
    Member(memId: '1', name: "Bhadri", desc: ""),
    Member(memId: '2', name: "XYZ", desc: ""),
  ];
  late final List<GroupList> list = [
    GroupList(id: '1', title: "CBE", list: memList, desc: "One Day Trip"),
    GroupList(id: '3', title: "Chennai", list: memList, desc: "One Day Trip"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings().groupAppbarTitle,
          style: AppTextStyles().appBarTitleStyle,
        ),
        backgroundColor: AppColors().appbarBgColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 12.0),
            //   child: Text(
            //     AppStrings().groupSectionTitle,
            //     style: AppTextStyles().sectionTitleStyle,
            //     textAlign: TextAlign.start,
            //   ),
            // ),
            Expanded(
              child: ListView.separated(
                itemCount: list.length,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 10.0),
                itemBuilder: (context, index) {
                  final currList = list[index];
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.bottomNav,
                        arguments: currList,
                      );
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(16),
                      backgroundColor: Colors.white,
                      // ignore: deprecated_member_use
                      foregroundColor: Colors.black.withOpacity(0.04),
                    ),
                    // child: Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.indigo[50],
                          ),
                          child: Icon(
                            Icons.group_rounded,
                            color: Colors.indigo[600],
                            size: 16.0,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currList.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[900],
                                ),
                              ),
                              currList.desc.isNotEmpty
                                  ? Text(
                                    "${currList.memCount} members \u2022 ${currList.desc}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      color: Colors.grey[600],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  )
                                  : Text(
                                    "${currList.memCount} members",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      color: Colors.grey[600],
                                    ),
                                  ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.grey[400],
                          size: 32.0,
                        ),
                      ],
                    ),
                  );
                  // );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Semantics(
        child: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.pushNamed(
              context,
              AppRoutes.addGroup,
            );
            if (result != null && result is GroupList) {
              setState(() {
                list.add(result);
              });
            }
          },
          backgroundColor: Colors.indigo[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(Icons.add, color: Colors.white, weight: 700, size: 32.0),
        ),
      ),
    );
  }
}
