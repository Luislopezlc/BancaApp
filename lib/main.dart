import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/models/respositories/loginRepository.dart';
import 'package:flutter_application_1/core/data/models/respositories/profileRepository.dart';
import 'package:flutter_application_1/core/data/models/respositories/registerRepository.dart';
import 'package:flutter_application_1/core/domain/usecases/load_login_data.dart';
import 'package:flutter_application_1/core/domain/usecases/load_profile_data.dart';
import 'package:flutter_application_1/core/domain/usecases/load_register_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/login_bloc.dart';
import 'package:flutter_application_1/core/presentation/bloc/profile_bloc.dart';
import 'package:flutter_application_1/core/presentation/bloc/register_bloc.dart';
import 'package:flutter_application_1/core/presentation/views/login/loginOfficial.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      home: MultiBlocProvider(
        providers: [
          BlocProvider<RegisterBloc>(
            create: (BuildContext context) => RegisterBloc(LoadRegisterData(RegisterRepository())),
          ),
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(LoadLoginData(LoginRepository())),
          ),
           BlocProvider<ProfileBloc>(
            create: (BuildContext context) => ProfileBloc(LoadProfileData(profileRepository())),
          ),
          // Aquí puedes agregar otros BlocProviders si es necesario
          // BlocProvider<OtroBloc>(
          //   create: (BuildContext context) => OtroBloc(),
          // ),
        ],
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      
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
