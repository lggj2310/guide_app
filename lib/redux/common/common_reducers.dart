import 'dart:ui';

import 'package:redux/redux.dart';
import 'package:guide_app/redux/common/common_actions.dart';

final changeLocaleReducer = combineReducers<Locale>([
  TypedReducer<Locale, ChangeLanguageAction>(_changeLanguageReducer),
]);

Locale _changeLanguageReducer(Locale locale, ChangeLanguageAction action) {

  return action.locale;
}
