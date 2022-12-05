// // Flutter imports:
// import 'package:flutter/material.dart';
//
// // Package imports:
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_offline/flutter_offline.dart';
//
// // Project imports:
// import '../../../../core/global/extensions/context_extensions.dart';
//
// class ConnectivityScaffold extends StatelessWidget {
//   final Widget body;
//   final Color? backgroundColor;
//   final Widget? appBar;
//   final Widget? bottomNavigationBar;
//   final Widget? bottomSheet;
//   final Widget? offlineBody;
//   final bool? resizeToAvoidBottomInset;
//
//   const ConnectivityScaffold(
//       {required this.body,
//       this.backgroundColor,
//       this.appBar,
//       this.bottomNavigationBar,
//       this.bottomSheet,
//       this.offlineBody,
//       this.resizeToAvoidBottomInset = true});
//
//   @override
//   Widget build(BuildContext context) {
//     var isConnected = false;
//
//     return OfflineBuilder(
//       connectivityBuilder: (
//         context,
//         connectivity,
//         child,
//       ) {
//         isConnected = connectivity != ConnectivityResult.none;
//
//         final textTheme = Theme.of(context).textTheme;
//         return Scaffold(
//           resizeToAvoidBottomInset: resizeToAvoidBottomInset,
//           backgroundColor: backgroundColor,
//           bottomSheet: bottomSheet,
//           appBar: (appBar != null)
//               ? appBar as AppBar
//               : !isConnected
//                   ? PreferredSize(
//                       preferredSize: const Size.fromHeight(0),
//                       child: AppBar(
//                         elevation: 0,
//                         automaticallyImplyLeading: false,
//                         backgroundColor: Colors.transparent,
//                       ),
//                     )
//                   : null,
//           bottomNavigationBar: bottomNavigationBar ?? const SizedBox.shrink(),
//           body: GestureDetector(
//             onTap: () {
//               FocusScope.of(context).requestFocus(FocusNode());
//             },
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Material(
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 350),
//                     color: isConnected
//                         ? const Color(0xFF03fcbe)
//                         : const Color(0xFFD11015),
//                     height: isConnected ? 0 : 30,
//                     child: AnimatedSwitcher(
//                       duration: const Duration(milliseconds: 350),
//                       child: isConnected
//                           ? Text(
//                               AppLocalizations.of(context)!
//                                   .internet_connected
//                                   .toUpperCase(),
//                               style: textTheme.bodyText1!.copyWith(
//                                 color: context.theme.corePalatte.white,
//                               ),
//                             )
//                           : Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text(
//                                   AppLocalizations.of(context)!
//                                       .internet_disconnected
//                                       .toUpperCase(),
//                                   style: textTheme.bodyText1!.copyWith(
//                                       color: context.theme.corePalatte.white),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 SizedBox(
//                                   width: 12,
//                                   height: 12,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2,
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                       context.theme.corePalatte.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: isConnected
//                       ? body
//                       : offlineBody ??
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const CircleAvatar(
//                                 child: Icon(
//                                   Icons.wifi,
//                                   color: Colors.white,
//                                 ),
//                                 backgroundColor: Color(0xFFD11015),
//                                 minRadius: 35,
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                               Text(
//                                 AppLocalizations.of(context)!
//                                     .no_connection_title
//                                     .toUpperCase(),
//                                 style: textTheme.subtitle1!.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                               Text(
//                                 AppLocalizations.of(context)!
//                                     .no_connection_message
//                                     .toUpperCase(),
//                                 textAlign: TextAlign.center,
//                                 style: textTheme.subtitle2!.copyWith(),
//                               ),
//                             ],
//                           ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       child: const SizedBox(),
//     );
//   }
// }
