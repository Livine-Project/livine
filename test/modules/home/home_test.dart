import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userTypeTest = StateProvider<int>((ref) => 2);

void main() {
  testWidgets('home ...', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(child: Container()));

    // Verify that our counter starts at 0.
    expect(userTypeTest, 2);
  });
}
