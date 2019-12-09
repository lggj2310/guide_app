
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_app/redux/app/app_state.dart';
import 'package:guide_app/redux/destinations/destinations_actions.dart';
import 'package:guide_app/ui/destinations/destinations_view_model.dart';
import 'package:guide_app/ui/destinations/destinations_view.dart';

class DestinationsPage extends StatelessWidget {
  const DestinationsPage();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DestinationsViewModel>(
      distinct: true,
      converter: (store) => DestinationsViewModel.fromStore(store),
      onInit: (store) => store.dispatch(FetchDestinationsAction()),
      builder: (_, viewModel) => _DestinationsPageContent(viewModel),
    );
  }
}

class _DestinationsPageContent extends StatelessWidget {
  _DestinationsPageContent(this.viewModel);
  final DestinationsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverPadding(
            padding: const EdgeInsets.only(bottom: 20.0, top: 0.0),
            sliver: new SliverFillRemaining(
              child: DestinationsView(
                viewModel: viewModel,
              ),
            ))
      ],
    );
  }
}
