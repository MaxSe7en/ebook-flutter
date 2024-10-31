import '/backend/api_requests/api_calls.dart';
import '/components/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'latest_page_model.dart';
export 'latest_page_model.dart';

class LatestPageWidget extends StatefulWidget {
  const LatestPageWidget({super.key});

  @override
  State<LatestPageWidget> createState() => _LatestPageWidgetState();
}

class _LatestPageWidgetState extends State<LatestPageWidget>
    with TickerProviderStateMixin {
  late LatestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatestPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted();
    });

    animationsMap.addAll({
      'gridViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 30.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(EbookGroup.latestAllBookApiCall.call()))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final latestPageLatestAllBookApiResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.singleAppbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const SingleAppbarWidget(
                      title: 'Latest',
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (FFAppState().connected) {
                          return Builder(
                            builder: (context) {
                              if (EbookGroup.latestAllBookApiCall
                                          .bookDetailsList(
                                        latestPageLatestAllBookApiResponse
                                            .jsonBody,
                                      ) !=
                                      null &&
                                  (EbookGroup.latestAllBookApiCall
                                          .bookDetailsList(
                                    latestPageLatestAllBookApiResponse.jsonBody,
                                  ))!
                                      .isNotEmpty) {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future:
                                        EbookGroup.getFavouriteBookCall.call(
                                      userId: FFAppState().userId,
                                      token: FFAppState().token,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final gridViewGetFavouriteBookResponse =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final bookDetailsList =
                                              EbookGroup.latestAllBookApiCall
                                                      .bookDetailsList(
                                                        latestPageLatestAllBookApiResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toList() ??
                                                  [];

                                          return GridView.builder(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              16.0,
                                              0,
                                              16.0,
                                            ),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 2;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 4;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 6;
                                                } else {
                                                  return 6;
                                                }
                                              }(),
                                              crossAxisSpacing: 0.0,
                                              mainAxisSpacing: 16.0,
                                              childAspectRatio: 0.7,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount: bookDetailsList.length,
                                            itemBuilder: (context,
                                                bookDetailsListIndex) {
                                              final bookDetailsListItem =
                                                  bookDetailsList[
                                                      bookDetailsListIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'Bookdetailspage',
                                                      queryParameters: {
                                                        'name': serializeParam(
                                                          getJsonField(
                                                            bookDetailsListItem,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'image': serializeParam(
                                                          '${FFAppConstants.bookImagesUrl}${getJsonField(
                                                            bookDetailsListItem,
                                                            r'''$.image''',
                                                          ).toString()}',
                                                          ParamType.String,
                                                        ),
                                                        'id': serializeParam(
                                                          getJsonField(
                                                            bookDetailsListItem,
                                                            r'''$._id''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 16.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .shadowColor,
                                                          offset: const Offset(
                                                            0.0,
                                                            4.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, -1.0),
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        12.0,
                                                                        8.0,
                                                                        12.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                200),
                                                                    fadeOutDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                200),
                                                                    imageUrl:
                                                                        '${FFAppConstants.bookImagesUrl}${getJsonField(
                                                                      bookDetailsListItem,
                                                                      r'''$.image''',
                                                                    ).toString()}',
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        148.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    errorWidget: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.png',
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          148.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    bookDetailsListItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'SF Pro Display',
                                                                        fontSize:
                                                                            17.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                        lineHeight:
                                                                            1.5,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  'By ${getJsonField(
                                                                    bookDetailsListItem,
                                                                    r'''$.author.name''',
                                                                  ).toString()}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'SF Pro Display',
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                        lineHeight:
                                                                            1.5,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (FFAppState()
                                                                      .isLogin ==
                                                                  true) {
                                                                if (functions.checkFavOrNot(
                                                                        EbookGroup.getFavouriteBookCall
                                                                            .favouriteBookDetailsList(
                                                                              gridViewGetFavouriteBookResponse.jsonBody,
                                                                            )
                                                                            ?.toList(),
                                                                        getJsonField(
                                                                          bookDetailsListItem,
                                                                          r'''$._id''',
                                                                        ).toString()) ==
                                                                    true) {
                                                                  _model.getLetestlDetete =
                                                                      await EbookGroup
                                                                          .removeFavouritebookCall
                                                                          .call(
                                                                    userId: FFAppState()
                                                                        .userId,
                                                                    token: FFAppState()
                                                                        .token,
                                                                    bookId:
                                                                        getJsonField(
                                                                      bookDetailsListItem,
                                                                      r'''$._id''',
                                                                    ).toString(),
                                                                  );
                                                                } else {
                                                                  _model.getLatestAdd =
                                                                      await EbookGroup
                                                                          .addFavouriteBookApiCall
                                                                          .call(
                                                                    userId: FFAppState()
                                                                        .userId,
                                                                    token: FFAppState()
                                                                        .token,
                                                                    bookId:
                                                                        getJsonField(
                                                                      bookDetailsListItem,
                                                                      r'''$._id''',
                                                                    ).toString(),
                                                                  );
                                                                }

                                                                FFAppState()
                                                                    .clearGetFavouriteBookCacheCache();
                                                              } else {
                                                                FFAppState()
                                                                        .favChange =
                                                                    true;
                                                                FFAppState()
                                                                        .bookId =
                                                                    getJsonField(
                                                                  bookDetailsListItem,
                                                                  r'''$._id''',
                                                                ).toString();
                                                                FFAppState()
                                                                    .update(
                                                                        () {});

                                                                context
                                                                    .pushNamed(
                                                                  'SignInPage',
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        const TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .rightToLeft,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              300),
                                                                    ),
                                                                  },
                                                                );
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: 28.0,
                                                              height: 28.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        16.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .shadowColor,
                                                                    offset:
                                                                        const Offset(
                                                                      0.0,
                                                                      4.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (functions.checkFavOrNot(
                                                                          EbookGroup.getFavouriteBookCall
                                                                              .favouriteBookDetailsList(
                                                                                gridViewGetFavouriteBookResponse.jsonBody,
                                                                              )
                                                                              ?.toList(),
                                                                          getJsonField(
                                                                            bookDetailsListItem,
                                                                            r'''$._id''',
                                                                          ).toString()) ==
                                                                      true) {
                                                                    return Icon(
                                                                      Icons
                                                                          .favorite_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          16.0,
                                                                    );
                                                                  } else {
                                                                    return Icon(
                                                                      Icons
                                                                          .favorite_border_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          16.0,
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation']!),
                                              );
                                            },
                                          ).animateOnPageLoad(animationsMap[
                                              'gridViewOnPageLoadAnimation']!);
                                        },
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Column(
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
                                          'assets/images/No_latest_book_yet.png',
                                          fit: BoxFit.contain,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                      ),
                                      Text(
                                        'No latest book yet',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                      Text(
                                        'Your latest book list is empty please wait for some time go to home and enjoy your service',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          context.goNamed('HomePage');
                                        },
                                        text: 'Go to home',
                                        options: FFButtonOptions(
                                          width: 250.0,
                                          height: 56.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
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
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 16.0)),
                                  ),
                                );
                              }
                            },
                          );
                        } else {
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Lottie.asset(
                              'assets/lottie_animations/No_Wifi.json',
                              width: 150.0,
                              height: 150.0,
                              fit: BoxFit.contain,
                              animate: true,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
