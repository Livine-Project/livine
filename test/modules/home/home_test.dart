import 'package:flutter_test/flutter_test.dart';
import 'package:livine/src/features/auth/data/user.dart';
import 'package:livine/src/features/get_recipes/presentation/home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userTypeTest = StateProvider<int>((ref) => 2);

void main() {
  testWidgets('home ...', (tester) async {
    await tester.pumpWidget(ProviderScope(
      child: const Home(),
      overrides: [
        userTypeProvider.overrideWithProvider(userTypeTest),
      ],
    ));
    await tester.pumpAndSettle();
  });
}
