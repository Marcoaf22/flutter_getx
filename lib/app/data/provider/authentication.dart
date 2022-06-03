import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:getx/app/data/model/auth.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class Authentication {
  Status _status = Status.Unauthenticated;
  String? _token;
  Session? session;

  String? get token => this._token;
  Status get status => this._status;

  final Dio _dio = Get.find<Dio>();

  Future<bool> login({String email = '', String password = ''}) async {
    try {
      final Response response = await this._dio.post(
        '/login',
        data: {
          "email": email,
          "password": password,
          "fcm_token": 'test',
        },
      );
      print('Resultatdo de login');
      print(response.data);
      if (response.data['error'] != null) {
        print('🎆 entro en error');
        return false;
      }

      await Auth.instance.setSession(response.data);
      this._status = Status.Authenticated;
      // final String token = await Auth.instance.accessToken;
      print('Login exitoso');
      return true;
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.response?.statusCode);
        print(e.response?.data);
      } else {
        print(e);
      }
      return false;
    }
  }

  Future<bool> register({
    required String foto_url,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String ci,
  }) async {
    try {
      // progressDialog.show();
      final Response response = await this._dio.post(
            '/crearUsuario',
            data: {
              'rol': '0,0,1',
              'departamento_id': 1,
              "name": name,
              "email": email,
              "password": password,
              "telefono": phone,
              "ci": ci,
              'tipo': 'true',
              "foto_url": foto_url,
            },
            options: Options(
              headers: {'Content-Type': 'application/json'},
            ),
          );
      print(response.data);
      // await Auth.instance.setSession(response.data);
      return true;
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e);
      } else {
        print(e);
      }
      return false;
    }
  }
}
