import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

// import 'package:flutter_cache_manager/file.dart';

class ImageAPI {
  // final String url =
  //     'https://api.cloudinary.com/v1_1/ddxzwiarb/image/upload?upload_preset=bctmwcz3';

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.cloudinary.com/v1_1/ddxzwiarb/image/upload',
  ));

  Future<String?> uploadImage(String pathImage) async {
    try {
      final data = await MultipartFile.fromFile(pathImage,
          contentType: MediaType('hola', 'jgp'));
      FormData formData = await FormData.fromMap({
        'file': data,
      });
      Response response = await dio.post(
        '',
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
        queryParameters: {'upload_preset': 'bctmwcz3'},
        data: formData,
      );
      print(response.data['url']);
      return response.data['url'];
    } catch (e) {
      print(e);
      return null;
    }
  }
}
