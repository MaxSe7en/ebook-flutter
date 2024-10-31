import '/backend/api_requests/api_calls.dart';
import '/components/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'latest_page_widget.dart' show LatestPageWidget;
import 'package:flutter/material.dart';

class LatestPageModel extends FlutterFlowModel<LatestPageWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for single_appbar component.
  late SingleAppbarModel singleAppbarModel;
  // Stores action output result for [Backend Call - API (RemoveFavouritebook)] action in Container widget.
  ApiCallResponse? getLetestlDetete;
  // Stores action output result for [Backend Call - API (AddFavouriteBookApi)] action in Container widget.
  ApiCallResponse? getLatestAdd;

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
