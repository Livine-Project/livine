import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:livine/src/features/get_recipes/presentation/home.dart';

void main() {
  testWidgets('home ...', (tester) async {

    const keyW = Key("K");

    await tester.pumpWidget(ProviderScope(child: MaterialApp(home: Home())));


    expect(find.byKey(keyW), findsOneWidget);
  });
}
