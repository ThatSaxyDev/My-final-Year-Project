import 'package:flutter/material.dart';
import 'package:project_news_restart/common/bottom_nav_bar.dart';
import 'package:project_news_restart/features/auth/services/auth_service.dart';
import 'package:project_news_restart/features/home/screens/home_screen.dart';
import 'package:project_news_restart/features/onboarding/screens/onboarding_screen.dart';
import 'package:project_news_restart/providers/user_provider.dart';
import 'package:project_news_restart/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProjectNewsR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomNavBar()
          : const OnboardingScreen(),
    );
  }
}
