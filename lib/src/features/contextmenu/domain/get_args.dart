import 'dart:io';

class ScanWithLivineArgs {
  static String argument = "";

  static Future<void> initialize({List<String> args = const []}) async {
    // Retrieve the argument from the command line argument vector on Windows & Linux.
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      if (args.isNotEmpty) {
        argument = args.first;
      }
    }
  }

  static String get argumentValue => argument;
}
