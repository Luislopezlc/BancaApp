import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_application_1/core/presentation/views/withdrawals/WithdrawalPage.dart";
import "package:flutter_application_1/core/presentation/views/withdrawals/cardwihdrawals.dart";

class Withdrawals extends StatefulWidget {
  _Withdrawals createState() => _Withdrawals();
}

class _Withdrawals extends State<Withdrawals> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 77, 246, 1.000),
        title: const Text(
          'Retiros',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(child: Column(children: [
        Container(
          color: Color.fromRGBO(124, 77, 246, 1.000),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            children: [
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Saldo maximo a retirar: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '\$20,002',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 15),
                Text(
                  'Importe',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0, // Tamaño del texto del subtítulo
                  ),
                  textAlign: TextAlign.left,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Cardwithdrawals(
                  onPressed: () {
                    navigateToWithdrawalPage(100.0);
                  },
                  buttonText: '\$100',
                  amount: 100.0,
                ),
                SizedBox(height: 15),
                Cardwithdrawals(
                  onPressed: () {
                    navigateToWithdrawalPage(200.0);
                  },
                  buttonText: '\$300',
                  amount: 200.0,
                ),
                SizedBox(height: 15),
                Cardwithdrawals(
                  onPressed: () {
                    navigateToWithdrawalPage(1000.0);
                  },
                  buttonText: '\$1000',
                  amount: 1000.0,
                ),
                SizedBox(height: 15),
              ],
            ),
            SizedBox(width: 15),
            Column(
              children: [
                Cardwithdrawals(
                  onPressed: () {
                    navigateToWithdrawalPage(200.0);
                  },
                  buttonText: '\$200',
                  amount: 200.0,
                ),
                SizedBox(height: 15),
                Cardwithdrawals(
                  onPressed: () {
                    navigateToWithdrawalPage(500.0);
                  },
                  buttonText: '\$500',
                  amount: 500.0,
                ),
                SizedBox(height: 15),
                Cardwithdrawals(
                  onPressed: () {
                    navigateToWithdrawalPage(2000.0);
                  },
                  buttonText: '\$2000',
                  amount: 2000.0,
                ),
                SizedBox(height: 15),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    onTap: () {
                      setState(() {
                        _focusNode.requestFocus();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Ingrese otro importe',
                    ),
                    inputFormatters: [
                      // TextInputFormatter que agrega un "$" al principio del texto
                      FilteringTextInputFormatter.deny(RegExp(r'[^0-9\$]')),
                    ],
                  ),
                  SizedBox(height: 1),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.info,
                    color: Color.fromARGB(255, 224, 96, 207),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      'Solo múltiplos de 100',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(5, 46, 134, 0.537)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top:10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón
                    navigateToWithdrawalPage(double.parse(_controller.text));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Ajusta el valor según sea necesario
                      ),
                      backgroundColor: Color.fromRGBO(
                          124, 77, 246, 1.000), // Color de fondo del botón
                      foregroundColor: Colors
                          .white, // Color del texto del botón cuando está en el estado primario
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .08,
                          vertical: 15), // Ajusta el relleno del botón
                    ),
                    child: Text('Continuar'),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),)
    );
  }

  void navigateToWithdrawalPage(double amount) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            WithdrawalPage(amount: amount, dateTime: DateTime.now()),
      ),
    );
  }
}
