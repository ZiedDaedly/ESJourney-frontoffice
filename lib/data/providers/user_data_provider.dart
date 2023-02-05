import 'package:dio/dio.dart';
import 'package:esjourney/utils/constants.dart';

class UserDataProvider {
  final dio = Dio()
    ..options.baseUrl = kbaseUrl
    ..options.connectTimeout = 5000
    ..options.receiveTimeout = 3000;

  Future<Response> signIn(String? id,String password) async {
    return await dio.request(
      ksignIn,
      data: {'id': id,'password':password},
      options: Options(method: 'POST'),
    );
  }
}