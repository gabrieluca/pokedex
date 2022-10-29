import 'package:flutter_test/flutter_test.dart';

import 'injection.dart';
import 'menu_page_test.dart';

void main() {
  testWidgets('List Page', (tester) async {
    await createApp(tester);
    await shouldNavigateToHomePage(tester);
    await shouldNavigateToListPage(tester);
    //Check if the list page is displayed
  });
}
