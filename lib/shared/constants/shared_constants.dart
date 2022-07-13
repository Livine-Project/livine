import '../controllers/cache/cache_helper.dart';

String userType = CacheHelper.getString("userType") ?? "";

bool username = CacheHelper.getBool("username") ?? false;

int testID = CacheHelper.getInt("userID") ?? 0;

bool isGuest = CacheHelper.getBool("isGuest") ?? false;

bool isBoarded = CacheHelper.getBool("isBoarded") ?? false;