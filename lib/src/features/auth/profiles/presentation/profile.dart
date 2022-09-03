import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/shared_constants.dart';
import '../../application/auth_service.dart';
import '../../../loading/loading.dart';
import '../../../get_recipes/application/vegan_service.dart';
import '../../../../shared/styles/lib_color_schemes.g.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../data/user.dart';
import '../../domain/user.dart';
import '../data/get_user_data.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guest = ref.watch(guestProvider);

    AsyncValue<UserData> userData = ref.watch(userDataProvider);

    log("PROFILE ERROR " + userData.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? darkColorScheme.background
            : lightColorScheme.secondaryContainer,
        title: Text(
          LocaleKeys.Profile.tr(),
          style: TextStyle(
            fontFamily: context.locale.languageCode == "en"
                ? 'Kine'
                : GoogleFonts.notoKufiArabic().fontFamily,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          userData.when(
            data: (data) {
              String guestChange() {
                if (data.username == "GUEST") if (context.locale.languageCode ==
                    "en")
                  return "Guest";
                else
                  return "ضيف";
                return data.username ?? "";
              }

              final isVeg = ref.watch(isVeganProvider);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserInfo(
                    name: guestChange(),
                    image: 'assets/images/profile/default.png',
                  ),
                  Visibility(
                    visible: isGuest == false && guest == false,
                    child: FlutterSwitch(
                      value: isVeg,
                      onToggle: (v) async {
                        ref.read(isVeganProvider.notifier).update((state) => v);
                        await ref.read(veganServiceProvider).updateIsVegan(v);
                      },
                      inactiveColor: Colors.brown[300]!,
                      inactiveIcon: Image.asset(
                        'assets/images/icons/meat.png',
                        color: Colors.brown,
                      ),
                      activeColor: getColorScheme(context).secondary,
                      activeToggleColor: getColorScheme(context).onSecondary,
                      activeIcon: Image.asset(
                        "assets/images/icons/vegan.png",
                        color: getColorScheme(context).secondary,
                      ),
                    ),
                  ),
                ],
              );
            },
            error: (e, s) {
              log('$e\n$s');

              return kDebugMode ? Text(e.toString()) : const Loading();
            },
            loading: () => const Loading(),
          ),
          Visibility(
            visible: isGuest == false && guest == false,
            child: ProfileMenu(
              name: LocaleKeys.Favorites.tr(),
              icon: Iconsax.heart5,
              press: () => context.push('/favorites'),
            ),
          ),
          ProfileMenu(
            name: LocaleKeys.choose_content.tr().toString(),
            icon: Icons.grass_rounded,
            press: () => context.push('/choose_content'),
          ),
          ProfileMenu(
            name: LocaleKeys.Logout.tr().toString(),
            icon: Iconsax.logout,
            press: () => guest == false && isGuest == false
                ? ref.read(authHelperProvider).logOut(context)
                : ref.read(authHelperProvider).logOutAsGuest(context),
          ),
          Visibility(
            visible: isGuest == false && guest == false,
            child: ProfileMenu(
              name: LocaleKeys.delete_account.tr().toString(),
              icon: Iconsax.profile_delete,
              press: () => ref.read(authHelperProvider).deleteUser(context),
              color: getColorScheme(context).error,
            ),
          ),
        ]),
      ),
      floatingActionButton: Visibility(
        visible: isGuest == false && guest == false,
        child: FloatingActionButton(
          onPressed: () => context.push(
            "/update_profile",
          ),
          child: const Icon(Iconsax.edit),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.name,
    required this.icon,
    required this.press,
    this.color,
  }) : super(key: key);
  final String name;
  final IconData icon;
  final void Function() press;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: color,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              name,
              style: TextStyle(
                  fontFamily: context.locale.languageCode == "en"
                      ? 'Kine'
                      : GoogleFonts.notoKufiArabic().fontFamily,
                  fontSize: 17.0,
                  color: color),
            ),
            const Spacer(),
            Icon(
              context.locale.languageCode == "en"
                  ? FontAwesomeIcons.chevronRight
                  : FontAwesomeIcons.chevronLeft,
              size: 20,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);
  final String name, image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Stack(children: [
        ClipPath(
          clipper: CustomShape(),
          child: Container(
            height: 150,
            color: Theme.of(context).brightness == Brightness.dark
                ? darkColorScheme.background
                : lightColorScheme.secondaryContainer,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 8,
                  ),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: context.locale.languageCode == "en"
                      ? 'Kine'
                      : GoogleFonts.notoKufiArabic().fontFamily,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
