import 'package:cate_mobile_flutter/poke_atlas/data/api/http_service/http_service.dart';
import 'package:cate_mobile_flutter/poke_atlas/data/datasources/datasource.dart';
import 'package:cate_mobile_flutter/poke_atlas/domain/repositories/pokedex_repository.dart';
import 'package:cate_mobile_flutter/poke_atlas/presentation/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpService extends Mock implements HttpService {}

class MockDatasource extends Mock implements Datasource {}

class MockPokedexRepository extends Mock implements PokedexRepository {}

class Injection {
  static void registerDependencies() {
    final getIt = GetIt.I;
    getIt.registerLazySingleton<HttpService>(
      () => MockHttpService(),
    );
    getIt.registerLazySingleton<Datasource>(
      () => MockDatasource(),
    );
    getIt.registerLazySingleton<PokedexRepository>(
      () => MockPokedexRepository(),
    );
  }
}

Future<void> createApp(WidgetTester tester) async {
  Injection.registerDependencies();
  return await tester.pumpWidget(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
