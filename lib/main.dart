import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/presentation/views/dashboard/dashboard.dart';
import 'package:flutter_application_1/core/presentation/views/home/home.dart';
import 'package:flutter_application_1/core/presentation/views/login/loginOfficial.dart';
import 'package:flutter_application_1/core/presentation/views/profile/profile.dart';
import 'package:flutter_application_1/core/presentation/views/servicesPay/servicesPay.dart';
import 'package:flutter_application_1/core/presentation/views/support/Support.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white, // Cambiar aquí el color de la flecha
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }
 @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
 
   
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(child: LoginPage()) ;
  }
}
