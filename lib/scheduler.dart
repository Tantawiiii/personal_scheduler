import 'package:flutter/material.dart';
import 'package:personal_scheduler/presentation/provider/auth_provider.dart';
import 'package:personal_scheduler/presentation/provider/theme_provider.dart';
import 'package:personal_scheduler/presentation/ui/login_screen.dart';
import 'package:personal_scheduler/presentation/ui/schedule_screen.dart';
import 'package:provider/provider.dart';


class Scheduler extends StatelessWidget {
  const Scheduler({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Personal Scheduler',
          theme: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: Colors.blue,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: themeProvider.themeMode,
          home: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return authProvider.isAuthenticated
                  ? const ScheduleScreen()
                  : const LoginScreen();
            },
          ),
        );
      },
    );
  }
}