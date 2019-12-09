import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:guide_app/models/destination.dart';
import 'package:guide_app/models/loading_status.dart';
import 'package:guide_app/ui/destinations/destination_list_tile.dart';

@immutable
class DestinationInfoState {
  DestinationInfoState({
    @required this.destinationCard,
  });

  final DestinationCard destinationCard;

  factory DestinationInfoState.initial() {
    return DestinationInfoState(
      destinationCard: null,
    );
  }

  DestinationInfoState copyWith({
    DestinationCard destinationCard,
  }) {
    return DestinationInfoState(
      destinationCard: destinationCard ?? this.destinationCard,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DestinationInfoState &&
          runtimeType == other.runtimeType &&
          destinationCard == other.destinationCard;

  @override
  int get hashCode =>
      destinationCard.hashCode;
}
