import 'package:get_it/get_it.dart';

import '../data/api/datasource_impl_api.dart';
import '../data/api/http_service/http_service.dart';
import '../data/api/http_service/http_service_impl.dart';
import '../data/datasources/datasource.dart';
import '../data/repositories/pokedex_repository_impl.dart';
import '../domain/repositories/pokedex_repository.dart';

class Injection {
  static void registerDependencies() {
    final getIt = GetIt.I;
    getIt.registerLazySingleton<HttpService>(
      () => HttpServiceImpl(),
    );
    getIt.registerLazySingleton<Datasource>(
      () => DatasourceImplApi(getIt()),
    );
    getIt.registerLazySingleton<PokedexRepository>(
      () => PokedexRepositoryImpl(getIt()),
    );
  }
}
