import 'package:fast_app_base/common/data/preference/item/nullable_preference_item.dart';
import 'package:fast_app_base/common/data/preference/item/preference_item.dart';
import 'package:fast_app_base/common/theme/custom_theme.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');

  static final count = NullablePreferenceItem<bool>('count');

  static final count1 = PreferenceItem<int>('count1', 0);
}

maint() {
  Prefs.count.set(true);
  final count = Prefs.count.get();
}
