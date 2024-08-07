import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_application_1/core/data/models/respositories/transfersRepository.dart";
import "package:flutter_application_1/core/domain/models/apiModels/PostTransferDTO.dart";
import "package:flutter_application_1/core/domain/models/apiModels/contactDTO.dart";
import "package:flutter_application_1/core/domain/models/apiModels/postContactDTO.dart";
import "package:flutter_application_1/core/domain/models/transfersModel.dart";
import "package:flutter_application_1/core/domain/usecases/load_transfer_data.dart";
import "package:flutter_application_1/core/presentation/bloc/transfer_bloc.dart";
import "package:flutter_application_1/core/presentation/bloc/transfer_event.dart";
import "package:flutter_application_1/core/presentation/bloc/transfer_state.dart";
import "package:flutter_application_1/core/presentation/views/errorPage.dart";
import "package:flutter_application_1/core/presentation/widgets/CardTransfers.dart";
import "package:flutter_application_1/core/presentation/widgets/ToastMessageWidget.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class Transfers extends StatefulWidget {
  _Transfers createState() => _Transfers();
}

class _Transfers extends State<Transfers> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferBloc(
        LoadtransferData(transfersRepository()),
      )..add(LoadTransferDataEvent()),
      child: Scaffold(
        body: BlocListener<TransferBloc, TransferState>(
          listener: (context, state) async {
            if (state is TransferError) {
              ToastMessageWidget.show(context, state.message);
            } else if (state is TransferSending) {
              ToastMessageWidget.show(context, state.message);
            } else if (state is TransferSuccess) {
              ToastMessageWidget.show(context, state.message);
            }
          },
          child: BlocBuilder<TransferBloc, TransferState>(
            builder: (context, state) {
              if (state is TransferInitial || state is TransferLoading) {
                return buildTransfer(context, []);
              } else if (state is TransferLoaded) {
                return buildTransfer(context, state.contacts);
              } else if (state is TransferError) {
                return buildTransfer(context, state.contacts);
              } else if (state is TransferSending) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TransferSuccess) {
                return buildTransfer(context, state.contacts);
              } else {
                return ErrorPage();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildTransfer(BuildContext context, List<TransferModel> transfers) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(124, 77, 246, 1.000),
          title: const Text(
            'Transferencias',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Elige al destinatario',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0, // Tamaño del texto del subtítulo
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 70), // Espacio para el botón
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: transfers.map((transfer) {
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            CardTransfers(
                              textName: transfer.name,
                              texto: transfer.iconText,
                              diametro: 30.0,
                              espacioEntre:
                                  10.0, // Espacio entre el círculo y el texto
                              onPressed: () {
                                // Evento al hacer clic en el botón
                                _showDialogTransfer(context, transfer.name,
                                    transfer.creditCardNumber);
                              },
                            ),
                            const SizedBox(height: 8),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón
                      _showServiceDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Ajusta el valor según sea necesario
                      ),
                      backgroundColor: const Color.fromRGBO(
                          124, 77, 246, 1.000), // Color de fondo del botón
                      foregroundColor: Colors
                          .white, // Color del texto del botón cuando está en el estado primario
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .05,
                          vertical: 25), // Ajusta el relleno del botón
                    ),
                    child: const Text('Crear contacto'),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void _showServiceDialog(BuildContext _context) {
    showDialog(
      context: _context,
      builder: (BuildContext context) {
        final TextEditingController _nicknameController =
            TextEditingController();
        final TextEditingController _emailController = TextEditingController();
        final TextEditingController _phoneController = TextEditingController();
        final TextEditingController _banknameController =
            TextEditingController();
        final TextEditingController _accountController =
            TextEditingController();
        final _formKey = GlobalKey<FormState>();
        return AlertDialog(
          title: const Text('Nuevo contacto'),
          content: Form(
              key: _formKey, // Asocia la clave al Form
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nicknameController,
                      decoration: const InputDecoration(labelText: 'Nombre'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'El nombre no puede estar vacio';
                        }

                        // Expresión regular para validar que el nombre no contenga números
                        final namePattern = r"^[A-Za-z\s]+$";
                        final regExp = RegExp(namePattern);

                        if (!regExp.hasMatch(value)) {
                          return 'El nombre no puede contener números';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Correo'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa el correo';
                        }
                        final emailRegExp =
                            RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                        if (!emailRegExp.hasMatch(value)) {
                          return 'Correo inválido';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(labelText: 'Teléfono'),
                      keyboardType:
                          TextInputType.number, // Muestra el teclado numérico
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter
                            .digitsOnly, // Permite solo dígitos
                      ],
                      maxLength: 13,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa tu número de teléfono';
                        }
                        if (value.length < 10 || value.length > 13) {
                          return 'De 10 a 13 dígitos requeridos';
                        }
                        // Expresión regular para validar el formato del teléfono
                        final phonePattern = r"^\+?\d{10,13}$";
                        final regExp = RegExp(phonePattern);

                        if (!regExp.hasMatch(value)) {
                          return 'El teléfono debe ser un número de teléfono válido';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _banknameController,
                      decoration:
                          const InputDecoration(labelText: 'Nombre del banco'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa el banco';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _accountController,
                      decoration:
                          const InputDecoration(labelText: 'Número de tarjeta'),
                      keyboardType:
                          TextInputType.number, // Muestra el teclado numérico
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter
                            .digitsOnly, // Permite solo dígitos
                      ],
                      maxLength: 16,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa el número de tarjeta';
                        }
                        if (value.length < 16) {
                          return 'El número debe ser de 16 dígitos';
                        }
                      },
                    )
                  ],
                ),
              )),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop();

                  PostContactDTO contact = PostContactDTO(
                      nickname: _nicknameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      bankname: _banknameController.text,
                      account: _accountController.text);

                  BlocProvider.of<TransferBloc>(_context)
                      .add(ContactSendEvent(contact));
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Acción relizada correctamente'),
          content: const Text('El contacto se guardo correctamente.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _showDialogTransfer(
      BuildContext _context, String name, String accountNumber) {
    showDialog(
      context: _context,
      builder: (BuildContext context) {
        final _formKey = GlobalKey<FormState>();
        final TextEditingController _conceptController =
            TextEditingController();
        final TextEditingController _amountController = TextEditingController();
        return AlertDialog(
          title: Text('Transferir a: $name'),
          content: Form(
            key: _formKey, // Asocia la clave al Form
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _conceptController,
                  decoration: InputDecoration(labelText: 'Concepto'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El concepto no debe estar vacío';
                    }
                  },
                ),
                TextFormField(
                  controller: _amountController,
                  decoration: InputDecoration(labelText: 'Monto'),
                  keyboardType:
                      TextInputType.number, // Muestra el teclado numérico
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly, // Permite solo dígitos
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El monto no debe estar vacío';
                    }
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  PostTransferDTO transfer = PostTransferDTO(
                    userAccount: '',
                    receptorAccount: accountNumber,
                    amount: int.parse(_amountController.text),
                    concept: _conceptController.text,
                    owner: '', // Supongo que el propietario es fijo.
                  );

                  // Envía el evento al Bloc
                  BlocProvider.of<TransferBloc>(_context)
                      .add(TransferSendEvent(transfer));

                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialogTransfer(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Acción relizada correctamente'),
          content: const Text('Transferencia compleada correctamente.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
