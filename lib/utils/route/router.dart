import 'package:flutter/material.dart';

import '../../presentation/ui/login_screen.dart';
import '../../presentation/ui/schedule_screen.dart';


class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/schedule':
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      default:
        return null;
    }
  }
}
