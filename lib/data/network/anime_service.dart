import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../model/anime_response.dart';

part 'anime_service.g.dart';

@RestApi()
abstract class AnimeService {
  factory AnimeService(Dio dio, {String baseUrl}) = _AnimeService;

  @GET("/top/characters")
  Future<AnimeResponse> getAnimeList();
}

Dio buildDioClient(String baseUrl) {
  final dio = Dio()..options = BaseOptions(baseUrl: baseUrl);
  dio.interceptors.add(
    PrettyDioLogger(
      maxWidth: 90,
      requestHeader: true,
      compact: true,
      error: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
    ),
  );
  return dio;
}
