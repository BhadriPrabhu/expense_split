import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:split_arch/app_routes.dart';
import 'package:split_arch/core/constants/app_text_styles.dart';
import 'package:split_arch/core/constants/strings.dart';
import 'package:split_arch/features/expenses/presentation/pages/expenses_screen.dart';
import 'package:split_arch/features/groups/domain/entities/group_list.dart';
import 'package:split_arch/features/profile/presentation/pages/profile_screen.dart';
// import 'package:split_arch/features/groups/presentation/pages/group_screen.dart';
import 'package:split_arch/features/settlement/presentation/pages/settlement_screen.dart';

class BottomNavScreen extends StatefulWidget {
  final GroupList group;

  const BottomNavScreen({super.key, required this.group});

  @override
  BottomNavScreenState createState() => BottomNavScreenState();
}

class BottomNavScreenState extends State<BottomNavScreen> {
  int _currIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      // GroupScreen(),
      ExpensesScreen(groupId: widget.group.id),
      SettlementScreen(groupId: widget.group.id),
      ProfileScreen(group: widget.group),
    ];
    final List<String> appbarString = [
      AppStrings().expenseAppbarTitle,
      AppStrings().settlementAppbarTitle,
      AppStrings().profileAppbarTitle,
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.group, (route) => false,);
            }
          },
        ),
        title: Text(
          appbarString[_currIndex],
          style: AppTextStyles().appBarTitleStyle,
        ),
      ),
      body: screens[_currIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currIndex,
        onTap: (value) {
          setState(() {
            _currIndex = value;
          });
        },
        items: [
          // BottomNavigationBarItem(icon: Icon(Icons.groups), label: AppStrings().groupNavbarText),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.arrowRightLeft, weight: 800, size: 24.0,),
            label: AppStrings().expenseNavbarText,
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.refreshCcw, weight: 800, size: 24.0,),
            label: AppStrings().settlementNavbarText,
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.users, weight: 800, size: 24.0,),
            label: AppStrings().profileNavbarTitle,
          ),
        ],
        unselectedLabelStyle: AppTextStyles().bottomNavbarUnselectedText,
        selectedLabelStyle: AppTextStyles().bottomNavbarSelectedText,
      ),
    );
  }
}
