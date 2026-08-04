import 'package:flutter/material.dart';
import 'package:split_arch/core/constants/app_colors.dart';
import 'package:split_arch/core/constants/app_text_styles.dart';
import 'package:split_arch/core/constants/strings.dart';

class SettlementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings().settlementAppbarTitle, style: AppTextStyles().appBarTitleStyle,),
        backgroundColor: AppColors().appbarBgColor,
      ),
      body: Center(
        child: Text(AppStrings().settlementCenterText, style: AppTextStyles().centerTextStyle,),
      ),
    );
  }
}