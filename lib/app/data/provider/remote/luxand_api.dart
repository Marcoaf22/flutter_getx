import 'dart:io';

import 'package:dio/dio.dart';

class LuxandAPI {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.luxand.cloud/photo',
  ));

  Future<Map<String, dynamic>?> compareFace(String photo_url) async {
    try {
      print('🎋 compareFace');
      print('El url de la solicitud : $photo_url');
      final data = {
        "photo": photo_url,
      };

      Response response = await _dio.post(
        '/search',
        data: data,
        options: Options(
          contentType:
              ContentType.parse("application/x-www-form-urlencoded").toString(),
          headers: {
            "token": '22fd1796f78149ff9bb2e25f758f5d0b',
          },
        ),
      );

      if ((response.data as List).isEmpty) {
        print('La lista es vacia');
        return null;
      }

      Map<String, dynamic> a = {
        "nombre": response.data['name'],
        "probabilidad": response.data['probability'],
      };
      return a;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
