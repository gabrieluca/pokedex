import 'package:cate_mobile_flutter/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    '',
    (WidgetTester tester) async {
      await tester.pumpWidget(const PokeAtlasApp());
    },
  );
  // WidgetController.hitTestWarningShouldBeFatal = true;
  // testWidgets('Menu Page', (tester) async {
  //   await tester.pumpWidget(const PokeAtlasApp());
  //   await shouldNavigateToHomePage(tester);
  //   await shouldNavigateToListPage(tester);
  // });
}
