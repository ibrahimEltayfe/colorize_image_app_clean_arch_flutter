import 'package:colorize_image/core/config/injector/injector_config.dart';
import 'package:colorize_image/core/config/router/app_routers_config.dart';
import 'package:colorize_image/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() async{
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: RoutesManager.routes,
      initialRoute: HomePage.routeName,
    );
  }
}
