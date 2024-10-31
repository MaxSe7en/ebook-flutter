import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_verification_page_widget.dart' show ForgotVerificationPageWidget;
import 'package:flutter/material.dart';

class ForgotVerificationPageModel
    extends FlutterFlowModel<ForgotVerificationPageWidget> {
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

  // Stores action output result for [Backend Call - API (ForgotpasswordverificationApi)] action in Button widget.
  ApiCallResponse? forgotPasswordVerificationFunction;
  // Stores action output result for [Backend Call - API (ForgotpasswordApi)] action in RichTextSpan widget.
  ApiCallResponse? forgotPasswordResendFunction;

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
