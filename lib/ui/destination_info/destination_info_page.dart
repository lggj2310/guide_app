
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_app/i18n/translations.dart';
import 'package:guide_app/models/destination.dart';
import 'package:guide_app/redux/app/app_state.dart';
import 'package:guide_app/redux/destinations/destinations_actions.dart';
import 'package:guide_app/ui/destination_info/destination_info_view.dart';
import 'package:guide_app/ui/destinations/destinations_view_model.dart';
import 'package:guide_app/ui/destinations/destinations_view.dart';

class DestinationInfoPage extends StatelessWidget {
  const DestinationInfoPage();

  @override
  Widget build(BuildContext context) {
    return DestinationInfoView();
  }
}
