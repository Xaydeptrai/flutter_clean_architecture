import 'package:imdb/domain/entities/token_data.dart';

abstract class TokenRepository {
  TokenData getToken();

  // Future<TokenData> refreshToken(TokenData token);
  //
  // Future<void> saveToken(TokenData token);
  //
  // Future<void> deleteToken(TokenData token);
}