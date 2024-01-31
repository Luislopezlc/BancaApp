import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        // Utiliza fromSwatch para establecer el color primario
        // en lugar de fromSeed
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("EJERCICIO CARD"),
      ),
      body: Center(
        child: Container(
          height: 180,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.5),
            color: const Color.fromRGBO(238, 255, 0, 1),
          ),
          child: Column(
            children: [
              Text(
                "Coppel",
                style: TextStyle(color: Colors.blue, fontSize: 40),
              ),
              Row(
                children: [
                  Text(
                    "9987-7894-4846-4818",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 37, 36, 36),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.sim_card,
                    color: Colors.white,
                  ),
                  // Asegúrate de que cada Row tenga un widget principal.
                  Text(
                    "SU CREDITO EN COPPEL VALE MAS QUE EL DINERO",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Cliente distinguido",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
