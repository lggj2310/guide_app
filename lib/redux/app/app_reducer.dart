import 'package:guide_app/redux/app/app_state.dart';
import 'package:guide_app/redux/destinations/destinations_reducer.dart';
import 'package:guide_app/redux/destination_info/destination_info_reducer.dart';
import 'package:guide_app/redux/common/common_reducers.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    destinationsState: destinationsReducer(state.destinationsState, action),
    destinationInfoState: destinationInfoReducer(state.destinationInfoState, action),
    appLocale: changeLocaleReducer(state.appLocale, action)
  );
}
