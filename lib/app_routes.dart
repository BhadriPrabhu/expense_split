import 'package:flutter/material.dart';
import 'package:split_arch/bottom_nav_screen.dart';
// import 'package:flutter/widgets.dart';
import 'package:split_arch/features/groups/presentation/pages/group_screen.dart';

class AppRoutes {
  static const String group = '/';
  static const String bottomNav = '/bottomNav';

  static Route<dynamic> generateRoute(RouteSettings settings){
    final arg = settings.arguments;
    switch(settings.name){
      case group:
      return MaterialPageRoute(builder: (_) => GroupScreen(),);

      case bottomNav:
      return MaterialPageRoute(builder: (_) => BottomNavScreen(groupId: (arg as String?) ?? ''), settings: settings);

      default:
      return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text("No route is defined for ${settings.name}"),),));
    }
  }
}