import 'package:flutter/material.dart';
import 'package:afg_sim/routes/app_route.dart';
import 'package:afg_sim/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AFG Sim",
      theme: AppTheme.lightTheme,
      initialRoute: "/splash",
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
