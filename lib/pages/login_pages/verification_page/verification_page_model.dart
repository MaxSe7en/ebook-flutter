import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verification_page_widget.dart' show VerificationPageWidget;
import 'package:flutter/material.dart';

class VerificationPageModel extends FlutterFlowModel<VerificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a valid pin code';
    }
    if (val.length < 4) {
      return 'Requires 4 characters.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (UserverificationApi)] action in Button widget.
  ApiCallResponse? verifyOtpFunction;
  // Stores action output result for [Backend Call - API (GetFavouriteBook)] action in Button widget.
  ApiCallResponse? getFavourite;
  // Stores action output result for [Backend Call - API (RemoveFavouritebook)] action in Button widget.
  ApiCallResponse? getAllBookDetete;
  // Stores action output result for [Backend Call - API (AddFavouriteBookApi)] action in Button widget.
  ApiCallResponse? getAllBookAdd;
  // Stores action output result for [Backend Call - API (SignupApi)] action in RichTextSpan widget.
  ApiCallResponse? singupFunctionResendotp;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
    pinCodeController?.dispose();
  }
}
