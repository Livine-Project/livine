import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:livine/src/common_widgets/no_connection.dart';
import 'package:livine/src/translations/domain/translation_provider.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

import '../../../../constants/shared_constants.dart';
import '../../../../shared/connectivity/check_network.dart';
import '../../../get_recipes/application/vegan_service.dart';
import '../../application/auth_service.dart';
import '../data/get_user_data.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool guest = ref.watch(guestProvider);

    ConnectivityStatus network = ref.watch(checkNetworkProvider);
    bool isVeg = ref.watch(isVeganProvider);

    final userData = ref.watch(userDataStreamProvider);
    final word = TranslationRepo.translate(context);
    userData.whenOrNull(
      error: (error, stack) {
        log("PROFILE ERROR $error");
        debugPrintStack(stackTrace: stack);
      },
    );

    int? userPoints =
        userData.maybeWhen(data: (data) => data.points, orElse: () => 0);
    return network == ConnectivityStatus.On
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                word?.profile ?? "",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 0,
            ),
            body: SlidingUpPanel(
              body: Container(
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    CircularPercentIndicator(
                      percent: userPoints! / 100 > 1 ? 1 : userPoints / 100,
                      radius: 60,
                      curve: Curves.easeInCirc,
                      lineWidth: 5,
                      animation: true,
                      center: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/profile/default.png',
                        ),
                        radius: 50,
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      progressColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Icon(
                            Icons.emoji_events_rounded,
                            color: Theme.of(context).colorScheme.onSecondary,
                            size: 35.0,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "$userPoints",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.surface),
                            ),
                            Text(
                              word!.points,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.surface),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              minHeight: MediaQuery.of(context).size.height * 0.5,
              isDraggable: true,
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [],
              panelBuilder: () => Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                child: Icon(Icons.eco,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(word.vegetarian),
                            ],
                          ),
                          Switch.adaptive(
                            value: isVeg,
                            onChanged: (v) async {
                              ref
                                  .read(isVeganProvider.notifier)
                                  .update((state) => v);
                              await ref
                                  .read(veganServiceProvider)
                                  .updateIsVegan(v);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileListTile(
                        onTap: () => context.push("/update_profile"),
                        icon: Icons.edit,
                        name: word.edit_profile),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileListTile(
                        onTap: () => context.push('/choose_content'),
                        icon: Icons.change_circle,
                        name: word.choose_content),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileListTile(
                        onTap: () => context.push('/favorites'),
                        icon: Icons.favorite,
                        name: word.favorites),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileListTile(
                        onTap: () => context.push('/settings'),
                        icon: Icons.settings,
                        name: word.settings),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileListTile(
                        onTap: () => isGuest == false
                            ? showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(word.logout),
                                      content: Text(word.sure_to_logout),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(word.cancel)),
                                        TextButton(
                                            onPressed: () => ref
                                                .read(authHelperProvider)
                                                .logOutfromDjango(context),
                                            child: Text(word.logout)),
                                      ],
                                    ))
                            : ref
                                .read(authHelperProvider)
                                .logOutAsGuest(context),
                        icon: Icons.logout,
                        name: word.logout),
                  ],
                ),
              ),
            )
            // SingleChildScrollView(
            //   child: Column(children: [
            //     userData.when(
            //       data: (data) {
            //         String guestChange() {
            //           // if (data.username ==
            //           //     "GUEST") if (.languageCode == "en")
            //           //   return "Guest";
            //           // else
            //           //   return "ضيف";
            //           return data.username ?? "";
            //         }

            //         final isVeg = ref.watch(isVeganProvider);

            //         return Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             UserInfo(
            //               name: guestChange(),
            //               image: 'assets/images/profile/default.png',
            //             ),
            //             Visibility(
            //               visible: isGuest == false && guest == false,
            //               child: FlutterSwitch(
            //                 value: isVeg,
            //                 onToggle: (v) async {
            //                   ref
            //                       .read(isVeganProvider.notifier)
            //                       .update((state) => v);
            //                   await ref
            //                       .read(veganServiceProvider)
            //                       .updateIsVegan(v);
            //                 },
            //                 inactiveColor: Colors.brown[300]!,
            //                 inactiveIcon: Image.asset(
            //                   'assets/images/icons/meat.png',
            //                   color: Colors.brown,
            //                 ),
            //                 activeColor: colorScheme(context).secondary,
            //                 activeToggleColor: colorScheme(context).onSecondary,
            //                 activeIcon: Image.asset(
            //                   "assets/images/icons/vegan.png",
            //                   color: colorScheme(context).secondary,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         );
            //       },
            //       error: (e, s) {
            //         log('$e\n$s');

            //         return kDebugMode ? Text(e.toString()) : const Loading();
            //       },
            //       loading: () => const Loading(),
            //     ),
            //     GridView.count(
            //       shrinkWrap: true,
            //       physics: NeverScrollableScrollPhysics(),
            //       crossAxisCount: rh.deviceWidth(context) * 0.4 > 300 ? 4 : 3,
            //       childAspectRatio: 1,
            //       children: [
            //         if (isGuest == false && guest == false)
            //           ProfileMenu(
            //             bgColor: colorScheme(context).primaryContainer,
            //             icon: Icons.favorite_rounded,
            //             color: colorScheme(context).onPrimaryContainer,
            //             press: () => context.push('/favorites'),
            //           ),
            //         ProfileMenu(
            //           bgColor: colorScheme(context).tertiaryContainer,
            //           color: colorScheme(context).onTertiaryContainer,
            //           icon: Icons.grass_rounded,
            //           press: () => context.push('/choose_content'),
            //         ),
            //         ProfileMenu(
            //           bgColor: colorScheme(context).inverseSurface,
            //           color: colorScheme(context).onInverseSurface,
            //           icon: Icons.logout,
            //           press: () => guest == false && isGuest == false
            //               ? showDialog(
            //                   context: context,
            //                   builder: (context) => AlertDialog(
            //                         title: Text(word?.logout ?? ""),
            //                         content: Text(word?.sure_to_logout ?? ""),
            //                         actions: [
            //                           TextButton(
            //                               onPressed: () =>
            //                                   Navigator.pop(context),
            //                               child: Text(word?.cancel ?? "")),
            //                           TextButton(
            //                               onPressed: () => ref
            //                                   .read(authHelperProvider)
            //                                   .logOutfromDjango(context),
            //                               child: Text(word?.logout ?? "")),
            //                         ],
            //                       ))
            //               : ref.read(authHelperProvider).logOutAsGuest(context),
            //         ),
            //         if (isGuest == false && guest == false)
            //           ProfileMenu(
            //             bgColor: colorScheme(context).errorContainer,
            //             color: colorScheme(context).onErrorContainer,
            //             icon: Icons.delete_forever,
            //             press: () => showDialog(
            //                 context: context,
            //                 builder: (context) => AlertDialog(
            //                       title: Text(word?.delete_account ?? ""),
            //                       content: Text(word?.sure_to_delete ?? ""),
            //                       actions: [
            //                         TextButton(
            //                             onPressed: () => Navigator.pop(context),
            //                             child: Text(word?.cancel ?? "")),
            //                         TextButton(
            //                             onPressed: () => ref
            //                                 .read(authHelperProvider)
            //                                 .deleteUser(context),
            //                             child: Text(
            //                               word?.delete ?? "",
            //                               style: TextStyle(
            //                                   color:
            //                                       colorScheme(context).error),
            //                             )),
            //                       ],
            //                     )),
            //           ),
            //       ],
            //     )
            //   ]),
            // ),
            // floatingActionButton: Visibility(
            //   visible: isGuest == false && guest == false,
            //   child: FloatingActionButton(
            //     onPressed: () => context.push(
            //       "/update_profile",
            //     ),
            //     child: const Icon(Icons.edit),
            //   ),
            // ),
            )
        : NoConnection();
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    this.onTap,
    required this.name,
    required this.icon,
    this.trailingIcon = const Icon(Icons.arrow_forward),
  });
  final Function()? onTap;
  final String name;
  final IconData icon;
  final Widget trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        title: Text(name),
        trailing: trailingIcon);
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.icon,
    required this.bgColor,
    required this.press,
    this.color,
  }) : super(key: key);
  final IconData icon;
  final void Function() press;
  final Color? color, bgColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: color,
          ),
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
              color: Theme.of(context).colorScheme.secondaryContainer),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                child: Container(
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
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 22,
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
