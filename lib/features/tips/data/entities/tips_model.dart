import 'package:flutter/material.dart';

class TipsModel {
  final String tipImageUrl;
  final String tipType;
  final Color tipTypeColor;
  final String tipTitle;
  final String tipDescription;
  final String tipsDate;
  TipsModel({
    required this.tipImageUrl,
    required this.tipType,
    required this.tipTypeColor,
    required this.tipTitle,
    required this.tipDescription,
    required this.tipsDate,
  });
  
}
