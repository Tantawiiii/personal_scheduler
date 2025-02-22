import 'package:flutter/material.dart';
import 'package:personal_scheduler/presentation/provider/auth_provider.dart';
import 'package:personal_scheduler/presentation/provider/task_provider.dart';
import 'package:personal_scheduler/presentation/provider/theme_provider.dart';
import 'package:personal_scheduler/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/services/auth_service.dart' show AuthService;
import 'data/services/task_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final authService = AuthService(prefs);
  final taskService = TaskService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(prefs),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(authService),
        ),
        ChangeNotifierProvider(
          create: (_) => TaskProvider(taskService),
        ),
      ],
      child: Scheduler(),
    ),
  );
}
