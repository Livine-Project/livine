import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:win32_registry/win32_registry.dart';

final scaffoldMessengerKeyPod = Provider((ref) {
  return GlobalKey<ScaffoldMessengerState>();
});

final scaffoldMessengerPod = Provider((ref) {
  return ref.read(scaffoldMessengerKeyPod).currentState!;
});

final contextMenuProvider = Provider(ContextMenu.new);

class ContextMenu {
  final Ref ref;
  ContextMenu(this.ref);
  static const String _keyPath = r'SystemFileAssociations\image\shell';
  final String appPath = Platform.resolvedExecutable;
  final String requiredKey = "Scan with Livine";

  bool checkCommand() {
    try {
      final RegistryKey _key = Registry.openPath(RegistryHive.classesRoot,
          path: _keyPath, desiredAccessRights: AccessRights.allAccess);

      if (_key.subkeyNames.contains(requiredKey)) {
        return true;
      }
    } catch (e) {
      return false;
    }

    return false;
  }

  void createCommand() {
    final scaffoldMessenger = ref.read(scaffoldMessengerPod);

    try {
      final RegistryKey _key = Registry.openPath(RegistryHive.classesRoot,
          path: _keyPath, desiredAccessRights: AccessRights.allAccess);

      if (checkCommand() == false) {
        final subKey = _key.createKey(requiredKey);
        subKey.createValue(RegistryValue("Icon", RegistryValueType.string,
            "E:/Projects/Livine/livine/windows/runner/resources/app_icon.ico"));
        subKey.createValue(RegistryValue(
            "MultiSelectModel", RegistryValueType.string, "Single"));
        subKey.createKey('command').createValue(
            RegistryValue("", RegistryValueType.string, "\"$appPath\" %1"));
        _key.close();

        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
                'Added "Scan with Livine" in context menu, try right clicking an image'),
          ),
        );
      } else {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Already added "Scan with Livine" in context menu'),
          ),
        );
      }
    } catch (e) {
      print(e.toString());

      if (e.toString().contains('Access')) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Access denied, rerun Livine as an administrator'),
          ),
        );
      }
      if (e.toString().contains('0x80070006')) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Restart Livine and try again'),
          ),
        );
      }
    }
  }

  void deleteCommand() {
    final scaffoldMessenger = ref.read(scaffoldMessengerPod);

    try {
      final RegistryKey _key = Registry.openPath(RegistryHive.classesRoot,
          path: _keyPath, desiredAccessRights: AccessRights.allAccess);

      if (checkCommand()) {
        _key.deleteKey(requiredKey, recursive: true);
        _key.close();
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Removed "Scan with Livine" from context menu'),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      if (e.toString().contains('The system cannot find the file specified.')) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('File not found'),
          ),
        );
      }
      if (e.toString().contains('0x80070005')) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Access denied, rerun Livine as an administrator'),
          ),
        );
      }
      if (e.toString().contains('0x80070006')) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Restart Livine and try again'),
          ),
        );
      }
    }
  }
}
