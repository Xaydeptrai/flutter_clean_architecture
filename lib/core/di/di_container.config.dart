// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:imdb/core/dio/dio_model.dart' as _i9;
import 'package:imdb/data/remote/movie_api.dart' as _i6;
import 'package:imdb/data/repositories/movie_repository_iml.dart' as _i8;
import 'package:imdb/data/repositories/token_repository_iml.dart' as _i4;
import 'package:imdb/domain/repositories/movie_repository.dart' as _i7;
import 'package:imdb/domain/repositories/token_repository.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModel = _$DioModel();
    gh.singleton<_i3.TokenRepository>(() => _i4.TokenRepositoryIml());
    gh.singleton<_i5.Dio>(
      () => dioModel.getUnauthorizedDioClient(),
      instanceName: 'Unauthorized',
    );
    gh.singleton<_i5.Dio>(
        () => dioModel.getAuthorizedDioClient(gh<_i3.TokenRepository>()));
    gh.singleton<_i6.MovieApi>(() => _i6.MovieApi(gh<_i5.Dio>()));
    gh.singleton<_i7.MovieRepository>(
        () => _i8.MovieRepositoryIml(gh<_i6.MovieApi>()));
    return this;
  }
}

class _$DioModel extends _i9.DioModel {}
