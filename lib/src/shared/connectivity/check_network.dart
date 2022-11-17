import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ConnectivityStatus { On, Off, Unknown }

class CheckNetworkNotifier extends StateNotifier<ConnectivityStatus> {
  StreamController<ConnectivityResult> controller =
      StreamController<ConnectivityResult>();

  CheckNetworkNotifier() : super(ConnectivityStatus.Unknown) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      ConnectivityStatus newState;
      switch (result) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
        case ConnectivityResult.ethernet:
          newState = ConnectivityStatus.On;
          break;
        case ConnectivityResult.none:
        case ConnectivityResult.bluetooth:
        case ConnectivityResult.vpn:
          newState = ConnectivityStatus.Off;
          break;
      }
      if (mounted) {
        if (newState != state) {
          state = newState;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}

final checkNetworkProvider =
    StateNotifierProvider<CheckNetworkNotifier, ConnectivityStatus>(
        (ref) => CheckNetworkNotifier());
