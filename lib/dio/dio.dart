import 'package:dio/dio.dart';
import 'package:sliver/dio/model.dart';

class Services {
  static const baseurl = 'https://jsonplaceholder.typicode.com/todos';
  static const receiverTimeout = 20;
  static const connectTimeout = 20;
  static Dio? dio;

  static Future init() async {
    dio = Dio(BaseOptions(
      baseUrl: baseurl,
      connectTimeout: const Duration(seconds: connectTimeout),
      receiveTimeout: const Duration(seconds: receiverTimeout),
    ));
  }

  Future<dynamic> getData() async {
    try {
      // ignore: unnecessary_string_interpolations
      final response = await dio!.get('$baseurl');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Model.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
