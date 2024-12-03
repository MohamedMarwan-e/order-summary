import 'package:flutter/material.dart';

import '../core/navigation/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.instance.getRoutes(),
      title: 'OrdersSummary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1A73E8),
            iconTheme: IconThemeData(color: Colors.white)
        ),
        useMaterial3: true,
      ),
    );
  }
}