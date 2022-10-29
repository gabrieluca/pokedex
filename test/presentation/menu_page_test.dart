import 'package:cate_mobile_flutter/main.dart';
import 'package:cate_mobile_flutter/poke_atlas/presentation/screens/home/home_page.dart';
import 'package:cate_mobile_flutter/poke_atlas/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Menu Page', (tester) async {
    await tester.pumpWidget(const PokeAtlasApp());
    await shouldCloseMenuPage(tester);
    await shouldNavigateToHomePage(tester);
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

  await tester.pageBack();

  // await tester.tap(
  //   find.byKey(
  //     const Key(KeyConstants.headerMenuButton),
  //   ),
  // );
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

  await tester.ensureVisible(find.byKey(
    const Key(KeyConstants.menuHomeButton),
  ));
  await tester.pumpAndSettle();
  await tester.tap(
    find.byKey(
      const Key(KeyConstants.menuHomeButton),
    ),
  );
  await tester.pumpAndSettle();
  expect(find.byType(HomePage), findsOneWidget);
}
