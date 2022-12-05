// // ignore_for_file: non_constant_identifier_names

// // Package imports:
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// // Flutter imports:
// import 'package:flutter/material.dart';

// class DynamicLinksHelper {
//   final String DynamicLink = 'https://8w8re.com/resetpassword';
//   final String Link = 'https://reactnativefirebase.page.link/bFkn';

//   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

//   Future<void> initialize() async {
//     await FirebaseDynamicLinks.instance.getInitialLink();
//   }

//   Future<void> initDynamicLinks() async {
//     try {
//       dynamicLinks.onLink.listen((dynamicLinkData) {
//         debugPrint(dynamicLinkData.toString());

//         // ignore: unnecessary_null_comparison
//         if (dynamicLinkData.link != null) {
//           debugPrint(dynamicLinkData.link.toString());
//         }
//       }).onData((data) {
//         debugPrint(data.toString());
//       });
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
// }
