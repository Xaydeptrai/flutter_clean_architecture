import 'package:imdb/domain/entities/token_data.dart';
import 'package:imdb/domain/repositories/token_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryIml implements TokenRepository {

  @override
  TokenData getToken() {
    const accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMjlhYzY3ZGMzODgyZGRlYTU2MGY4NTcxMzdhM2Q2NSIsIm5iZiI6MTcxOTU2ODQxMy42NjcwMiwic3ViIjoiNjY3ZTg2Yzg1MGRmYzcwMThkNDVmNmIwIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.kD1SVDqzfjUqBblbGDo_4HCG_HKJqf58ZzwCerU43EI';
    const refreshToken = '';
    return const TokenData(
        accessToken: accessToken,
        refreshToken: refreshToken
    );
  }


}