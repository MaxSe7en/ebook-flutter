import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'verifiy_email_alrt_model.dart';
export 'verifiy_email_alrt_model.dart';

class VerifiyEmailAlrtWidget extends StatefulWidget {
  const VerifiyEmailAlrtWidget({
    super.key,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.phone,
    required this.password,
  });

  final String? email;
  final String? firstname;
  final String? lastname;
  final String? username;
  final String? phone;
  final String? password;

  @override
  State<VerifiyEmailAlrtWidget> createState() => _VerifiyEmailAlrtWidgetState();
}

class _VerifiyEmailAlrtWidgetState extends State<VerifiyEmailAlrtWidget> {
  late VerifiyEmailAlrtModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifiyEmailAlrtModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Container(
          width: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 396.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 400.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 400.0;
            } else {
              return 400.0;
            }
          }(),
          height: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 416.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 420.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 420.0;
            } else {
              return 420.0;
            }
          }(),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(19.0, 30.0, 19.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/verifiy_email_icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Verify your email',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                              lineHeight: 1.5,
                            ),
                      ),
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Verify your email ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'SF Pro Display',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                widget.email,
                                'Email',
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                                height: 1.5,
                              ),
                            ),
                            const TextSpan(
                              text: ' please enter 4 digit code check inbox',
                              style: TextStyle(),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.5,
                                  ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ].divide(const SizedBox(height: 12.0)),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.goNamed(
                      'VerificationPage',
                      queryParameters: {
                        'firstname': serializeParam(
                          widget.firstname,
                          ParamType.String,
                        ),
                        'lastname': serializeParam(
                          widget.lastname,
                          ParamType.String,
                        ),
                        'username': serializeParam(
                          widget.username,
                          ParamType.String,
                        ),
                        'email': serializeParam(
                          widget.email,
                          ParamType.String,
                        ),
                        'password': serializeParam(
                          widget.password,
                          ParamType.String,
                        ),
                        'phone': serializeParam(
                          widget.phone,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'Verify now',
                  options: FFButtonOptions(
                    width: 250.0,
                    height: 56.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'SF Pro Display',
                          color: Colors.white,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                          lineHeight: 1.2,
                        ),
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
