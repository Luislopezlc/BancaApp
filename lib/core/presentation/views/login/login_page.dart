import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/presentation/views/login/login.dart';

class LoginPage extends StatefulWidget {
State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>
{
  Widget build(Object context)
  {
    return Login();
  }
}