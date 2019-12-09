import 'package:meta/meta.dart';
import 'package:guide_app/models/destination.dart';

class RefreshDestinationsAction {}


class FetchDestinationsAction {}

class ReceivedDestinationsAction {
  ReceivedDestinationsAction({@required this.destinations});
  final List<Destination> destinations;
}

class ErrorLoadingDestinationsAction {
  ErrorLoadingDestinationsAction({@required this.errorStr});
  final String errorStr;
}
