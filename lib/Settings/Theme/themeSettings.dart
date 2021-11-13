import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Settings'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Consumer(builder: (context, watch, child) {
              final theme = watch(themeProvider);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'System Prefrence',
                    style:
                        GoogleFonts.bebasNeue(fontSize: 18.0, letterSpacing: 3),
                  ),
                  Switch(
                    value: theme.themeMode == ThemeMode.system ? true : false,
                    onChanged: (value) {
                      context.read(themeProvider).setSystem();


                    },
                  )
                ],
              );
            }),
            Consumer(
              builder: (context , watch , child) {
              final theme = watch(themeProvider);

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.light_mode, color: Colors.yellow),
                  Text(
                    'Light Theme',
                    style:
                        GoogleFonts.bebasNeue(fontSize: 18.0, letterSpacing: 3),
                  ),
                  Switch(
                    value: theme.themeMode == ThemeMode.light ? true : false,
                    onChanged: (value) {
                      if (!value) {
                        context.read(themeProvider).setSystem();
                      } else {
                        context.read(themeProvider).setLight();
                      }
                    },
                  )
                ],
              );
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.dark_mode, color: Colors.deepPurpleAccent[400]),
                Text(
                  'Dark Theme',
                  style:
                      GoogleFonts.bebasNeue(fontSize: 18.0, letterSpacing: 3),
                ),
                Switch(
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (value) {
                    if (!value) {
                      context.read(themeProvider).setSystem();
                    } else {
                      context.read(themeProvider).setDark();
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
