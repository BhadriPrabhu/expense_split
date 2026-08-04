import 'package:flutter/material.dart';
import 'package:split_arch/core/constants/app_colors.dart';

class AppTextStyles {
  final appBarTitleStyle = TextStyle(
    color: AppColors().appbarTitleColor,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 24.0,
  );
  final centerTextStyle = TextStyle(
    color: AppColors().centerTextColor,
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );
  final bottomNavbarUnselectedText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );
  final bottomNavbarSelectedText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );
}