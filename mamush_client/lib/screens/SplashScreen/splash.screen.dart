import 'dart:async';

import 'package:flutter/material.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/screens/SplashScreen/LocalWidgets/splash_screen_description.widget.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/services/storage.service.dart';
import 'package:momrecipes/setup/injection.dart';
import 'package:momrecipes/widgets/app.screen.dart';

class AppSplashScreen extends StatefulWidget {
  @override
  AppSplashScreenState createState() => AppSplashScreenState();
}

class AppSplashScreenState extends State<AppSplashScreen> {
  static const int _splashTimeInSeconds = 2;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScreen(
        child: SplashScreenDescription(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  Future<void> _startTimer() async {
    _timer = Timer(
      const Duration(
        seconds: _splashTimeInSeconds,
      ),
      _navigateToRelevantScreen,
    );
  }

  Future<void> _navigateToRelevantScreen() async {
    final StorageService storageService = getIt<StorageService>();
    final String? token = storageService.token;
    NavigationService navigationService = getIt<NavigationService>();
    navigationService.navigateReplace(
      token != '' ? Routes.homeScreen : Routes.phoneScreen,
      null,
    );
  }
}
