// // Flutter imports:
// // Package imports:
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:package_info_plus/package_info_plus.dart';

// // Project imports:
// import '../../../core/global/extensions/number_extensions.dart';
// import '../../app/presentation/widgets/standard_text.dart';

// class DynamicLinkPage extends StatefulWidget {
//   @override
//   _DynamicLinkPageState createState() => _DynamicLinkPageState();

//   static const String routeName = 'dynamic_link';
// }

// class _DynamicLinkPageState extends State<DynamicLinkPage> {
//   String link = '';

//   @override
//   void initState() {
//     super.initState();
//     _createLink();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             AppLocalizations.of(context)!.dynamic_link_text,
//             style: Theme.of(context).textTheme.headline5,
//           ),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               StandardText.bodyMedium(
//                   context,
//                   link.isEmpty
//                       ? AppLocalizations.of(context)!.create_link_text
//                       : link),
//               10.verticalSpace,
//               link.isEmpty
//                   ? const SizedBox.shrink()
//                   : OutlinedButton(
//                       onPressed: () {
//                         Clipboard.setData(ClipboardData(text: link)).then((_) {
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text(AppLocalizations.of(context)!
//                                   .link_copied_text)));
//                           Navigator.pop(context);
//                         });
//                       },
//                       child: StandardText.bodyMedium(context,
//                           AppLocalizations.of(context)!.copy_link_text),
//                     )
//             ],
//           ),
//         ));
//   }

//   Future<void> _createLink() async {
//     final packageInfo = await PackageInfo.fromPlatform();
//     if (kDebugMode) {
//       print(packageInfo.packageName);
//     }
//     final dynamicLinkParams = DynamicLinkParameters(
//       link: Uri.parse('https://www.google.com/'),
//       uriPrefix: 'https://morphosis.page.link',
//       androidParameters:
//           AndroidParameters(packageName: packageInfo.packageName),
//       iosParameters: IOSParameters(bundleId: packageInfo.packageName),
//     );
//     final dynamicLink =
//         await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
//     setState(() {
//       link = dynamicLink.shortUrl.toString();
//     });
//   }
// }
