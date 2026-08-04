import 'package:flutter/material.dart';
import 'package:split_arch/app_routes.dart';
// import 'package:split_arch/bottom_nav_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.group,
      onGenerateRoute: AppRoutes.genarateRoute,
    );
  }
}
