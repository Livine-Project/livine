import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livine/src/features/auth/profiles/data/get_user_data.dart';

import '../../auth/application/auth_service.dart';

final FutureProvider<String> userNameProvider = FutureProvider<String>(
  (ref) async {
    ref.refresh(userDataProvider).value;
    return await ref.read(authHelperProvider).getUserUsername();
  },
);
