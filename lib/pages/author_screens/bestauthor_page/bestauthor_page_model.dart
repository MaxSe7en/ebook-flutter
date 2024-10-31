import '/components/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bestauthor_page_widget.dart' show BestauthorPageWidget;
import 'package:flutter/material.dart';

class BestauthorPageModel extends FlutterFlowModel<BestauthorPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for single_appbar component.
  late SingleAppbarModel singleAppbarModel;

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
  }
}
