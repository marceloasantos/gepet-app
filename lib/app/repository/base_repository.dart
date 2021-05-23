import 'package:dio/dio.dart';
import 'package:gepet_app/app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseRepository {
  Dio dio = Dio();

  Future<Response?> get(
      {String? endpoint,
      Map<String, dynamic>? parameters,
      bool requiresToken = true}) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var authorization = prefs.getString("token");

      var result = await dio.get(
        '${Constants.API_URL}$endpoint',
        queryParameters: parameters,
        options: !requiresToken
            ? null
            : Options(
                headers: {
                  'Autorizacao': "Bearer $authorization",
                },
              ),
      );

      return result;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> post(
      {String? endpoint,
      dynamic body,
      dynamic query,
      bool requiresToken = true}) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var authorization = prefs.getString("token");

      var result = await dio.post(
        '${Constants.API_URL}$endpoint',
        queryParameters: query,
        data: body,
        options: !requiresToken
            ? null
            : Options(headers: {
                'Authorization': "Bearer $authorization",
              }),
      );

      return result;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> put(
      {String? endpoint, dynamic body, bool requiresToken = true}) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var authorization = prefs.getString("token");

      var result = await dio.put(
        '${Constants.API_URL}$endpoint',
        data: body,
        options: !requiresToken
            ? null
            : Options(
                headers: {
                  'Authorization': "Bearer $authorization",
                },
              ),
      );

      return result;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> delete(
      {String? endpoint, dynamic query, bool requiresToken = true}) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var authorization = prefs.getString("token");

      var result = await dio.delete(
        '${Constants.API_URL}$endpoint',
        queryParameters: query,
        options: !requiresToken
            ? null
            : Options(
                headers: {'Authorization': "Bearer $authorization"},
              ),
      );

      return result;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
