import 'package:flutter/semantics.dart';

class IntransporiaKeys {
  // Onboarding
  static const Key walktrough = Key('__walktrough_screen__');
  static Key walktroughItem(int id) => Key('__walktrough_item_${id}__');

  // Auth
  static const Key auth = Key('__auth_screen__');

  // Home
  static const Key home = Key('__home_screen__');

   static const Key account = Key('__account_screen__');

  // Loading
  static const Key loading = Key('__loading__');

  // Splash
  static const Key splash = Key('__splash_screen__');

  // Slider
  static const Key slider = Key('__slider__');
  static Key sliderItem(int id) => Key('__slider_item__${id}__');
}
