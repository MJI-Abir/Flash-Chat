import 'dart:core';

import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';


class Routes{
  static const String welcomeScreen = '/welcome';
  static const String home = '/home';
  static const String chatScreen = '/chat';
  static const String loginScreen = '/login';
  static const String registrationScreen = '/register';

  static Map<String, WidgetBuilder> routes = {
    welcomeScreen: (_) => const WelcomeScreen(),
    chatScreen: (_) => const ChatScreen(),
    loginScreen: (_) => LoginScreen(),
    registrationScreen: (_) => RegistrationScreen(),
  };
}
