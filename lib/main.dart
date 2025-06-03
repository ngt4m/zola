import 'package:flutter/material.dart';
import 'package:what_chat/app/splash_screen/splash_screen.dart';
import 'package:what_chat/app/theme/theme.dart';
import 'package:what_chat/app/welcome_page/welcome_page.dart';
import 'package:what_chat/route/generate_route.dart';
import 'main_injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
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
