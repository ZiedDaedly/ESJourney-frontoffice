import 'package:dio/dio.dart';
import 'package:esjourney/utils/constants.dart';

class ClubEventDataProvider {
  final dio = Dio()
    ..options.baseUrl = kbaseUrl
    ..options.connectTimeout = 5000
    ..options.receiveTimeout = 3000;

  Future<Response> getAllClubEvents() async {
    return await dio.request(
      kgetAllClubEvents,
      options: Options(
        method: 'GET',
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }
}