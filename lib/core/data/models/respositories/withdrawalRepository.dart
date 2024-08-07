import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/configuration_variables.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/accountDTO.dart';
import 'package:flutter_application_1/core/domain/models/withdrawalModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implWithdrawalRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class withdrawalRepository implements implwithdrawalModelRepository {
  var dio = Dio();
  final storage = const FlutterSecureStorage();
  Logger logger = Logger();

  @override
  Future<withdrawalModel> loadWithdrawalModel() async {
    final Map<String, dynamic> response = jsonDecode(
        await rootBundle.loadString('assets/json_data/withdrawal.json'));

    var responseWithoutValue = withdrawalModel.fromJson(response);

    AccountDTO accountDTO;
    String? token = await storage.read(key: 'jwt_token');
    if (token == null || token.isEmpty) {
      return responseWithoutValue;
    }

    await configurationDio(token);
    try {
      Response response = await dio.get(
        '$apiUrl/accounts/me',
      );

      if (response.statusCode == 200) {
        var data = response.data;

        if (data['status'] == 'Sucess') {
          accountDTO = AccountDTO.fromJson(data['data']);
        } else {
          return responseWithoutValue;
        }
      } else {
        return responseWithoutValue;
      }
    } catch (e) {
      return responseWithoutValue;
    }
    responseWithoutValue.maxAmountToRetire = double.parse(accountDTO.balance.toString());

    return  responseWithoutValue;
  }

  configurationDio(String token) async {
    // Configurar interceptor para añadir el token JWT
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Obtener el token JWT
        // Agregar el token a las cabeceras de la solicitud
        options.headers['Authorization'] = 'Bearer $token';
        // Continuar con la solicitud
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Procesar la respuesta
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        // Manejar errores
        return handler.next(e);
      },
    ));
  }
}
