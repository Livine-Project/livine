import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../shared/constants/constants.dart';
import '../auth/login.dart';
import '../../shared/components/misc/loading.dart';
import '../../main.dart';
import '../../shared/styles/lib_color_schemes.g.dart';
import '../../translations/locale_keys.g.dart';
import '../../models/user/user.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guest = ref.watch(guestProvider);
    final userID = ref.watch(userIDProvider);

    final userData =
        ref.watch(userProviderID(testID == null ? userID : testID));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? darkColorScheme.background
            : lightColorScheme.secondaryContainer,
        title: Text(
          LocaleKeys.Profile.tr(),
          style: TextStyle(fontFamily: 'Kine'),
        ),
        //TODO: ADD EDIT PROFILE
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            guest || isGuest
                ? UserInfo(
                    name: context.locale.languageCode == "en" ? "GUEST" : "ضيف",
                    email: '',
                    image: 'assets/images/profile/default.png',
                  )
                : userData.when(
                    data: (data) {
                      return UserInfo(
                        name: data.username,
                        email: data.email,
                        image: 'assets/images/profile/default.png',
                      );
                    },
                    error: (e, s) {
                      print('$e\n$s');
                      return kDebugMode ? Text(e.toString()) : Loading();
                    },
                    loading: () => Loading(),
                  ),
            ResponsiveVisibility(
              hiddenWhen: [Condition.largerThan(name: MOBILE)],
              child: ProfileMenu(
                name: LocaleKeys.Settings.tr().toString(),
                icon: Icons.settings,
                press: () => context.push('/settings'),
              ),
            ),
            ProfileMenu(
              name: LocaleKeys.choose_content.tr().toString(),
              icon: Icons.grass_rounded,
              press: () => context.pushNamed('Content'),
            ),
            Consumer(builder: (context, ref, child) {
              return ProfileMenu(
                name: LocaleKeys.Logout.tr().toString(),
                icon: Icons.logout,
                press: () => authHelper.logOut(context, ref,guest),
              );
            }),
          ],
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
  }) : super(key: key);
  final String name;
  final IconData icon;
  final void Function() press;
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
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              name,
              style: TextStyle(fontFamily: 'Kine', fontSize: 17.0),
            ),
            Spacer(),
            Icon(
              context.locale.languageCode == "en"
                  ? FontAwesomeIcons.chevronRight
                  : FontAwesomeIcons.chevronLeft,
              size: 20,
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
    required this.email,
    required this.image,
  }) : super(key: key);
  final String name, email, image;

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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
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
                style: TextStyle(fontSize: 22, fontFamily: 'Kine'),
              ),
              SizedBox(height: 5),
              Text(
                email,
                style:
                    TextStyle(fontWeight: FontWeight.w300, fontFamily: 'Kine'),
              )
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
