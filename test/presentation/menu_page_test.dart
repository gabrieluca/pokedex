import 'package:cate_mobile_flutter/main.dart';
import 'package:cate_mobile_flutter/poke_atlas/presentation/screens/home/home_page.dart';
import 'package:cate_mobile_flutter/poke_atlas/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// class MocktHttpService extends Mock implements HttpService {}

// class MockDatasource extends Mock implements Datasource {}

// class MockPokedexRepository extends Mock implements PokedexRepository {}

void main() {
  // setUpAll(() {
  //   final getIt = GetIt.I;
  //   getIt.registerLazySingleton<HttpService>(
  //     () => MocktHttpService(),
  //   );
  //   getIt.registerLazySingleton<Datasource>(
  //     () => MockDatasource(),
  //   );
  //   getIt.registerLazySingleton<PokedexRepository>(
  //     () => MockPokedexRepository(),
  //   );
  // });

  testWidgets('Menu Page', (tester) async {
    await tester.pumpWidget(const PokeAtlasApp());
    await shouldNavigateToHomePage(tester);
    await shouldNavigateToListPage(tester);
  });
}

Future<void> shouldCloseMenuPage(WidgetTester tester) async {
  await tester.pumpAndSettle();

  await tester.tap(
    find.byKey(
      const Key(KeyConstants.headerMenuButton),
    ),
  );

  await tester.pumpAndSettle();

  expect(find.text(TextConstants.appTitle), findsOneWidget);
  expect(find.text(TextConstants.menuHomeTitle), findsOneWidget);
  expect(find.text(TextConstants.menuListTitle), findsOneWidget);

  await tester.tap(
    find.byKey(
      const Key(KeyConstants.headerCloseButton),
    ),
  );
  expect(find.byType(HomePage), findsOneWidget);
}

Future<void> shouldNavigateToHomePage(WidgetTester tester) async {
  await tester.pumpAndSettle();

  await tester.tap(
    find.byKey(
      const Key(KeyConstants.headerMenuButton),
    ),
  );

  await tester.pumpAndSettle();

  expect(find.text(TextConstants.appTitle), findsOneWidget);
  expect(find.text(TextConstants.menuHomeTitle), findsOneWidget);
  expect(find.text(TextConstants.menuListTitle), findsOneWidget);

  await tester.ensureVisible(
    find.byKey(
      const Key(KeyConstants.menuHomeButton),
    ),
  );
  await tester.pumpAndSettle();
  await tester.tap(
    find.byKey(
      const Key(KeyConstants.menuHomeButton),
    ),
  );
  await tester.pumpAndSettle();
  expect(find.byType(HomePage), findsOneWidget);
}

Future<void> shouldNavigateToListPage(WidgetTester tester) async {
  await tester.pumpAndSettle();

  await tester.tap(
    find.byKey(
      const Key(KeyConstants.headerMenuButton),
    ),
  );

  await tester.pumpAndSettle();

  expect(find.text(TextConstants.appTitle), findsOneWidget);
  expect(find.text(TextConstants.menuHomeTitle), findsOneWidget);
  expect(find.text(TextConstants.menuListTitle), findsOneWidget);
  await tester.ensureVisible(
    find.byKey(
      const Key(KeyConstants.menuListButton),
    ),
  );
  await tester.pumpAndSettle();
  await tester.tap(
    find.byKey(
      const Key(KeyConstants.menuListButton),
    ),
  );
  // await tester.pumpAndSettle(const Duration(seconds: 5));
  // expect(find.byType(ListPage), findsOneWidget);
}
