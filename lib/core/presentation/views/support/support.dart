import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Container(
        // Ajusta el tamaño del Container según sea necesario
        width: double.infinity, // Ancho completo
        height: double.infinity, // Altura completa
        child: const SupportPage(),
      );
  }
}

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final List<String> _questions = [
    '¿Cómo hago una transferencia?',
    '¿Cómo pago mis servicios?',
    '¿Dónde está el vencimiento y el CVV de mi tarjeta digital?',
    '¿Cómo consulto mis estados de cuenta?',
    '¿Cómo hago un retiro sin tarjeta?',
    '¿Cómo reporto un cargo no reconocido?',
    '¿En qué horario se reflejan las transferencias que hago?',
    '¿Cómo recibo un depósito en mi cuenta?'
  ];
  final List<String> _solutions = [
    'Ingresa a tu aplicación bancaria, selecciona la opción de transferencia, ingresa los datos del destinatario y el monto a transferir, confirma la operación con tu contraseña o PIN.',
    'Accede a tu aplicación bancaria, busca la opción de pagos o servicios, selecciona el servicio que deseas pagar.',
    'El vencimiento está impreso en el frente de la tarjeta. El CVV se encuentra en la parte posterior, generalmente junto a la firma.',
    'Accede a tu aplicación bancaria, busca la opción de estados de cuenta, selecciona el periodo que deseas consultar.',
    'Accede a tu aplicación bancaria, busca la opción de retiro sin tarjeta, sigue las instrucciones para generar un código de retiro.',
    'Accede a tu aplicación bancaria, busca la opción de reportar cargos no reconocidos, proporciona los detalles del cargo y tu reclamo.',
    'Las transferencias generalmente se reflejan en tu cuenta en un plazo de 1 a 2 horas hábiles, dependiendo del horario y del banco destinatario.',
    'Proporciona tus datos bancarios (número de cuenta, clabe, etc.) a la persona que te enviará el depósito, el dinero se reflejará en tu cuenta en un plazo de 1 a 2 días hábiles.'
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              'Soporte',
              style: TextStyle(
                // Aquí puedes agregar los estilos que desees
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color.fromRGBO(124,77,246,1.000),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Preguntas frecuentes',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...List.generate(
                    _questions.length,
                    (index) => _buildQuestionCard(
                      _questions[index],
                      _solutions[index],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        launchUrl(_teleLaunchUri);
                      },
                      icon: const Icon(Icons.call),
                      label: const Text('Llamar a soporte'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(String question, String solution) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        collapsedBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(solution),
          ),
        ],
      ),
    );
  }

  final Uri _teleLaunchUri = Uri(
    scheme: 'tel',
    path: '+52 998 404 1690', // your number
  );
}
