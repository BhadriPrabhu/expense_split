import 'package:flutter/material.dart';
import 'package:split_arch/app_routes.dart';
import 'package:split_arch/core/constants/app_colors.dart';
import 'package:split_arch/core/constants/app_text_styles.dart';
import 'package:split_arch/core/constants/strings.dart';

class GroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings().groupAppbarTitle, style: AppTextStyles().appBarTitleStyle,),
        backgroundColor: AppColors().appbarBgColor,
      ),
      body: Center(
        child: Column(
          children: [
            Text(AppStrings().groupCenterText, style: AppTextStyles().centerTextStyle,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, AppRoutes.bottomNav);
            }, child: Text("Go to group details"))
          ],
        )
      ),
    );
  }
}