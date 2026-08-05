import 'package:flutter/material.dart';
// import 'package:split_arch/core/constants/app_colors.dart';
import 'package:split_arch/core/constants/app_text_styles.dart';
// import 'package:split_arch/core/constants/strings.dart';

class ExpensesScreen extends StatelessWidget {
  final String groupId;

  const ExpensesScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(groupId, style: AppTextStyles().sectionTitleStyle),
    );
  }
}
