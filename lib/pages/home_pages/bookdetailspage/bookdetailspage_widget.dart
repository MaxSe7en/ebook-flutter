import '/backend/api_requests/api_calls.dart';
import '/components/loading_con_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'bookdetailspage_model.dart';
export 'bookdetailspage_model.dart';

class BookdetailspageWidget extends StatefulWidget {
  const BookdetailspageWidget({
    super.key,
    required this.name,
    required this.image,
    required this.id,
  });

  final String? name;
  final String? image;
  final String? id;

  @override
  State<BookdetailspageWidget> createState() => _BookdetailspageWidgetState();
}

class _BookdetailspageWidgetState extends State<BookdetailspageWidget> {
  late BookdetailspageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookdetailspageModel());

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
      future: EbookGroup.getbookdetailsApiCall.call(
        bookId: widget.id,
      ),
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
        final bookdetailspageGetbookdetailsApiResponse = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: FutureBuilder<ApiCallResponse>(
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
                  Expanded(
                    child: FutureBuilder<ApiCallResponse>(
                      future: (_model.apiRequestCompleter1 ??=
                              Completer<ApiCallResponse>()
                                ..complete(EbookGroup.getreviewApiCall.call(
                                  bookId: widget.id,
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final listViewGetreviewApiResponse = snapshot.data!;

                        return RefreshIndicator(
                          color: FlutterFlowTheme.of(context).primary,
                          onRefresh: () async {
                            safeSetState(
                                () => _model.apiRequestCompleter1 = null);
                            await _model.waitForApiRequestCompleted1();
                          },
                          child: ListView(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              16.0,
                            ),
                            scrollDirection: Axis.vertical,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 480.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 119.0, 16.0, 24.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(milliseconds: 200),
                                              fadeOutDuration:
                                                  const Duration(milliseconds: 200),
                                              imageUrl: widget.image!,
                                              width: 181.0,
                                              height: 258.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              widget.name,
                                              'Book',
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
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
                                            'By ${EbookGroup.getbookdetailsApiCall.authorName(
                                              bookdetailspageGetbookdetailsApiResponse
                                                  .jsonBody,
                                            )}',
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SafeArea(
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.safePop();
                                              },
                                              child: Container(
                                                width: 44.0,
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/arrow_left.svg',
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
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
                                                      if (FFAppState()
                                                              .isLogin ==
                                                          true) {
                                                        if (EbookGroup
                                                                .getbookdetailsApiCall
                                                                .accesstype(
                                                              bookdetailspageGetbookdetailsApiResponse
                                                                  .jsonBody,
                                                            ) ==
                                                            'free') {
                                                          _model.downloadApiFunction =
                                                              await EbookGroup
                                                                  .downloadpdfApiCall
                                                                  .call(
                                                            userId: FFAppState()
                                                                .userId,
                                                            bookId: widget.id,
                                                            token: FFAppState()
                                                                .token,
                                                          );

                                                          if (EbookGroup
                                                                  .downloadpdfApiCall
                                                                  .success(
                                                                (_model.downloadApiFunction
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) ==
                                                              1) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  EbookGroup
                                                                      .downloadpdfApiCall
                                                                      .message(
                                                                    (_model.downloadApiFunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!,
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .pdfPathSave =
                                                                EbookGroup
                                                                    .getbookdetailsApiCall
                                                                    .pdf(
                                                              bookdetailspageGetbookdetailsApiResponse
                                                                  .jsonBody,
                                                            )!;
                                                            FFAppState()
                                                                .update(() {});
                                                            await actions
                                                                .downloadFile(
                                                              '${FFAppConstants.bookImagesUrl}${EbookGroup.getbookdetailsApiCall.pdf(
                                                                bookdetailspageGetbookdetailsApiResponse
                                                                    .jsonBody,
                                                              )}',
                                                              EbookGroup
                                                                  .getbookdetailsApiCall
                                                                  .pdf(
                                                                bookdetailspageGetbookdetailsApiResponse
                                                                    .jsonBody,
                                                              )!,
                                                            );
                                                            safeSetState(() =>
                                                                _model.apiRequestCompleter2 =
                                                                    null);
                                                            await _model
                                                                .waitForApiRequestCompleted2();
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  EbookGroup
                                                                      .downloadpdfApiCall
                                                                      .message(
                                                                    (_model.downloadApiFunction
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!,
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }
                                                        } else {
                                                          FFAppState()
                                                                  .pdfPathSave =
                                                              EbookGroup
                                                                  .getbookdetailsApiCall
                                                                  .pdf(
                                                            bookdetailspageGetbookdetailsApiResponse
                                                                .jsonBody,
                                                          )!;
                                                          FFAppState()
                                                              .update(() {});
                                                          _model.userdownloadvalidity =
                                                              await EbookGroup
                                                                  .usersubscriptionvalidityApiCall
                                                                  .call(
                                                            userId: FFAppState()
                                                                .userId,
                                                            token: FFAppState()
                                                                .token,
                                                          );

                                                          if (EbookGroup
                                                                  .usersubscriptionvalidityApiCall
                                                                  .daysLeft(
                                                                (_model.userdownloadvalidity
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) ==
                                                              null) {
                                                            context.pushNamed(
                                                                'SubscriptionPage');

                                                            safeSetState(() =>
                                                                _model.apiRequestCompleter2 =
                                                                    null);
                                                            await _model
                                                                .waitForApiRequestCompleted2();
                                                          } else {
                                                            if (EbookGroup
                                                                    .usersubscriptionvalidityApiCall
                                                                    .daysLeft(
                                                                  (_model.userdownloadvalidity
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )! >
                                                                0) {
                                                              _model.downloadApiFunctionPaid =
                                                                  await EbookGroup
                                                                      .downloadpdfApiCall
                                                                      .call(
                                                                userId:
                                                                    FFAppState()
                                                                        .userId,
                                                                bookId:
                                                                    widget.id,
                                                                token:
                                                                    FFAppState()
                                                                        .token,
                                                              );

                                                              if (EbookGroup
                                                                      .downloadpdfApiCall
                                                                      .success(
                                                                    (_model.downloadApiFunctionPaid
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) ==
                                                                  1) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      EbookGroup
                                                                          .downloadpdfApiCall
                                                                          .message(
                                                                        (_model.downloadApiFunctionPaid?.jsonBody ??
                                                                            ''),
                                                                      )!,
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                                FFAppState()
                                                                        .pdfPathSave =
                                                                    EbookGroup
                                                                        .getbookdetailsApiCall
                                                                        .pdf(
                                                                  bookdetailspageGetbookdetailsApiResponse
                                                                      .jsonBody,
                                                                )!;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                await actions
                                                                    .downloadFile(
                                                                  '${FFAppConstants.bookImagesUrl}${EbookGroup.getbookdetailsApiCall.pdf(
                                                                    bookdetailspageGetbookdetailsApiResponse
                                                                        .jsonBody,
                                                                  )}',
                                                                  EbookGroup
                                                                      .getbookdetailsApiCall
                                                                      .pdf(
                                                                    bookdetailspageGetbookdetailsApiResponse
                                                                        .jsonBody,
                                                                  )!,
                                                                );
                                                                safeSetState(() =>
                                                                    _model.apiRequestCompleter2 =
                                                                        null);
                                                                await _model
                                                                    .waitForApiRequestCompleted2();
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      EbookGroup
                                                                          .downloadpdfApiCall
                                                                          .message(
                                                                        (_model.downloadApiFunctionPaid?.jsonBody ??
                                                                            ''),
                                                                      )!,
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }
                                                            } else {
                                                              context.pushNamed(
                                                                  'SubscriptionPage');

                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter2 =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted2();
                                                            }
                                                          }
                                                        }
                                                      } else {
                                                        context.pushNamed(
                                                            'SignInPage');
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    onDoubleTap: () async {
                                                      if (FFAppState()
                                                              .isLogin ==
                                                          true) {
                                                        if (EbookGroup
                                                                .getbookdetailsApiCall
                                                                .accesstype(
                                                              bookdetailspageGetbookdetailsApiResponse
                                                                  .jsonBody,
                                                            ) ==
                                                            'free') {
                                                          _model.downloadApiFunctionCopy =
                                                              await EbookGroup
                                                                  .downloadpdfApiCall
                                                                  .call(
                                                            userId: FFAppState()
                                                                .userId,
                                                            bookId: widget.id,
                                                            token: FFAppState()
                                                                .token,
                                                          );

                                                          if (EbookGroup
                                                                  .downloadpdfApiCall
                                                                  .success(
                                                                (_model.downloadApiFunctionCopy
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) ==
                                                              1) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  EbookGroup
                                                                      .downloadpdfApiCall
                                                                      .message(
                                                                    (_model.downloadApiFunctionCopy
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!,
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .pdfPathSave =
                                                                EbookGroup
                                                                    .getbookdetailsApiCall
                                                                    .pdf(
                                                              bookdetailspageGetbookdetailsApiResponse
                                                                  .jsonBody,
                                                            )!;
                                                            FFAppState()
                                                                .update(() {});
                                                            await actions
                                                                .downloadFile(
                                                              '${FFAppConstants.bookImagesUrl}${EbookGroup.getbookdetailsApiCall.pdf(
                                                                bookdetailspageGetbookdetailsApiResponse
                                                                    .jsonBody,
                                                              )}',
                                                              EbookGroup
                                                                  .getbookdetailsApiCall
                                                                  .pdf(
                                                                bookdetailspageGetbookdetailsApiResponse
                                                                    .jsonBody,
                                                              )!,
                                                            );
                                                            safeSetState(() =>
                                                                _model.apiRequestCompleter2 =
                                                                    null);
                                                            await _model
                                                                .waitForApiRequestCompleted2();
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  EbookGroup
                                                                      .downloadpdfApiCall
                                                                      .message(
                                                                    (_model.downloadApiFunctionCopy
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!,
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }
                                                        } else {
                                                          FFAppState()
                                                                  .pdfPathSave =
                                                              EbookGroup
                                                                  .getbookdetailsApiCall
                                                                  .pdf(
                                                            bookdetailspageGetbookdetailsApiResponse
                                                                .jsonBody,
                                                          )!;
                                                          FFAppState()
                                                              .update(() {});
                                                          _model.userdownloadvalidityCopy =
                                                              await EbookGroup
                                                                  .usersubscriptionvalidityApiCall
                                                                  .call(
                                                            userId: FFAppState()
                                                                .userId,
                                                            token: FFAppState()
                                                                .token,
                                                          );

                                                          if (EbookGroup
                                                                  .usersubscriptionvalidityApiCall
                                                                  .daysLeft(
                                                                (_model.userdownloadvalidityCopy
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) ==
                                                              null) {
                                                            context.pushNamed(
                                                                'SubscriptionPage');

                                                            safeSetState(() =>
                                                                _model.apiRequestCompleter2 =
                                                                    null);
                                                            await _model
                                                                .waitForApiRequestCompleted2();
                                                          } else {
                                                            if (EbookGroup
                                                                    .usersubscriptionvalidityApiCall
                                                                    .daysLeft(
                                                                  (_model.userdownloadvalidityCopy
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )! >
                                                                0) {
                                                              _model.downloadApiFunctionPaidCopy =
                                                                  await EbookGroup
                                                                      .downloadpdfApiCall
                                                                      .call(
                                                                userId:
                                                                    FFAppState()
                                                                        .userId,
                                                                bookId:
                                                                    widget.id,
                                                                token:
                                                                    FFAppState()
                                                                        .token,
                                                              );

                                                              if (EbookGroup
                                                                      .downloadpdfApiCall
                                                                      .success(
                                                                    (_model.downloadApiFunctionPaidCopy
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) ==
                                                                  1) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      EbookGroup
                                                                          .downloadpdfApiCall
                                                                          .message(
                                                                        (_model.downloadApiFunctionPaidCopy?.jsonBody ??
                                                                            ''),
                                                                      )!,
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                                FFAppState()
                                                                        .pdfPathSave =
                                                                    EbookGroup
                                                                        .getbookdetailsApiCall
                                                                        .pdf(
                                                                  bookdetailspageGetbookdetailsApiResponse
                                                                      .jsonBody,
                                                                )!;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                await actions
                                                                    .downloadFile(
                                                                  '${FFAppConstants.bookImagesUrl}${EbookGroup.getbookdetailsApiCall.pdf(
                                                                    bookdetailspageGetbookdetailsApiResponse
                                                                        .jsonBody,
                                                                  )}',
                                                                  EbookGroup
                                                                      .getbookdetailsApiCall
                                                                      .pdf(
                                                                    bookdetailspageGetbookdetailsApiResponse
                                                                        .jsonBody,
                                                                  )!,
                                                                );
                                                                safeSetState(() =>
                                                                    _model.apiRequestCompleter2 =
                                                                        null);
                                                                await _model
                                                                    .waitForApiRequestCompleted2();
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      EbookGroup
                                                                          .downloadpdfApiCall
                                                                          .message(
                                                                        (_model.downloadApiFunctionPaidCopy?.jsonBody ??
                                                                            ''),
                                                                      )!,
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }
                                                            } else {
                                                              context.pushNamed(
                                                                  'SubscriptionPage');

                                                              safeSetState(() =>
                                                                  _model.apiRequestCompleter2 =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted2();
                                                            }
                                                          }
                                                        }
                                                      } else {
                                                        context.pushNamed(
                                                            'SignInPage');
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    onLongPress: () async {},
                                                    child: Container(
                                                      width: 44.0,
                                                      height: 44.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/download.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (FFAppState().isLogin ==
                                                        true) {
                                                      if (functions
                                                              .checkFavOrNot(
                                                                  EbookGroup
                                                                      .getFavouriteBookCall
                                                                      .favouriteBookDetailsList(
                                                                        columnGetFavouriteBookResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList(),
                                                                  EbookGroup
                                                                      .getbookdetailsApiCall
                                                                      .id(
                                                                    bookdetailspageGetbookdetailsApiResponse
                                                                        .jsonBody,
                                                                  )) ==
                                                          true) {
                                                        _model.getDetailBookDetete =
                                                            await EbookGroup
                                                                .removeFavouritebookCall
                                                                .call(
                                                          userId: FFAppState()
                                                              .userId,
                                                          token: FFAppState()
                                                              .token,
                                                          bookId: EbookGroup
                                                              .getbookdetailsApiCall
                                                              .id(
                                                            bookdetailspageGetbookdetailsApiResponse
                                                                .jsonBody,
                                                          ),
                                                        );
                                                      } else {
                                                        _model.getDetailBookAdd =
                                                            await EbookGroup
                                                                .addFavouriteBookApiCall
                                                                .call(
                                                          userId: FFAppState()
                                                              .userId,
                                                          token: FFAppState()
                                                              .token,
                                                          bookId: EbookGroup
                                                              .getbookdetailsApiCall
                                                              .id(
                                                            bookdetailspageGetbookdetailsApiResponse
                                                                .jsonBody,
                                                          ),
                                                        );
                                                      }

                                                      FFAppState()
                                                          .clearGetFavouriteBookCacheCache();
                                                    } else {
                                                      FFAppState().favChange =
                                                          true;
                                                      FFAppState().bookId =
                                                          EbookGroup
                                                              .getbookdetailsApiCall
                                                              .id(
                                                        bookdetailspageGetbookdetailsApiResponse
                                                            .jsonBody,
                                                      )!;
                                                      FFAppState()
                                                          .update(() {});

                                                      context.pushNamed(
                                                          'SignInPage');
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    width: 44.0,
                                                    height: 44.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (functions
                                                                .checkFavOrNot(
                                                                    EbookGroup
                                                                        .getFavouriteBookCall
                                                                        .favouriteBookDetailsList(
                                                                          columnGetFavouriteBookResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList(),
                                                                    EbookGroup
                                                                        .getbookdetailsApiCall
                                                                        .id(
                                                                      bookdetailspageGetbookdetailsApiResponse
                                                                          .jsonBody,
                                                                    )) ==
                                                            true) {
                                                          return Icon(
                                                            Icons
                                                                .favorite_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          );
                                                        } else {
                                                          return Icon(
                                                            Icons
                                                                .favorite_border_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 8.0),
                                child: Text(
                                  'About the book',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: custom_widgets.ReadMoreHtml(
                                    width: double.infinity,
                                    height: 80.0,
                                    htmlContent: EbookGroup
                                        .getbookdetailsApiCall
                                        .description(
                                      bookdetailspageGetbookdetailsApiResponse
                                          .jsonBody,
                                    ),
                                    maxLength: 4,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 0.0, 16.0),
                                child: Text(
                                  'Information',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 16.0,
                                        color: FlutterFlowTheme.of(context)
                                            .shadowColor,
                                        offset: const Offset(
                                          0.0,
                                          4.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 19.0, 15.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Language',
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  EbookGroup
                                                      .getbookdetailsApiCall
                                                      .language(
                                                    bookdetailspageGetbookdetailsApiResponse
                                                        .jsonBody,
                                                  ),
                                                  'Language',
                                                ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(height: 8.0)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Rating',
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/star.png',
                                                      width: 21.0,
                                                      height: 21.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        EbookGroup
                                                            .getbookdetailsApiCall
                                                            .averageRating(
                                                              bookdetailspageGetbookdetailsApiResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toString(),
                                                        '5',
                                                      ),
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 17.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(const SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 16.0),
                                child: Text(
                                  'About author',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'AboutauthorPage',
                                      queryParameters: {
                                        'name': serializeParam(
                                          valueOrDefault<String>(
                                            EbookGroup.getbookdetailsApiCall
                                                .authorName(
                                              bookdetailspageGetbookdetailsApiResponse
                                                  .jsonBody,
                                            ),
                                            'Name',
                                          ),
                                          ParamType.String,
                                        ),
                                        'authorImage': serializeParam(
                                          '${FFAppConstants.imageUrl}${EbookGroup.getbookdetailsApiCall.authorimage(
                                            bookdetailspageGetbookdetailsApiResponse
                                                .jsonBody,
                                          )}',
                                          ParamType.String,
                                        ),
                                        'authorId': serializeParam(
                                          EbookGroup.getbookdetailsApiCall
                                              .authorid(
                                            bookdetailspageGetbookdetailsApiResponse
                                                .jsonBody,
                                          ),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 16.0,
                                          color: FlutterFlowTheme.of(context)
                                              .shadowColor,
                                          offset: const Offset(
                                            0.0,
                                            4.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 58.0,
                                            height: 58.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(milliseconds: 200),
                                              fadeOutDuration:
                                                  const Duration(milliseconds: 200),
                                              imageUrl:
                                                  '${FFAppConstants.imageUrl}${EbookGroup.getbookdetailsApiCall.authorimage(
                                                bookdetailspageGetbookdetailsApiResponse
                                                    .jsonBody,
                                              )}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  EbookGroup
                                                      .getbookdetailsApiCall
                                                      .authorName(
                                                    bookdetailspageGetbookdetailsApiResponse
                                                        .jsonBody,
                                                  ),
                                                  'Name',
                                                ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/info.svg',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (EbookGroup.getreviewApiCall.success(
                                    listViewGetreviewApiResponse.jsonBody,
                                  ) ==
                                  1)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Recent reviews',
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.5,
                                                      ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'RecentreviewsPage',
                                                  queryParameters: {
                                                    'reviewId': serializeParam(
                                                      widget.id,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Text(
                                                'View all',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final reviewList =
                                              (EbookGroup.getreviewApiCall
                                                          .reviewsList(
                                                            listViewGetreviewApiResponse
                                                                .jsonBody,
                                                          )
                                                          ?.toList() ??
                                                      [])
                                                  .take(2)
                                                  .toList();

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                      reviewList.length,
                                                      (reviewListIndex) {
                                                final reviewListItem =
                                                    reviewList[reviewListIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: 320.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
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
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width: 48.0,
                                                                  height: 48.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
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
                                                                        '${FFAppConstants.imageUrl}${getJsonField(
                                                                      reviewListItem,
                                                                      r'''$.userDetails.image''',
                                                                    ).toString()}',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorWidget: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.png',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          getJsonField(
                                                                            reviewListItem,
                                                                            r'''$.userDetails.name''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'SF Pro Display',
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                                lineHeight: 1.5,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            reviewListItem,
                                                                            r'''$.date''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'SF Pro Display',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: false,
                                                                                lineHeight: 1.5,
                                                                              ),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              height: 4.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/star.png',
                                                                          width:
                                                                              16.0,
                                                                          height:
                                                                              16.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                        reviewListItem,
                                                                        r'''$.rating''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                false,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              reviewListItem,
                                                              r'''$.description''',
                                                            ).toString(),
                                                            maxLines: 3,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              })
                                                  .divide(const SizedBox(width: 16.0))
                                                  .addToStart(
                                                      const SizedBox(width: 16.0))
                                                  .addToEnd(
                                                      const SizedBox(width: 16.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: FFAppState().getBookbyCategoryCache(
                                    uniqueQueryKey: valueOrDefault<String>(
                                      widget.id,
                                      'id',
                                    ),
                                    requestFn: () => EbookGroup
                                        .getbookbycategoryApiCall
                                        .call(
                                      categoryId: EbookGroup
                                          .getbookdetailsApiCall
                                          .categoryId(
                                        bookdetailspageGetbookdetailsApiResponse
                                            .jsonBody,
                                      ),
                                    ),
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
                                    final columnGetbookbycategoryApiResponse =
                                        snapshot.data!;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (EbookGroup.getbookbycategoryApiCall
                                                .success(
                                              columnGetbookbycategoryApiResponse
                                                  .jsonBody,
                                            ) ==
                                            1)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 16.0),
                                            child: Text(
                                              'Related books',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.5,
                                                      ),
                                            ),
                                          ),
                                        if (EbookGroup.getbookbycategoryApiCall
                                                .success(
                                              columnGetbookbycategoryApiResponse
                                                  .jsonBody,
                                            ) ==
                                            1)
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final authorRelatedbookDetailslist =
                                                      EbookGroup
                                                              .getbookbycategoryApiCall
                                                              .bookDetailsList(
                                                                columnGetbookbycategoryApiResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.toList() ??
                                                          [];

                                                  return GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 16.0,
                                                      mainAxisSpacing: 16.0,
                                                      childAspectRatio: 0.7,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        authorRelatedbookDetailslist
                                                            .length,
                                                    itemBuilder: (context,
                                                        authorRelatedbookDetailslistIndex) {
                                                      final authorRelatedbookDetailslistItem =
                                                          authorRelatedbookDetailslist[
                                                              authorRelatedbookDetailslistIndex];
                                                      return InkWell(
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
                                                              'name':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  authorRelatedbookDetailslistItem,
                                                                  r'''$.name''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'image':
                                                                  serializeParam(
                                                                '${FFAppConstants.bookImagesUrl}${getJsonField(
                                                                  authorRelatedbookDetailslistItem,
                                                                  r'''$.image''',
                                                                ).toString()}',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'id':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  authorRelatedbookDetailslistItem,
                                                                  r'''$._id''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 231.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
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
                                                                            BorderRadius.circular(0.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              const Duration(milliseconds: 200),
                                                                          fadeOutDuration:
                                                                              const Duration(milliseconds: 200),
                                                                          imageUrl:
                                                                              '${FFAppConstants.bookImagesUrl}${getJsonField(
                                                                            authorRelatedbookDetailslistItem,
                                                                            r'''$.image''',
                                                                          ).toString()}',
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              148.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        getJsonField(
                                                                          authorRelatedbookDetailslistItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            1,
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
                                                                      Text(
                                                                        getJsonField(
                                                                          authorRelatedbookDetailslistItem,
                                                                          r'''$.author.name''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                              lineHeight: 1.5,
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
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (FFAppState()
                                                                            .isLogin ==
                                                                        true) {
                                                                      if (functions.checkFavOrNot(
                                                                              EbookGroup.getFavouriteBookCall
                                                                                  .favouriteBookDetailsList(
                                                                                    columnGetFavouriteBookResponse.jsonBody,
                                                                                  )
                                                                                  ?.toList(),
                                                                              getJsonField(
                                                                                authorRelatedbookDetailslistItem,
                                                                                r'''$._id''',
                                                                              ).toString()) ==
                                                                          true) {
                                                                        _model.getRelatedCategoryDetete = await EbookGroup
                                                                            .removeFavouritebookCall
                                                                            .call(
                                                                          userId:
                                                                              FFAppState().userId,
                                                                          token:
                                                                              FFAppState().token,
                                                                          bookId:
                                                                              getJsonField(
                                                                            authorRelatedbookDetailslistItem,
                                                                            r'''$._id''',
                                                                          ).toString(),
                                                                        );
                                                                      } else {
                                                                        _model.getRelatedCategoryAdd = await EbookGroup
                                                                            .addFavouriteBookApiCall
                                                                            .call(
                                                                          userId:
                                                                              FFAppState().userId,
                                                                          token:
                                                                              FFAppState().token,
                                                                          bookId:
                                                                              getJsonField(
                                                                            authorRelatedbookDetailslistItem,
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
                                                                        authorRelatedbookDetailslistItem,
                                                                        r'''$._id''',
                                                                      ).toString();
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});

                                                                      context.pushNamed(
                                                                          'SignInPage');
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 28.0,
                                                                    height:
                                                                        28.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              16.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).shadowColor,
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
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (functions.checkFavOrNot(
                                                                                EbookGroup.getFavouriteBookCall
                                                                                    .favouriteBookDetailsList(
                                                                                      columnGetFavouriteBookResponse.jsonBody,
                                                                                    )
                                                                                    ?.toList(),
                                                                                getJsonField(
                                                                                  authorRelatedbookDetailslistItem,
                                                                                  r'''$._id''',
                                                                                ).toString()) ==
                                                                            true) {
                                                                          return Icon(
                                                                            Icons.favorite_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                16.0,
                                                                          );
                                                                        } else {
                                                                          return Icon(
                                                                            Icons.favorite_border_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
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
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  FutureBuilder<ApiCallResponse>(
                    future: EbookGroup.usersubscriptionvalidityApiCall.call(
                      userId: FFAppState().userId,
                      token: FFAppState().token,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return const LoadingConWidget();
                      }
                      final containerUsersubscriptionvalidityApiResponse =
                          snapshot.data!;

                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16.0,
                              color: FlutterFlowTheme.of(context).shadowColor,
                              offset: const Offset(
                                0.0,
                                4.0,
                              ),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: (_model.apiRequestCompleter2 ??= Completer<
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
                                return const LoadingConWidget();
                              }
                              final rowDownloadhistoryApiResponse =
                                  snapshot.data!;

                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      EbookGroup.getbookdetailsApiCall
                                                  .accesstype(
                                                bookdetailspageGetbookdetailsApiResponse
                                                    .jsonBody,
                                              ) ==
                                              'free'
                                          ? 'Free'
                                          : 'Paid',
                                      maxLines: 1,
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
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (EbookGroup.getbookdetailsApiCall
                                                  .accesstype(
                                                bookdetailspageGetbookdetailsApiResponse
                                                    .jsonBody,
                                              ) ==
                                              'free') {
                                            context.pushNamed(
                                              'ReadBookCustomPage',
                                              queryParameters: {
                                                'pdf': serializeParam(
                                                  '${FFAppConstants.bookImagesUrl}${EbookGroup.getbookdetailsApiCall.pdf(
                                                    bookdetailspageGetbookdetailsApiResponse
                                                        .jsonBody,
                                                  )}',
                                                  ParamType.String,
                                                ),
                                                'id': serializeParam(
                                                  widget.id,
                                                  ParamType.String,
                                                ),
                                                'name': serializeParam(
                                                  widget.name,
                                                  ParamType.String,
                                                ),
                                                'image': serializeParam(
                                                  widget.image,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );

                                            if (widget.id ==
                                                FFAppState().homePageBookId) {
                                              FFAppState().totalPages = 1;
                                              FFAppState().update(() {});
                                            } else {
                                              FFAppState().totalPages = 1;
                                              FFAppState()
                                                  .homePageCurrentPdfIndex = 1;
                                              FFAppState().update(() {});
                                            }
                                          } else {
                                            if (FFAppState().isLogin == true) {
                                              _model.uservalidity = await EbookGroup
                                                  .usersubscriptionvalidityApiCall
                                                  .call(
                                                userId: FFAppState().userId,
                                                token: FFAppState().token,
                                              );

                                              if (EbookGroup
                                                      .usersubscriptionvalidityApiCall
                                                      .daysLeft(
                                                    (_model.uservalidity
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  null) {
                                                context.pushNamed(
                                                    'SubscriptionPage');

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'dayleft is not set',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              } else {
                                                if (EbookGroup
                                                        .usersubscriptionvalidityApiCall
                                                        .daysLeft(
                                                      (_model.uservalidity
                                                              ?.jsonBody ??
                                                          ''),
                                                    )! >
                                                    0) {
                                                  context.pushNamed(
                                                    'ReadBookCustomPage',
                                                    queryParameters: {
                                                      'pdf': serializeParam(
                                                        '${FFAppConstants.bookImagesUrl}${EbookGroup.getbookdetailsApiCall.pdf(
                                                          bookdetailspageGetbookdetailsApiResponse
                                                              .jsonBody,
                                                        )}',
                                                        ParamType.String,
                                                      ),
                                                      'id': serializeParam(
                                                        widget.id,
                                                        ParamType.String,
                                                      ),
                                                      'name': serializeParam(
                                                        widget.name,
                                                        ParamType.String,
                                                      ),
                                                      'image': serializeParam(
                                                        widget.image,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  if (widget.id ==
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
                                                } else {
                                                  context.pushNamed(
                                                      'SubscriptionPage');
                                                }
                                              }
                                            } else {
                                              context.pushNamed('SignInPage');
                                            }
                                          }

                                          safeSetState(() {});
                                        },
                                        text: valueOrDefault<String>(
                                          () {
                                            if (valueOrDefault<String>(
                                                  EbookGroup
                                                      .getbookdetailsApiCall
                                                      .accesstype(
                                                    bookdetailspageGetbookdetailsApiResponse
                                                        .jsonBody,
                                                  ),
                                                  'free',
                                                ) ==
                                                'free') {
                                              return 'Read book';
                                            } else if (EbookGroup
                                                    .usersubscriptionvalidityApiCall
                                                    .daysLeft(
                                                  containerUsersubscriptionvalidityApiResponse
                                                      .jsonBody,
                                                ) ==
                                                null) {
                                              return 'Buy subscription';
                                            } else {
                                              return (EbookGroup
                                                          .usersubscriptionvalidityApiCall
                                                          .daysLeft(
                                                        containerUsersubscriptionvalidityApiResponse
                                                            .jsonBody,
                                                      )! >
                                                      0
                                                  ? 'Read book'
                                                  : 'Buy subscription');
                                            }
                                          }(),
                                          'Buy subscription',
                                        ),
                                        options: FFButtonOptions(
                                          width: 206.0,
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
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
