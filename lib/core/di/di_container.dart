import 'package:get_it/get_it.dart';
import 'package:imdb/core/di/di_container.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> initDi() async{
  await getIt.init();
  return getIt.allReady();
}

// flutter packages pub run build_runner build --delete-conflicting-outputs