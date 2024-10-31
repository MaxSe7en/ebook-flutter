import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_favorites_yet_model.dart';
export 'no_favorites_yet_model.dart';

class NoFavoritesYetWidget extends StatefulWidget {
  const NoFavoritesYetWidget({super.key});

  @override
  State<NoFavoritesYetWidget> createState() => _NoFavoritesYetWidgetState();
}

class _NoFavoritesYetWidgetState extends State<NoFavoritesYetWidget> {
  late NoFavoritesYetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoFavoritesYetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/No_Favorites_Yet.png',
              fit: BoxFit.contain,
              alignment: const Alignment(0.0, 0.0),
            ),
          ),
          Text(
            'No Favorites Yet',
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
            'Your favorite list is empty please wait for some time go to home and enjoy your service',
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
        ],
      ),
    );
  }
}