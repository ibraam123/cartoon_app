
import 'package:flutter/cupertino.dart';

class SettingEntity {
  final IconData icon;
  final String text;
  final String? subText;
  final bool? haveForwardIcon;

  const SettingEntity({
    required this.icon,
    required this.text,
    this.subText,
    this.haveForwardIcon,

});
}