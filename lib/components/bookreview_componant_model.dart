import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bookreview_componant_widget.dart' show BookreviewComponantWidget;
import 'package:flutter/material.dart';

class BookreviewComponantModel
    extends FlutterFlowModel<BookreviewComponantWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Review Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (AddreviewApi)] action in Button widget.
  ApiCallResponse? addReviewFunction;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
