import 'dart:async';

import 'package:redux/redux.dart';
import 'package:guide_app/models/destination.dart';
import 'package:guide_app/networking/server_api.dart';
import 'package:guide_app/redux/app/app_state.dart';
import 'package:guide_app/redux/destinations/destinations_actions.dart';

class DestinationsMiddleware extends MiddlewareClass<AppState> {
  DestinationsMiddleware(this.api);

  final ServerAPI api;

  @override
  Future<Null> call(
      Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is FetchDestinationsAction) {
      try {
        List<Destination> destinations = await _fetchDestinations(next);
        next(ReceivedDestinationsAction(destinations: destinations));
      } catch (e) {
        next(ErrorLoadingDestinationsAction(errorStr: e.toString()));
      }
    }
  }

  Future<List<Destination>> _fetchDestinations(
    NextDispatcher next,
  ) async {
    return await api.fetchDestinations();
  }
}
