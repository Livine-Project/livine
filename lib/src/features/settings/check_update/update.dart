// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../common_widgets/auth/auth_widget.dart';
// import '../../../common_widgets/no_connection.dart';
// import '../../../shared/connectivity/check_network.dart';
// import '../../../translations/domain/translation_provider.dart';
// import 'data/update_service.dart';

// class CheckUpdate extends ConsumerStatefulWidget {
//   const CheckUpdate({super.key});

//   @override
//   ConsumerState<CheckUpdate> createState() => _CheckUpdateState();
// }

// class _CheckUpdateState extends ConsumerState<CheckUpdate> {
//   bool loading = false;

//   @override
//   Widget build(BuildContext context) {
//     final word = TranslationRepo.translate(context);
//     String text = word?.check_for_update ?? "Check for update";
//     ConnectivityStatus network = ref.watch(checkNetworkProvider);

//     return Scaffold(
//         body: network == ConnectivityStatus.On
//             ? CustomScrollView(
//                 slivers: [
//                   SliverAppBar.large(
//                     title: Text(word?.check_for_update ?? "Check for update"),
//                   ),
//                   SliverToBoxAdapter(
//                     child: Consumer(
//                       builder: (context, ref, child) {
//                         String percent =
//                             ref.watch(updateServiceProvider).progress;
//                         print(percent);
//                         return CircularPercentIndicator(
//                           percent: percent.isNotEmpty
//                               ? double.parse(percent) / 100
//                               : 0.0,
//                           radius: 100,
//                           lineWidth: 2,
//                           backgroundColor: Colors.transparent,
//                           progressColor:
//                               Theme.of(context).colorScheme.onPrimaryContainer,
//                           center: Text("${percent}%"),
//                         );
//                       },
//                     ),
//                   ),
//                   SliverToBoxAdapter(
//                     child: Consumer(
//                       builder: (context, ref, child) {
//                         List<String> hardware =
//                             ref.watch(getDeviceHardwareProvider).value ?? [];

//                         return authButton(
//                             context: context,
//                             isLoading: loading,
//                             onPressed: () async {
//                               setState(() {
//                                 loading = true;
//                               });
//                               bool isUpdated = await ref
//                                   .watch(updateServiceProvider)
//                                   .isUpdated(
//                                       setState, mounted, hardware.toString());
//                               if (isUpdated) {
//                                 setState(() {
//                                   text = word?.no_update_available ??
//                                       "No update available";
//                                   loading = false;
//                                 });
//                               } else {
//                                 setState(() {
//                                   text = word?.installing_update ??
//                                       "Installing update";
//                                   loading = false;
//                                 });
//                                 showDialog(
//                                     context: context,
//                                     builder: (context) {
//                                       return AlertDialog(
//                                         title: Text(word?.update_available ??
//                                             "Update Available"),
//                                         content: Text(word?.do_install_update ??
//                                             "Do you want to install update?"),
//                                         actions: [
//                                           TextButton(
//                                             onPressed: () {
//                                               Navigator.pop(context);
//                                             },
//                                             child: Text(
//                                                 word?.cancel ?? "Cancel",
//                                                 style: TextStyle(
//                                                     color: Theme.of(context)
//                                                         .colorScheme
//                                                         .error)),
//                                           ),
//                                           TextButton(
//                                             onPressed: () {
//                                               Navigator.pop(context);
//                                               // ref
//                                               //     .watch(updateServiceProvider)
//                                               //     .installUpdate(
//                                               //         setState, mounted);
//                                             },
//                                             child:
//                                                 Text(word?.update ?? "Update"),
//                                           )
//                                         ],
//                                       );
//                                     });
//                               }
//                             },
//                             text: text);
//                       },
//                     ),
//                   ),
//                 ],
//               )
//             : NoConnection());
//   }
// }
