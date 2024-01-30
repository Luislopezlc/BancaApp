import 'package:flutter/material.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zona Zero',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(
        personName: '"Persona"',
        moneyAmount: 29990,
        income: 1000,
        expenses: 1000,
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final String personName;
  final int moneyAmount;
  final int income;
  final int expenses;

  const DashboardPage({
    required this.personName,
    required this.moneyAmount,
    required this.income,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zona Zero'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Hola $personName',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 24),
              Text(
                'TU DINERO \$$moneyAmount',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: [
                  DashboardButton(
                    title: 'Transferir',
                    icon: Icons.send,
                    onPressed: () {
                      // Acción al presionar el botón de transferir
                    },
                  ),
                  DashboardButton(
                    title: 'Oportunidades',
                    icon: Icons.star,
                    onPressed: () {
                      // Acción al presionar el botón de oportunidades
                    },
                  ),
                  DashboardButton(
                    title: 'Retiros sin Tarjeta',
                    icon: Icons.money,
                    onPressed: () {
                      // Acción al presionar el botón de retiros sin tarjeta
                    },
                  ),
                  DashboardButton(
                    title: 'Más',
                    icon: Icons.more_horiz,
                    onPressed: () {
                      // Acción al presionar el botón de "más"
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Ingresos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$$income',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 12),
              Text(
                'Gastos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$$expenses',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 12),
              Text(
                'Mis Tarjetas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.credit_card,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const DashboardButton({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
    );
  }
}