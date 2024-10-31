import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/components/no_download_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'download_page_model.dart';
export 'download_page_model.dart';

class DownloadPageWidget extends StatefulWidget {
  const DownloadPageWidget({super.key});

  @override
  State<DownloadPageWidget> createState() => _DownloadPageWidgetState();
}

class _DownloadPageWidgetState extends State<DownloadPageWidget> {
  late DownloadPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DownloadPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted();
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: EbookGroup.getFavouriteBookCall.call(
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
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final columnGetFavouriteBookResponse = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.customCenterAppbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CustomCenterAppbarWidget(
                      title: 'Download',
                      backIcon: false,
                      addIcon: false,
                      onTapAdd: () async {},
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (FFAppState().connected) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??= Completer<
                                      ApiCallResponse>()
                                    ..complete(
                                        EbookGroup.downloadhistoryApiCall.call(
                                      userId: FFAppState().userId,
                                      token: FFAppState().token,
                                    )))
                                  .future,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final gridViewDownloadhistoryApiResponse =
                                    snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final downloadDetailsList =
                                        EbookGroup.downloadhistoryApiCall
                                                .downloadDetailsList(
                                                  gridViewDownloadhistoryApiResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                    if (downloadDetailsList.isEmpty) {
                                      return const Center(
                                        child: NoDownloadCompWidget(),
                                      );
                                    }

                                    return RefreshIndicator(
                                      key: const Key('RefreshIndicator_xfq9ow3t'),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      onRefresh: () async {
                                        safeSetState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: GridView.builder(
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
                                          childAspectRatio: 0.8,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: downloadDetailsList.length,
                                        itemBuilder: (context,
                                            downloadDetailsListIndex) {
                                          final downloadDetailsListItem =
                                              downloadDetailsList[
                                                  downloadDetailsListIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'ReadBookCustomPage',
                                                  queryParameters: {
                                                    'pdf': serializeParam(
                                                      '${FFAppConstants.bookImagesUrl}${getJsonField(
                                                        downloadDetailsListItem,
                                                        r'''$.bookDetails.pdf''',
                                                      ).toString()}',
                                                      ParamType.String,
                                                    ),
                                                    'id': serializeParam(
                                                      getJsonField(
                                                        downloadDetailsListItem,
                                                        r'''$.bookDetails._id''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'name': serializeParam(
                                                      getJsonField(
                                                        downloadDetailsListItem,
                                                        r'''$.bookDetails.name''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'image': serializeParam(
                                                      getJsonField(
                                                        downloadDetailsListItem,
                                                        r'''$.bookDetails.image''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                if (getJsonField(
                                                      downloadDetailsListItem,
                                                      r'''$.bookDetails._id''',
                                                    ) ==
                                                    FFAppState()
                                                        .homePageBookId) {
                                                  FFAppState().totalPages = 1;
                                                  FFAppState().update(() {});
                                                } else {
                                                  FFAppState().totalPages = 1;
                                                  FFAppState()
                                                      .homePageCurrentPdfIndex = 1;
                                                  FFAppState().update(() {});
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 231.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 16.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                              MainAxisSize.max,
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
                                                                  downloadDetailsListItem,
                                                                  r'''$.bookDetails.image''',
                                                                ).toString()}',
                                                                width: double
                                                                    .infinity,
                                                                height: 148.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            Text(
                                                              getJsonField(
                                                                downloadDetailsListItem,
                                                                r'''$.bookDetails.name''',
                                                              ).toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                              getJsonField(
                                                                downloadDetailsListItem,
                                                                r'''$.bookDetails.author.name''',
                                                              ).toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (functions.checkFavOrNot(
                                                                  EbookGroup.getFavouriteBookCall
                                                                      .favouriteBookDetailsList(
                                                                        columnGetFavouriteBookResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  getJsonField(
                                                                    downloadDetailsListItem,
                                                                    r'''$.bookDetails._id''',
                                                                  ).toString()) ==
                                                              true) {
                                                            _model.getDownloadDetete =
                                                                await EbookGroup
                                                                    .removeFavouritebookCall
                                                                    .call(
                                                              userId:
                                                                  FFAppState()
                                                                      .userId,
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              bookId:
                                                                  getJsonField(
                                                                downloadDetailsListItem,
                                                                r'''$.bookDetails._id''',
                                                              ).toString(),
                                                            );
                                                          } else {
                                                            _model.getDownloadAdd =
                                                                await EbookGroup
                                                                    .addFavouriteBookApiCall
                                                                    .call(
                                                              userId:
                                                                  FFAppState()
                                                                      .userId,
                                                              token:
                                                                  FFAppState()
                                                                      .token,
                                                              bookId:
                                                                  getJsonField(
                                                                downloadDetailsListItem,
                                                                r'''$.bookDetails._id''',
                                                              ).toString(),
                                                            );
                                                          }

                                                          FFAppState()
                                                              .clearGetFavouriteBookCacheCache();

                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width: 28.0,
                                                          height: 28.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius:
                                                                    16.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .shadowColor,
                                                                offset: const Offset(
                                                                  0.0,
                                                                  4.0,
                                                                ),
                                                              )
                                                            ],
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              if (functions.checkFavOrNot(
                                                                      EbookGroup.getFavouriteBookCall
                                                                          .favouriteBookDetailsList(
                                                                            columnGetFavouriteBookResponse.jsonBody,
                                                                          )
                                                                          ?.toList(),
                                                                      getJsonField(
                                                                        downloadDetailsListItem,
                                                                        r'''$.bookDetails._id''',
                                                                      ).toString()) ==
                                                                  true) {
                                                                return Icon(
                                                                  Icons
                                                                      .favorite_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 16.0,
                                                                );
                                                              } else {
                                                                return Icon(
                                                                  Icons
                                                                      .favorite_border_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 16.0,
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
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
