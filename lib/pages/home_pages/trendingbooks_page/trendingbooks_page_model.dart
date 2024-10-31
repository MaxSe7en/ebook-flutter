import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'trendingbooks_page_widget.dart' show TrendingbooksPageWidget;
import 'package:flutter/material.dart';

class TrendingbooksPageModel extends FlutterFlowModel<TrendingbooksPageWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (RemoveFavouritebook)] action in Container widget.
  ApiCallResponse? getTrendingDetete;
  // Stores action output result for [Backend Call - API (AddFavouriteBookApi)] action in Container widget.
  ApiCallResponse? getTrendingAdd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

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
