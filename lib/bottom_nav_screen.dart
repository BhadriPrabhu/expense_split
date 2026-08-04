import 'package:flutter/material.dart';
import 'package:split_arch/core/constants/app_text_styles.dart';
import 'package:split_arch/core/constants/strings.dart';
import 'package:split_arch/features/expenses/presentation/pages/expenses_screen.dart';
// import 'package:split_arch/features/groups/presentation/pages/group_screen.dart';
import 'package:split_arch/features/settlement/presentation/pages/settlement_screen.dart';

class BottomNavScreen extends StatefulWidget{
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen>{
  int _currIndex = 0;

  final List<Widget> _screens = [
    // GroupScreen(),
    ExpensesScreen(),
    SettlementScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currIndex,
        onTap: (value) {
          setState(() {
            _currIndex = value;
          });
        },
        items: [
          // BottomNavigationBarItem(icon: Icon(Icons.groups), label: AppStrings().groupNavbarText),
          BottomNavigationBarItem(icon: Icon(Icons.call_split), label: AppStrings().expenseNavbarText),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horizontal_circle_rounded), label: AppStrings().settlementNavbarText),
        ],
        unselectedLabelStyle: AppTextStyles().bottomNavbarUnselectedText,
        selectedLabelStyle: AppTextStyles().bottomNavbarSelectedText,
      ),
    );
  }
}