import "package:flutter/material.dart";

class Login extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

     return  Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
       children: [
            Image.asset("assets/images/loginLogo.jpg"),
            const Text("Bienvenido"),
            TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Correo',
          
        ),
      ),
      SizedBox(height: 30.0,)
      ,
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Contraseña',
          
        ),
      ),
      SizedBox(height: 30.0,)
      ,
      TextButton(style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),onPressed: () {},
             child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text("Entrar"), 
               Icon(Icons.arrow_forward, color: Colors.yellow[500])
             ],
             ) 
             ),
      ]
     )
  );

  }



}