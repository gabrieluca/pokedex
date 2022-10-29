import 'package:cate_mobile_flutter/main.dart';
import 'package:cate_mobile_flutter/poke_atlas/presentation/screens/home/menu_page.dart';
import 'package:cate_mobile_flutter/poke_atlas/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;
  testWidgets('Home Page', (tester) async {
    await tester.pumpWidget(const PokeAtlasApp());
    await openHomePage(tester);
  });
}

Future<void> openHomePage(WidgetTester tester) async {
  await tester.pumpAndSettle();

  expect(find.text(TextConstants.appTitle), findsOneWidget);
  expect(find.text(TextConstants.homeTitle), findsOneWidget);
  expect(find.text(TextConstants.homeDescription), findsOneWidget);

  await tester.tap(
    find.byKey(
      const Key(KeyConstants.headerMenuButton),
    ),
  );

  await tester.pumpAndSettle();

  expect(find.byType(MenuPage), findsOneWidget);
}
