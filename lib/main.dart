import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Ejercicio Card"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          height: 180,
          width:300,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color.fromARGB(255, 0, 106, 255),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //banco 
           Row(children: [Text("BancaApp",style: TextStyle(color: Colors.white,fontSize: 22,),),
           SizedBox(width: 100,),Text("Credito",style: TextStyle(color:Colors.white),)],), 
                //chip
            Row(children: [Icon(Icons.cell_tower,color:Colors.white,) ,Icon(Icons.credit_card,color:Color.fromARGB(148, 247, 245, 245),),
            SizedBox(height: 10,),Image(image:AssetImage("assets/images/chip.png"))],),       
              //N tarjeta
            Text("5255667891927272",style: TextStyle(color:Colors.white,fontSize: 20),),    
            SizedBox(height: 10,),            
            //vencimiento
            Row(children: [Text("Valido Hasta:",style: TextStyle(color: Colors.white,fontSize: 10),),SizedBox(width: 5,),Text("07/27",style: TextStyle(color:Colors.white,fontSize: 16),)],),
            SizedBox(height: 1,),
            //titular
            Row(children: [Text("Diego L. Poot Uc",style: TextStyle(color:Colors.white,fontSize: 16),),
            SizedBox(height: 8,),SizedBox(width: 65,),Text("BancaApp",style: TextStyle(color:Colors.white),)])
          
          ]),
        ),
      ),
    );
  }
}
