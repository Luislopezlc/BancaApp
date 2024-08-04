import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/domain/configuration_variables.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/patchUserDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/userDTO.dart';
import 'package:flutter_application_1/core/domain/models/profileModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/repositories/implProfileRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class profileRepository implements implProfileRepository {
  var dio = Dio();
  final storage = const FlutterSecureStorage();
  Logger logger = Logger();
  @override
  Future<ProfileModel> loadProfileModel() async {
    final Map<String, dynamic> response = jsonDecode(
        await rootBundle.loadString("assets/json_data/profile.json"));
    return ProfileModel.fromJson(response);
  }

  @override
  Future<ResponseAPI> getUser() async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
    UserDTO user = UserDTO(
      id: null, // Puede ser nulo
      name: '',
      lastname: '',
      email: '',
      rfc: '',
      phone: '',
      password: '',
      id_bank: 0,
    );

    String? token = await storage.read(key: 'jwt_token');

    if (token == null || token.isEmpty) {
      result.status = '400';
      result.data = 'No se puedo obtener el token';
      return result;
    }

    configurationDio(token);
    try {
      Response response = await dio.get(
        '$apiUrl/users',
      );

      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == "Success") {
          user = UserDTO.fromJson(data['data']);
          result.status = '200';
          result.data = user;
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
  Future<ResponseAPI> patchUser(PatchUserDTO user) async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
    String? token = await storage.read(key: 'jwt_token');

    if (token == null || token.isEmpty) {
      result.status = '400';
      result.data = 'No se puedo obtener el token';
      return result;
    }

    configurationDio(token);
    try {
      Response response = await dio.patch(
        '$apiUrl/users',
        data: user.toJson(),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        if (data['status'] == "success") {
          result.message = data['message'];
          result.data = user;
          result.status = '200';
        } else {
          result.message = data['message'];
          result.status = '400';
        }
      }
    } catch (e) {
      result.status = '400';
      result.message = 'No se pudo obtener la información, intentar más tarde';
    }

    return result;
  }
}
