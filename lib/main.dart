import 'package:flutter/material.dart';
import 'loading.dart';
import 'home.dart';
import 'settings.dart';
import 'signup.dart';
import 'fakecall.dart';
import 'mapScreen.dart';

void main() => runApp(MaterialApp(
    routes: {
      '/': (context) => Loading(),
      '/signup': (context) => Signup(),
      '/home': (context) => HomeScreen(),
      '/settings': (context) => SettingsScreen(),
      '/fakecall': (context) => FakeCall(),
      '/safespaces': (context) => MapScreen()
    })
);
