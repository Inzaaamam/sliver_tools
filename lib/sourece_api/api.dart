import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sliver/sourece_api/source_model.dart';

class SourceApi {
  final Dio _dio = Dio();
  Future<List<SourceNeutrant>?> getSourceOfNeutrents() async {
    try {
      final response =
          await _dio.get('https://neovatus.onrender.com/api/prices');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        log(response.data.toString());
        return data.map((item) => SourceNeutrant.fromJson(item)).toList();
      } else {
        // ignore: avoid_print
        print('Error: ${response.statusMessage}');
        return null;
      }
    } catch (e, stackTrace) {
      // ignore: avoid_print
      print('Exception caught: $e');
      // ignore: avoid_print
      print('Stacktrace: $stackTrace');
      return null;
    }
  }
}
