import '/components/nav_bar_componant_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'navbar_home_page_widget.dart' show NavbarHomePageWidget;
import 'package:flutter/material.dart';

class NavbarHomePageModel extends FlutterFlowModel<NavbarHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarComponant component.
  late NavBarComponantModel navBarComponantModel;

  @override
  void initState(BuildContext context) {
    navBarComponantModel = createModel(context, () => NavBarComponantModel());
  }

  @override
  void dispose() {
    navBarComponantModel.dispose();
  }
}
