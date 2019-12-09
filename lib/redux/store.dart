import 'dart:async';

import 'package:redux/redux.dart';
import 'package:guide_app/networking/server_api.dart';
import 'package:guide_app/redux/app/app_state.dart';
import 'package:guide_app/redux/app/app_reducer.dart';
import 'package:guide_app/redux/destinations/destinations_middleware.dart';

Future<Store<AppState>> createStore() async {
  var serverApi = ServerAPI();

  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [
      DestinationsMiddleware(serverApi),
    ],
  );
}
