import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bookdetailspage_widget.dart' show BookdetailspageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class BookdetailspageModel extends FlutterFlowModel<BookdetailspageWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Stores action output result for [Backend Call - API (DownloadpdfApi)] action in Container widget.
  ApiCallResponse? downloadApiFunction;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Stores action output result for [Backend Call - API (UsersubscriptionvalidityApi)] action in Container widget.
  ApiCallResponse? userdownloadvalidity;
  // Stores action output result for [Backend Call - API (DownloadpdfApi)] action in Container widget.
  ApiCallResponse? downloadApiFunctionPaid;
  // Stores action output result for [Backend Call - API (DownloadpdfApi)] action in Container widget.
  ApiCallResponse? downloadApiFunctionCopy;
  // Stores action output result for [Backend Call - API (UsersubscriptionvalidityApi)] action in Container widget.
  ApiCallResponse? userdownloadvalidityCopy;
  // Stores action output result for [Backend Call - API (DownloadpdfApi)] action in Container widget.
  ApiCallResponse? downloadApiFunctionPaidCopy;
  // Stores action output result for [Backend Call - API (RemoveFavouritebook)] action in Container widget.
  ApiCallResponse? getDetailBookDetete;
  // Stores action output result for [Backend Call - API (AddFavouriteBookApi)] action in Container widget.
  ApiCallResponse? getDetailBookAdd;
  // Stores action output result for [Backend Call - API (RemoveFavouritebook)] action in Container widget.
  ApiCallResponse? getRelatedCategoryDetete;
  // Stores action output result for [Backend Call - API (AddFavouriteBookApi)] action in Container widget.
  ApiCallResponse? getRelatedCategoryAdd;
  // Stores action output result for [Backend Call - API (UsersubscriptionvalidityApi)] action in Button widget.
  ApiCallResponse? uservalidity;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
