import 'package:internal_core/internal_core.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

Color get appColorBackground => AppColors.instance.background;

Color get appColorElement => AppColors.instance.element;

Color get appColorPrimary => AppColors.instance.primary;

Color get appColorText => AppColors.instance.text;

class AppColors {
  AppColors._();

  static final AppColors _instance = AppColors._();

  static AppColors get instance => _instance;

  Color get text => appValueByTheme(Colors.black, kdark: Colors.white);

  Color get background => appValueByTheme(Colors.white, kdark: Colors.black);

  Color get element =>
      appValueByTheme(Colors.grey[200]!, kdark: Colors.grey[200]!);

  Color get primary => appValueByTheme(hexColor('00BDF9'));

  Color get shimmerHighlightColor => appValueByTheme(hexColor('#1C222C'));

  Color get shimmerBaseColor => appValueByTheme(hexColor('#1C222C'));
  
  Color get hoverColor => appValueByTheme(hexColor('#1C222C'));
}

appValueByTheme(klight, {kdark}) {
  if (AppPrefs.instance.isDarkTheme) {
    return kdark ?? klight;
  }
  return klight;
}
