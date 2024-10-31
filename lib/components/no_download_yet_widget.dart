import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'no_download_yet_model.dart';
export 'no_download_yet_model.dart';

class NoDownloadYetWidget extends StatefulWidget {
  const NoDownloadYetWidget({super.key});

  @override
  State<NoDownloadYetWidget> createState() => _NoDownloadYetWidgetState();
}

class _NoDownloadYetWidgetState extends State<NoDownloadYetWidget> {
  late NoDownloadYetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDownloadYetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/Icon.png',
            fit: BoxFit.contain,
            alignment: const Alignment(0.0, 0.0),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'No Download Yet',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'SF Pro Display',
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                    lineHeight: 1.5,
                  ),
            ),
            Text(
              'Your download list is empty please wait for some time go to home and enjoy your service',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'SF Pro Display',
                    fontSize: 17.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                    lineHeight: 1.5,
                  ),
            ),
          ].divide(const SizedBox(height: 16.0)),
        ),
        FFButtonWidget(
          onPressed: () async {
            context.safePop();
          },
          text: 'Go to back',
          options: FFButtonOptions(
            width: 250.0,
            height: 56.0,
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'SF Pro Display',
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                  lineHeight: 1.2,
                ),
            elevation: 0.0,
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ].divide(const SizedBox(height: 28.0)),
    );
  }
}