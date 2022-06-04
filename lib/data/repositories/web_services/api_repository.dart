import 'package:dio/dio.dart';

import '../../models/match.dart';
import 'constatnts.dart';

part '../../mappers/match_mapper.dart';

typedef _Json = Map<String, dynamic>;

class ApiRepository {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.base,
    headers: {'Package': 'KlUet6y43te8Jg6G9bkDxN36f9X9ZiTkm'},
  ));
  final _MatchMapper _matchMapper = _MatchMapper();

  Future<List<MatchModel>> getMatches() async {
    try {
      Response response = await _dio.get(ApiConstants.base + ApiConstants.page);
      return _matchMapper.fromJson(response.data);
    } on DioError catch (e) {
      throw DioErrors.fromCode(e);
    } catch (error, trace) {
      print(error);
      print(trace);
      throw const DioErrors();
    }
  }
}

class DioErrors implements Exception {
  const DioErrors([
    this.message = 'An unknown exception occurred.',
  ]);

  factory DioErrors.fromCode(DioError error) {
    String message;
    switch (error.type) {
      case DioErrorType.connectTimeout:
        message = 'server not reachable';
        break;
      case DioErrorType.sendTimeout:
        message = 'send Time out';
        break;
      case DioErrorType.receiveTimeout:
        message = 'server not reachable';
        break;
      case DioErrorType.response:
        message = 'the server response, but with a incorrect status';
        break;
      case DioErrorType.cancel:
        message = 'request is cancelled';
        break;
      case DioErrorType.other:
        error.message.contains('SocketException')
            ? message = 'check your internet connection'
            : message = "Unknown error happened";
        break;
    }
    return DioErrors(message);
  }

  final String message;
}
