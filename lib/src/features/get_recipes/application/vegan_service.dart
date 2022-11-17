import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livine/src/features/auth/application/auth_service.dart';

import '../../../constants/constants.dart';
import '../../auth/profiles/data/get_user_data.dart';
import '../domain/recipe/recipe.dart';

final isVeganProvider = StateProvider<bool>((_) => false);

final veganServiceProvider = Provider(VeganService.new);

class VeganService {
  final Ref ref;
  const VeganService(this.ref);

  Future<bool> getIsVegan() async {

    final userData = await ref.watch(userDataProvider.future);

    return userData.isVegan ?? false;
  }

  Future updateIsVegan(bool value) async {
    const url = '$restAPIURL/user/update/';
    final token = ref.read(authHelperProvider).getToken();
    return await client.post(
      Uri.parse(url),
      body: {
        'isVegan': value.toString(),
      },
      headers: {
        'Authorization': 'Token ${token}',
      },
    );
  }
}
