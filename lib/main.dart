import 'package:corso_emanuele/router/custom_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FirstApp());

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: CustomRouter().getRouter(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme?.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // home: const ChatList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
