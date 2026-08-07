import 'package:flutter/material.dart';
import 'package:split_arch/bottom_nav_screen.dart';
import 'package:split_arch/features/addGroup/presentation/pages/add_group_screen.dart';
import 'package:split_arch/features/groups/domain/entities/group_list.dart';
// import 'package:flutter/widgets.dart';
import 'package:split_arch/features/groups/presentation/pages/group_screen.dart';

class AppRoutes {
  static const String group = '/';
  static const String bottomNav = '/bottomNav';
  static const String addGroup = '/addGroup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case group:
        return MaterialPageRoute(builder: (_) => const GroupScreen());

      case addGroup:
        return MaterialPageRoute(builder: (_) => const AddGroupScreen());

      case bottomNav:
        final arg = settings.arguments;
        if (arg is GroupList) {
          return MaterialPageRoute(
            builder: (_) => BottomNavScreen(group: arg),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Missing group data for this route')),
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route is defined for ${settings.name}')),
          ),
        );
    }
  }
}