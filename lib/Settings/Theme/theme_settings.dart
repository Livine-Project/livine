import '../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({Key? key}) : super(key: key);

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
            Consumer(builder: (context, ref, child) {
              final theme = ref.watch(themeProvider);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'System Prefrence',
                    style:
                        GoogleFonts.bebasNeue(fontSize: 18.0, letterSpacing: 3),
                  ),
                  Switch(
                    value: theme.themeMode == ThemeMode.system || false,
                    onChanged: (value) {
                      ref.read(themeProvider).setSystem();


                    },
                  )
                ],
              );
            },),
            Consumer(
              builder: (context , ref , child) {
              final theme = ref.watch(themeProvider);

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
                    value: theme.themeMode == ThemeMode.light || false,
                    onChanged: (value) {
                      if (!value) {
                        ref.read(themeProvider).setSystem();
                      } else {
                        ref.read(themeProvider).setLight();
                      }
                    },
                  )
                ],
              );
              },
            ),
            Consumer(
              builder: (context,ref,child) => Row(
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
                        ref.read(themeProvider).setSystem();
                      } else {
                        ref.read(themeProvider).setDark();
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
