import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nav_bar_componant_model.dart';
export 'nav_bar_componant_model.dart';

class NavBarComponantWidget extends StatefulWidget {
  const NavBarComponantWidget({
    super.key,
    required this.selectedPage,
  });

  final String? selectedPage;

  @override
  State<NavBarComponantWidget> createState() => _NavBarComponantWidgetState();
}

class _NavBarComponantWidgetState extends State<NavBarComponantWidget> {
  late NavBarComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarComponantModel());

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
      height: 80.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget.selectedPage == 'home'
                          ? FlutterFlowTheme.of(context).primary
                          : Colors.transparent,
                      Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          FFIcons.kicon7,
                          color: valueOrDefault<Color>(
                            widget.selectedPage == 'Home'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).secondary,
                            FlutterFlowTheme.of(context).secondary,
                          ),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'HomePage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  'Home',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Display',
                        color: valueOrDefault<Color>(
                          widget.selectedPage == 'Home'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).black40,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                        lineHeight: 1.5,
                      ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget.selectedPage == 'Categories'
                          ? FlutterFlowTheme.of(context).primary
                          : Colors.transparent,
                      Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          FFIcons.kicon5,
                          color: valueOrDefault<Color>(
                            widget.selectedPage == 'wishlist'
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FlutterFlowTheme.of(context).secondary,
                            FlutterFlowTheme.of(context).secondary,
                          ),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'CategoriesScreen',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  'Categories',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Display',
                        color: valueOrDefault<Color>(
                          widget.selectedPage == 'Categories'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondary,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget.selectedPage == 'cart'
                          ? FlutterFlowTheme.of(context).primary
                          : Colors.transparent,
                      Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          FFIcons.kgroup260861431,
                          color: valueOrDefault<Color>(
                            widget.selectedPage == 'Latest'
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FlutterFlowTheme.of(context).secondary,
                            FlutterFlowTheme.of(context).secondary,
                          ),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'LatestPage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  'Latest',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Display',
                        color: valueOrDefault<Color>(
                          widget.selectedPage == 'Latest'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondary,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget.selectedPage == 'cart'
                          ? FlutterFlowTheme.of(context).primary
                          : Colors.transparent,
                      Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          FFIcons.kgroup260861431,
                          color: valueOrDefault<Color>(
                            widget.selectedPage == 'Author'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).secondary,
                            FlutterFlowTheme.of(context).secondary,
                          ),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'LatestPage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  'Latest',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Display',
                        color: valueOrDefault<Color>(
                          widget.selectedPage == 'Author'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondary,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget.selectedPage == 'profile'
                          ? FlutterFlowTheme.of(context).primary
                          : Colors.transparent,
                      Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          FFIcons.kicon9,
                          color: valueOrDefault<Color>(
                            widget.selectedPage == 'Profile'
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FlutterFlowTheme.of(context).secondary,
                            FlutterFlowTheme.of(context).secondary,
                          ),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'ProfilePage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  'Profile',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Display',
                        color: valueOrDefault<Color>(
                          widget.selectedPage == 'Profile'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondary,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
