import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/features/get_recipes/domain/recipe/recipe.dart';

final isIsraelProvider = FutureProvider<bool>((ref) async {
  final Uri url = Uri.parse('https://api.country.is/');
  final response = await client.get(url);
  final body = response.body;
  final decodedBody = jsonDecode(body);
  final countryCode = decodedBody['country'];
  return countryCode == "IL";
});


class BannedIsraelWidget extends StatelessWidget {
  const BannedIsraelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => Scaffold(
            backgroundColor: Color.fromARGB(255, 32, 32, 32),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sorry Livine doesn't support Israel, we stand with Palestine 🇵🇸",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Kine',
                      color: Color.fromARGB(255, 176, 255, 186)),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text(
                      "Exit Livine",
                    ))
              ],
            ))));
  }
}
