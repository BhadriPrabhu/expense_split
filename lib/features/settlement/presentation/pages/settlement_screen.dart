import 'package:flutter/material.dart';
// import 'package:split_arch/core/constants/app_colors.dart';
import 'package:split_arch/core/constants/app_text_styles.dart';
import 'package:split_arch/core/constants/strings.dart';

class SettlementScreen extends StatelessWidget {
  final String groupId;
  const SettlementScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings().settlementCenterText,
        style: AppTextStyles().sectionTitleStyle,
      ),
    );
  }
}
