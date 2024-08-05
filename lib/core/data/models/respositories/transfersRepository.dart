import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/configuration_variables.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/PostTransferDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/contactDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/transferDTO.dart';
import 'package:flutter_application_1/core/domain/models/listTransfersModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/models/transfersModel.dart';
import 'package:flutter_application_1/core/domain/repositories/implTransfersRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class transfersRepository implements implTransfersRepository {
  var dio = Dio();
  final storage = const FlutterSecureStorage();
  Logger logger = Logger();

  @override
  Future<TransferModel> loadTransferModel() async {
    final Map<String, dynamic> response = jsonDecode(
        await rootBundle.loadString('assets/json_data/transfers.json'));
    return TransferModel.fromJson(response);
  }

  @override
  Future<ListTransfersModel> loadListTransferModel() async {
    final Map<String, dynamic> response = jsonDecode(
        await rootBundle.loadString('assets/json_data/transfers.json'));
    return ListTransfersModel.fromJson(response);
  }

  List<TransferModel> transferModelListFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) => TransferModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  List<Map<String, dynamic>> transferModelListToJson(
      List<TransferModel> modelList) {
    return modelList.map((model) => model.toJson()).toList();
  }

  @override
  Future<ResponseAPI> getTransfers() async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
    List<TransferDTO> transfers = [];

    String? token = await storage.read(key: 'jwt_token');

    if (token == null || token.isEmpty) {
      result.status = '400';
      result.message = 'No se puedo obtener el token';
      return result;
    }
  configurationDio(token);
    try {
      Response response = await dio.get(
        '$apiUrl/transferences',
      );

      if (response.statusCode == 200) {
        var data = response.data;

        if (data['status'] == 'Success') {
          transfers = TransferDTO.fromJsonList(data['data']);
          result.data = transfers;
          result.status = '200';
        }
      }
    } catch (e) {
      result.status = '400';
      result.message = 'No se pudo obtener la información, intentar más tarde';
    }

    return result;
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
  
  @override
  Future<ResponseAPI> getContacts() async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
    List<ContactDTO> contacts = [];

    String? token = await storage.read(key: 'jwt_token');

    if (token == null || token.isEmpty) {
      result.status = '400';
      result.message = 'No se puedo obtener el token';
      return result;
    }
  configurationDio(token);
    try {
      Response response = await dio.get(
        '$apiUrl/contacts',
      );

      if (response.statusCode == 200) {
        var data = response.data;

        if (data['status'] == 'Success') {
          contacts = ContactDTO.listFromJson(data['data']);
          result.data = contacts;
          result.status = '200';
        }
      }
    } catch (e) {
      result.status = '400';
      result.message = 'No se pudo obtener la información, intentar más tarde';
    }

    return result;
  }

  @override
  Future<ResponseAPI> postTransfer(PostTransferDTO transfer) async {
  ResponseAPI result = ResponseAPI(status: '400', data: {});
    String? token = await storage.read(key: 'jwt_token');

    if (token == null || token.isEmpty) {
      result.status = '400';
      result.message = 'No se puedo obtener el token';
      return result;
    }
  configurationDio(token);
     try {
      Response response = await dio.post(
        '$apiUrl/transferences',
        data: transfer.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.data;

        if (data['status'] == 'Success') {
          result.message = data['message'];
          result.status = '200';
        }
      }
    } catch (e) {
      if (e is DioError) {
      if (e.type == DioErrorType.response) {
        Response? errorResponse = e.response;
        if (errorResponse != null) {
            if(errorResponse.statusCode == 401 || errorResponse.statusCode == 400)
            { 
              result.status = "400";
              String message = errorResponse.data['message'];

              if(message.contains('user'))
              {
              message = 'Hubo un error con tu cuenta, inténtalo más tarde';
              }else if(message.contains('receptor'))
              {
                  message = 'La cuenta no existe. Verifica el número e inténtalo de nuevo.';
              }
              else{
                  message = 'No se pudo realizar la acción, inténtalo más tarde';
              }
               result.message = message;
            }
          }
        } 
      }else{
        result.status = '400';
      result.message = 'No se pudo realizar la acción, inténtalo más tarde';
      }
    }

  return result;
  }
}
