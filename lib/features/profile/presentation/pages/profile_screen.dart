// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:split_arch/core/constants/app_colors.dart';
import 'package:split_arch/core/constants/app_text_styles.dart';
import 'package:split_arch/features/groups/domain/entities/group_list.dart';
// import 'package:split_arch/features/groups/presentation/pages/group_screen.dart';

class ProfileScreen extends StatefulWidget {
  final GroupList group;
  const ProfileScreen({super.key, required this.group});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List avatarCircleColor = [
    Colors.deepPurple,
    Colors.pink,
    Colors.teal,
    Colors.deepOrange,
    Colors.indigo,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigo[600],
                  radius: 54,
                  child: Icon(
                    Icons.groups_rounded,
                    color: Colors.indigo[50],
                    size: 72.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.group.title,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 28.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  icon: Icon(
                    Icons.edit,
                    size: 28.0,
                    color: AppColors().indigo,
                    weight: 700,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors().lightIndigo,
              ),
              child:
                  widget.group.desc.isEmpty
                      ? Text(
                        "Tap edit to add group description",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[500],
                          fontSize: 16.0,
                        ),
                      )
                      : Text(
                        widget.group.desc,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                backgroundColor: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        LucideIcons.wallet,
                        color: Colors.indigo[600],
                        size: 36,
                      ),
                      SizedBox(width: 12),
                      Column(
                        children: [
                          Text(
                            "Total Spent",
                            style: AppTextStyles().profileStatMutedTitle,
                          ),
                          Text(
                            "₹ 4,250",
                            style: AppTextStyles().profileStatValue,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(color: Colors.grey[400], width: 1, height: 40),
                  Row(
                    children: [
                      Icon(
                        LucideIcons.user,
                        color: Colors.indigo[600],
                        size: 36,
                      ),
                      SizedBox(width: 12),
                      Column(
                        children: [
                          Text(
                            "Members",
                            style: AppTextStyles().profileStatMutedTitle,
                          ),
                          Text(
                            "${widget.group.memCount} Active",
                            style: AppTextStyles().profileStatValue,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            SizedBox(
              height: 340,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Members List",
                      style: AppTextStyles().appBarTitleStyle,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final list = widget.group.list[index];
                        final hash = widget.group.list[index].name.codeUnits
                            .reduce((a, b) => a + b);
                        return Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey[400]!,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 12.0),
                              CircleAvatar(
                                backgroundColor:
                                    avatarCircleColor[hash %
                                        avatarCircleColor.length],
                                radius: 16,
                                child: Text(
                                  list.name[0].toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.0),
                              Text(
                                list.name,
                                style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 12.0),
                      itemCount: widget.group.list.length,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: AppColors().indigo,
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 0),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.settings,
                    size: 24.0,
                    color: AppColors().white,
                    weight: 700,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "Manage Group Settings",
                    style: TextStyle(
                      color: AppColors().white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
