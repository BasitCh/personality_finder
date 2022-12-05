// // Dart imports:
// import 'dart:io';

// // Package imports:
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// // Flutter imports:
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// // Project imports:
// import '../../../../core/global/extensions/context_extensions.dart';
// import '../../../../core/global/languages/entities/language.dart';
// import '../../../../core/global/languages/language_bloc.dart';
// import '../../../../core/global/navigator/mixin/back_navigator.dart';
// import '../../../../core/global/navigator/mixin/error_navigator.dart';
// import '../../../../core/global/theming/theme_cubit/theme_cubit.dart';
// import '../../../../core/global/util/analytics/analytics.dart';
// import '../../../../core/global/util/in_app_update/in_app_updates.dart';
// import '../../../../di/injectable.dart';
// import '../../../app/presentation/widgets/connectivity_scaffold.dart';
// import '../../../app/presentation/widgets/update_dialog.dart';
// import '../../../dynamic_links/presentation/dynamic_link_page.dart';
// import '../../../login/presentation/bloc/login_bloc.dart';
// import '../widgets/todo_list.dart';

// class TodoScreen extends StatefulWidget {
//   static const String routeName = 'todo';

//   const TodoScreen({Key? key}) : super(key: key);

//   @override
//   _TodoScreenState createState() => _TodoScreenState();
// }

// class _TodoScreenState extends State<TodoScreen>
//     with BackNavigatorMixin, ErrorNavigatorMixin
//     implements TodoNavigator {
//   @override
//   void initState() {
//     super.initState();
//     initDynamicLink();
//     Analytics.setCurrentScreen(name: widget.toString());

//     Future.delayed(const Duration(milliseconds: 500), () {
//       _showUpdateDialog(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isDark = context.theme.themeType;

//     return ConnectivityScaffold(
//       appBar: AppBar(
//         title: Text(
//           AppLocalizations.of(context)!.home_title,
//           style: Theme.of(context).textTheme.headline5,
//         ),
//         leading: IconButton(
//             onPressed: () {
//               getIt<ThemeCubit>().switchTheme(themeType: !isDark);
//             },
//             icon: Icon(!context.theme.themeType
//                 ? Icons.brightness_2_outlined
//                 : Icons.light_mode)),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 final locale = AppLocalizations.of(context)!.localeName;

//                 if (locale == 'en') {
//                   getIt<LanguageBloc>()
//                       .add(ToggleLanguageEvent(Languages.languages[1]));
//                 } else {
//                   getIt<LanguageBloc>()
//                       .add(ToggleLanguageEvent(Languages.languages[0]));
//                 }
//               },
//               icon: const Icon(Icons.language)),
//           IconButton(
//             onPressed: () {
//               Navigator.push<dynamic>(
//                   context,
//                   MaterialPageRoute<dynamic>(
//                       builder: (context) => DynamicLinkPage()));
//             },
//             icon: const Icon(Icons.link),
//           ),
//           IconButton(
//             onPressed: () async {
//               // await getIt<LocalNotfications>().showNotification(
//               //     AppLocalizations.of(context)!.notification_title,
//               //     AppLocalizations.of(context)!.notification_body);
//             },
//             icon: const Icon(Icons.notifications),
//           ),
//           IconButton(
//             onPressed: () async {
//               getIt<LoginBloc>().add(const LogOut());
//             },
//             icon: const Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: const TodoList(),
//     );
//   }

//   Future<void> _showUpdateDialog(BuildContext context) async {
//     final inAppUpdates = InAppUpdates();

//     if (InAppUpdates.hasNewUpdate) {
//       final updateData = inAppUpdates.getUpdateData();
//       final isUpdateMandatory =
//           await inAppUpdates.isUpdateMandatory(updateData);
//       if (Platform.isIOS) {
//         await showCupertinoDialog<CupertinoUpdateDialog>(
//           context: context,
//           builder: (context) {
//             return Theme(
//               data: context.theme.themeType
//                   ? ThemeData.dark()
//                   : ThemeData.light(),
//               child: CupertinoUpdateDialog(
//                 versionData: updateData,
//                 isUpdateMandatory: isUpdateMandatory,
//               ),
//             );
//           },
//           barrierDismissible: !isUpdateMandatory,
//         );
//       } else {
//         await showDialog<AlertDialog>(
//           context: context,
//           builder: (context) {
//             return MaterialUpdateDialog(
//               versionData: updateData,
//               isUpdateMandatory: isUpdateMandatory,
//             );
//           },
//           barrierDismissible: !isUpdateMandatory,
//         );
//       }
//     }
//   }

//   Future<void> initDynamicLink() async {
//     // Get any initial links
//     final initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
//     if (initialLink != null) {
//       // ignore: unused_local_variable
//       final deepLink = initialLink.link;
//       handleLink();
//     }

//     FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
//       // ignore: unnecessary_null_comparison
//       if (dynamicLinkData != null) {
//         handleLink();
//       }
//       // ignore: avoid_types_on_closure_parameters, argument_type_not_assignable_to_error_handler
//     }).onError((Error error) {
//       // Handle errors
//     });
//   }

//   // ignore: avoid_void_async
//   void handleLink() {
//     Navigator.push<dynamic>(context,
//         MaterialPageRoute<dynamic>(builder: (context) => DynamicLinkPage()));
//   }
// }

// abstract class TodoNavigator implements BackNavigator, ErrorNavigator {}
