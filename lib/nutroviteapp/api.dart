import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sliver/nutroviteapp/source_model.dart';

class SourceApi {
  final Dio _dio = Dio();
  Future<List<SourceNeutrant>?> getSourceOfNeutrents() async {
    try {
      final response = await _dio.get(
          'https://neovatus.onrender.com/api/get/source-of-neutrents/66d394f28f32163ffe0ee323');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        log(response.data.toString());
        return data.map((item) => SourceNeutrant.fromJson(item)).toList();
      } else {
        print('Error: ${response.statusMessage}');
        return null;
      }
    } catch (e, stackTrace) {
      print('Exception caught: $e');
      print('Stacktrace: $stackTrace');
      return null;
    }
  }
}
