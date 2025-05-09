import 'package:flutter/material.dart';
import 'package:what_chat/app/splash_screen/splash_screen.dart';
import 'package:what_chat/app/theme/theme.dart';
import 'package:what_chat/app/welcome_page/welcome_page.dart';
import 'package:what_chat/route/generate_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        dialogBackgroundColor: appBarColor,
        appBarTheme: AppBarTheme(
          color: appBarColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: GenerateRoute.route,
      routes: {"/": (context) => WelcomePage()},
    );
  }
}
