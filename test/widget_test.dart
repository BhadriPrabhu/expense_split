import 'package:flutter_test/flutter_test.dart';
import 'package:split_arch/main.dart';

void main() {
  testWidgets('app starts without duplicate navigator keys', (tester) async {
    await tester.pumpWidget(const MainApp());
    expect(find.text('Your Groups'), findsOneWidget);
  });
}
