import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_app/models/destination.dart';
import 'package:guide_app/redux/app/app_state.dart';
import 'package:guide_app/redux/destination_info/destination_info_actions.dart';
import 'package:guide_app/routes.dart';
import 'package:guide_app/ui/common/FadeRoute.dart';
import 'package:guide_app/ui/common/info_message_view.dart';
import 'package:guide_app/ui/destination_info/destination_info_page.dart';
import 'package:guide_app/ui/destinations/destination_list_tile.dart';

class DestinationsList extends StatelessWidget {
  static const Key emptyViewKey = Key('emptyView');
  static const Key contentKey = Key('content');

  DestinationsList(this.destinations);

  final List<Destination> destinations;

  DestinationCard _buildCard(Destination destination) {
    return DestinationCard(
      destination: destination,
      initialDelay: 500,
      onTapped: () => {},
    );
  }

  @override
  Widget build(BuildContext context) {
    if (destinations.isEmpty) {
      return const InfoMessageView(
        key: emptyViewKey,
        title: 'All empty!',
        description: 'Didn\'t find any tourism sites',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 0.0),
      itemCount: destinations.length,
      itemBuilder: (BuildContext context, int index) {
        return Hero(
          tag: destinations[index].photo,
          child:
          DestinationCard(
              destination: destinations[index],
              initialDelay: 500,
              onTapped: () {
                var store = StoreProvider.of<AppState>(context);
                store.dispatch(new SelectedDestinationAction(
                    destinationCard: _buildCard(destinations[index])));
//                  Navigator.pushNamed(context, AppRoutes.destinationInfo);
//                  Navigator.push
                Navigator.push(
                  context,
                  new FadeRoute(widget: DestinationInfoPage()),
                );
              }),
        );
      },
    );
  }
}
