import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',  // Provide the base URL
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    // Ensure Dio is initialized
    if (dio == null) {
      throw Exception('Dio is not initialized. Call DioHelper.init() first.');
    }

    // Make the GET request with the given URL and query parameters
    try {
      return await dio!.get(url, queryParameters: query);
    } catch (e) {
      rethrow; // Rethrow the error so it can be caught elsewhere
    }
  }
}

//https://newsapi.org/v2/top-headlines?country=us&apiKey=39721576109c4a2c847640f5f6f82dac
