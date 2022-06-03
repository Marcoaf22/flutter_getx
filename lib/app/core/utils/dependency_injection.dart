import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx/app/data/provider/authentication.dart';

class DependencyInjection {
  static void init() {
    Get.put<Dio>(Dio(
      BaseOptions(
          baseUrl: 'http://software1-adm.herokuapp.com/api',
          headers: {'Content-Type': 'application/json'}),
    ));

    // providers
    Get.put<Authentication>(Authentication());
    // Get.put<LocalAuth>(LocalAuth());
    // Get.put<MoviesAPI>(MoviesAPI());

    /// repositories
    // Get.put<AuthenticationRepository>(AuthenticationRepository());
    // Get.put<LocalAuthRepository>(LocalAuthRepository());
    // Get.put<MoviesRepository>(MoviesRepository());
  }
}
