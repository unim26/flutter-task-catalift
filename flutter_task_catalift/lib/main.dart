import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/core/appRoutes/app_routes.dart';
import 'package:flutter_task_catalift/dependency_injection.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
