import 'package:dio/dio.dart';
import 'package:imdb/core/dio/api_interceptor.dart';
import 'package:imdb/domain/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

const _baseUrl = "https://api.themoviedb.org/3";
const _requestTimeOutInSeconds = Duration(seconds: 7);

@module
abstract class DioModel{


  @singleton
  Dio getAuthorizedDioClient(TokenRepository tokenRepository){

    final dioClient = _dioClient();

    dioClient.interceptors.addAll([
      AuthorizedRequestInterceptor(tokenRepository)
    ]);
    return dioClient;

  }

  @Named('Unauthorized')
  @singleton
  Dio getUnauthorizedDioClient(){
    final dioClient = _dioClient();
    dioClient.interceptors.addAll([
      UnauthorizedRequestInterceptor()
    ]);
    return dioClient;
  }

  Dio _dioClient(){
    final baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: _requestTimeOutInSeconds,
      receiveTimeout: _requestTimeOutInSeconds,
    );
    return Dio(baseOptions);
  }
}