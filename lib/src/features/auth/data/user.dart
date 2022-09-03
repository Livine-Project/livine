import 'package:flutter_riverpod/flutter_riverpod.dart';

final userTypeProvider = StateProvider<int>((ref) => 0);

final userTokenProvider = StateProvider<String>((ref) => '');

final guestProvider = StateProvider<bool>((ref) => false);
