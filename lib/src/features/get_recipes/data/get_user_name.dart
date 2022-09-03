import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/application/auth_service.dart';

final FutureProvider<String> userNameProvider = FutureProvider<String>(
  (ref) async {
    return await ref.read(authHelperProvider).getUserUsername();
  },
);
