import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'subscription_page_model.dart';
export 'subscription_page_model.dart';

class SubscriptionPageWidget extends StatefulWidget {
  const SubscriptionPageWidget({super.key});

  @override
  State<SubscriptionPageWidget> createState() => _SubscriptionPageWidgetState();
}

class _SubscriptionPageWidgetState extends State<SubscriptionPageWidget>
    with TickerProviderStateMixin {
  late SubscriptionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted();
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 15.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 15.0.ms,
            duration: 600.0.ms,
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
            ..complete(EbookGroup.getsubscriptionplanApiCall.call()))
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
        final subscriptionPageGetsubscriptionplanApiResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future: EbookGroup.usersubscriptionvalidityApiCall.call(
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
                  final containerUsersubscriptionvalidityApiResponse =
                      snapshot.data!;

                  return Container(
                    decoration: const BoxDecoration(),
                    child: FutureBuilder<ApiCallResponse>(
                      future: EbookGroup.currencyApiCall.call(
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
                        final columnCurrencyApiResponse = snapshot.data!;

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.customCenterAppbarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CustomCenterAppbarWidget(
                                title: 'Subscription',
                                backIcon: false,
                                addIcon: false,
                                onTapAdd: () async {},
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  16.0,
                                  0,
                                  0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Text(
                                      'Full access to all free and premium content in different plan choose your plan on your requirement.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation']!),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (EbookGroup
                                                  .usersubscriptionvalidityApiCall
                                                  .success(
                                                containerUsersubscriptionvalidityApiResponse
                                                    .jsonBody,
                                              ) ==
                                              1) {
                                            return Builder(
                                              builder: (context) {
                                                if (EbookGroup
                                                        .usersubscriptionvalidityApiCall
                                                        .daysLeft(
                                                      containerUsersubscriptionvalidityApiResponse
                                                          .jsonBody,
                                                    )! >
                                                    0) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            16.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    '${EbookGroup.usersubscriptionvalidityApiCall.name(
                                                                      containerUsersubscriptionvalidityApiResponse
                                                                          .jsonBody,
                                                                    )} plan',
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'SF Pro Display',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              false,
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      custom_widgets
                                                                          .GetCurrencySymbool(
                                                                        width:
                                                                            15.0,
                                                                        height:
                                                                            20.0,
                                                                        isSimbool: EbookGroup
                                                                            .currencyApiCall
                                                                            .currency(
                                                                          columnCurrencyApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            17.0,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: '',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 17.0,
                                                                                  ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: valueOrDefault<String>(
                                                                                    functions.convertToTwoDigitDecimal(EbookGroup.usersubscriptionvalidityApiCall.price(
                                                                                      containerUsersubscriptionvalidityApiResponse.jsonBody,
                                                                                    )!),
                                                                                    '15',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'SF Pro Display',
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        fontSize: 17.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: '  ( ',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontSize: 17.0,
                                                                                  ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: valueOrDefault<String>(
                                                                                    EbookGroup.usersubscriptionvalidityApiCall.duration(
                                                                                      containerUsersubscriptionvalidityApiResponse.jsonBody,
                                                                                    ),
                                                                                    '1',
                                                                                  ),
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                    fontSize: 17.0,
                                                                                  ),
                                                                                ),
                                                                                const TextSpan(
                                                                                  text: ' ',
                                                                                  style: TextStyle(),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: valueOrDefault<String>(
                                                                                    EbookGroup.usersubscriptionvalidityApiCall.durationinterms(
                                                                                      containerUsersubscriptionvalidityApiResponse.jsonBody,
                                                                                    ),
                                                                                    'days',
                                                                                  ),
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                    fontSize: 17.0,
                                                                                  ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: ' )',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                    fontSize: 17.0,
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'SF Pro Display',
                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                    fontSize: 17.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                            maxLines:
                                                                                1,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  'Current plan',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'SF Pro Display',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            false,
                                                                        lineHeight:
                                                                            1.5,
                                                                      ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Expires on ${functions.expiresFormate(valueOrDefault<String>(
                                                                            EbookGroup.usersubscriptionvalidityApiCall.expirationDate(
                                                                              containerUsersubscriptionvalidityApiResponse.jsonBody,
                                                                            ),
                                                                            '12-07-2024',
                                                                          ))}',
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation']!),
                                                  );
                                                } else {
                                                  return Container(
                                                    width: 0.0,
                                                    height: 0.0,
                                                    decoration: const BoxDecoration(),
                                                  );
                                                }
                                              },
                                            );
                                          } else {
                                            return Container(
                                              decoration: const BoxDecoration(),
                                            );
                                          }
                                        },
                                      ),
                                    ].addToStart(const SizedBox(height: 24.0)),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (EbookGroup
                                              .usersubscriptionvalidityApiCall
                                              .success(
                                            containerUsersubscriptionvalidityApiResponse
                                                .jsonBody,
                                          ) ==
                                          1) {
                                        return Builder(
                                          builder: (context) {
                                            if (EbookGroup
                                                    .usersubscriptionvalidityApiCall
                                                    .daysLeft(
                                                  containerUsersubscriptionvalidityApiResponse
                                                      .jsonBody,
                                                )! >
                                                0) {
                                              return Container(
                                                decoration: const BoxDecoration(),
                                              );
                                            } else {
                                              return Builder(
                                                builder: (context) {
                                                  final subscriptionDetailsList =
                                                      EbookGroup
                                                              .getsubscriptionplanApiCall
                                                              .subscriptionDetailsList(
                                                                subscriptionPageGetsubscriptionplanApiResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.toList() ??
                                                          [];

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                            subscriptionDetailsList
                                                                .length,
                                                            (subscriptionDetailsListIndex) {
                                                      final subscriptionDetailsListItem =
                                                          subscriptionDetailsList[
                                                              subscriptionDetailsListIndex];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                    .subscriptionId =
                                                                getJsonField(
                                                              subscriptionDetailsListItem,
                                                              r'''$._id''',
                                                            ).toString();
                                                            safeSetState(() {});
                                                            _model.subscriptionName =
                                                                getJsonField(
                                                              subscriptionDetailsListItem,
                                                              r'''$.name''',
                                                            ).toString();
                                                            _model.subscriptionDuration =
                                                                getJsonField(
                                                              subscriptionDetailsListItem,
                                                              r'''$.duration''',
                                                            ).toString();
                                                            _model.subscriptionId =
                                                                getJsonField(
                                                              subscriptionDetailsListItem,
                                                              r'''$._id''',
                                                            ).toString();
                                                            _model.subscriptionDurationInTerms =
                                                                getJsonField(
                                                              subscriptionDetailsListItem,
                                                              r'''$.duration_in_terms''',
                                                            ).toString();
                                                            _model.subscriptionPrice =
                                                                getJsonField(
                                                              subscriptionDetailsListItem,
                                                              r'''$.price''',
                                                            ).toString();
                                                            _model.price =
                                                                getJsonField(
                                                              subscriptionDetailsListItem,
                                                              r'''$.price''',
                                                            ).toString();
                                                            safeSetState(() {});
                                                            _model.subsIndex =
                                                                subscriptionDetailsListIndex;
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      16.0,
                                                                  color: Color(
                                                                      0x14000014),
                                                                  offset:
                                                                      Offset(
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
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                          16.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
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
                                                                            subscriptionDetailsListItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
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
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            custom_widgets.GetCurrencySymbool(
                                                                              width: 15.0,
                                                                              height: 20.0,
                                                                              isSimbool: EbookGroup.currencyApiCall.currency(
                                                                                columnCurrencyApiResponse.jsonBody,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 17.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: '',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 17.0,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        functions.convertToTwoDigitDecimal(getJsonField(
                                                                                          subscriptionDetailsListItem,
                                                                                          r'''$.price''',
                                                                                        ).toString()),
                                                                                        '15',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'SF Pro Display',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 17.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: '  ( ',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontSize: 17.0,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: getJsonField(
                                                                                        subscriptionDetailsListItem,
                                                                                        r'''$.duration''',
                                                                                      ).toString(),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 17.0,
                                                                                      ),
                                                                                    ),
                                                                                    const TextSpan(
                                                                                      text: ' ',
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: getJsonField(
                                                                                        subscriptionDetailsListItem,
                                                                                        r'''$.duration_in_terms''',
                                                                                      ).toString(),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 17.0,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: ' )',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 17.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'SF Pro Display',
                                                                                        fontSize: 17.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                                maxLines: 1,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              height: 12.0)),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (_model.subsIndex ==
                                                                            subscriptionDetailsListIndex) {
                                                                          return ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/images/Radiofill_button.svg',
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/images/Radio_button.svg',
                                                                              width: 24.0,
                                                                              height: 24.0,
                                                                              fit: BoxFit.cover,
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
                                                        ),
                                                      );
                                                    })
                                                        .divide(const SizedBox(
                                                            height: 16.0))
                                                        .addToEnd(const SizedBox(
                                                            height: 16.0)),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'columnOnPageLoadAnimation1']!);
                                                },
                                              );
                                            }
                                          },
                                        );
                                      } else {
                                        return Builder(
                                          builder: (context) {
                                            final subscriptionDetailsList =
                                                EbookGroup
                                                        .getsubscriptionplanApiCall
                                                        .subscriptionDetailsList(
                                                          subscriptionPageGetsubscriptionplanApiResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                      subscriptionDetailsList
                                                          .length,
                                                      (subscriptionDetailsListIndex) {
                                                final subscriptionDetailsListItem =
                                                    subscriptionDetailsList[
                                                        subscriptionDetailsListIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
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
                                                      FFAppState()
                                                              .subscriptionId =
                                                          getJsonField(
                                                        subscriptionDetailsListItem,
                                                        r'''$._id''',
                                                      ).toString();
                                                      safeSetState(() {});
                                                      _model.subscriptionName =
                                                          getJsonField(
                                                        subscriptionDetailsListItem,
                                                        r'''$.name''',
                                                      ).toString();
                                                      _model.subscriptionDuration =
                                                          getJsonField(
                                                        subscriptionDetailsListItem,
                                                        r'''$.duration''',
                                                      ).toString();
                                                      _model.subscriptionId =
                                                          getJsonField(
                                                        subscriptionDetailsListItem,
                                                        r'''$._id''',
                                                      ).toString();
                                                      _model.subscriptionDurationInTerms =
                                                          getJsonField(
                                                        subscriptionDetailsListItem,
                                                        r'''$.duration_in_terms''',
                                                      ).toString();
                                                      _model.subscriptionPrice =
                                                          getJsonField(
                                                        subscriptionDetailsListItem,
                                                        r'''$.price''',
                                                      ).toString();
                                                      _model.price =
                                                          getJsonField(
                                                        subscriptionDetailsListItem,
                                                        r'''$.price''',
                                                      ).toString();
                                                      safeSetState(() {});
                                                      _model.subsIndex =
                                                          subscriptionDetailsListIndex;
                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 16.0,
                                                            color: Color(
                                                                0x14000014),
                                                            offset: Offset(
                                                              0.0,
                                                              4.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            16.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      subscriptionDetailsListItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'SF Pro Display',
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              false,
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      custom_widgets
                                                                          .GetCurrencySymbool(
                                                                        width:
                                                                            15.0,
                                                                        height:
                                                                            20.0,
                                                                        isSimbool: EbookGroup
                                                                            .currencyApiCall
                                                                            .currency(
                                                                          columnCurrencyApiResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            17.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: '',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 17.0,
                                                                                ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: valueOrDefault<String>(
                                                                                  functions.convertToTwoDigitDecimal(getJsonField(
                                                                                    subscriptionDetailsListItem,
                                                                                    r'''$.price''',
                                                                                  ).toString()),
                                                                                  '15',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'SF Pro Display',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 17.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: '  ( ',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontSize: 17.0,
                                                                                ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: getJsonField(
                                                                                  subscriptionDetailsListItem,
                                                                                  r'''$.duration''',
                                                                                ).toString(),
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 17.0,
                                                                                ),
                                                                              ),
                                                                              const TextSpan(
                                                                                text: ' ',
                                                                                style: TextStyle(),
                                                                              ),
                                                                              TextSpan(
                                                                                text: getJsonField(
                                                                                  subscriptionDetailsListItem,
                                                                                  r'''$.duration_in_terms''',
                                                                                ).toString(),
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 17.0,
                                                                                ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: ' )',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 17.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'SF Pro Display',
                                                                                  fontSize: 17.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (_model
                                                                          .subsIndex ==
                                                                      subscriptionDetailsListIndex) {
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/Radiofill_button.svg',
                                                                        width:
                                                                            24.0,
                                                                        height:
                                                                            24.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/Radio_button.svg',
                                                                        width:
                                                                            24.0,
                                                                        height:
                                                                            24.0,
                                                                        fit: BoxFit
                                                                            .cover,
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
                                                  ),
                                                );
                                              })
                                                  .divide(
                                                      const SizedBox(height: 16.0))
                                                  .addToEnd(
                                                      const SizedBox(height: 16.0)),
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation2']!);
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (EbookGroup.usersubscriptionvalidityApiCall
                                        .success(
                                      containerUsersubscriptionvalidityApiResponse
                                          .jsonBody,
                                    ) ==
                                    1) {
                                  return Builder(
                                    builder: (context) {
                                      if (EbookGroup
                                              .usersubscriptionvalidityApiCall
                                              .daysLeft(
                                            containerUsersubscriptionvalidityApiResponse
                                                .jsonBody,
                                          )! <=
                                          0) {
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 24.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                'PaymentmethodPage',
                                                queryParameters: {
                                                  'subscriptionPlanPrice':
                                                      serializeParam(
                                                    _model.subscriptionPrice,
                                                    ParamType.String,
                                                  ),
                                                  'subscriptionPlanName':
                                                      serializeParam(
                                                    valueOrDefault<String>(
                                                      _model.subscriptionName,
                                                      'Name',
                                                    ),
                                                    ParamType.String,
                                                  ),
                                                  'subscriptionPlanDuration':
                                                      serializeParam(
                                                    _model.subscriptionDuration,
                                                    ParamType.String,
                                                  ),
                                                  'subscriptionPlanDurationInTerm':
                                                      serializeParam(
                                                    _model
                                                        .subscriptionDurationInTerms,
                                                    ParamType.String,
                                                  ),
                                                  'subscriptionPlanId':
                                                      serializeParam(
                                                    _model.subscriptionId,
                                                    ParamType.String,
                                                  ),
                                                  'price': serializeParam(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .convertToTwoDigitDecimal(
                                                              _model.price!),
                                                      '0.00',
                                                    ),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            text: 'Continue',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 56.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                        );
                                      } else {
                                        return Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 24.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          'PaymentmethodPage',
                                          queryParameters: {
                                            'subscriptionPlanPrice':
                                                serializeParam(
                                              _model.subscriptionPrice,
                                              ParamType.String,
                                            ),
                                            'subscriptionPlanName':
                                                serializeParam(
                                              valueOrDefault<String>(
                                                _model.subscriptionName,
                                                'Name',
                                              ),
                                              ParamType.String,
                                            ),
                                            'subscriptionPlanDuration':
                                                serializeParam(
                                              _model.subscriptionDuration,
                                              ParamType.String,
                                            ),
                                            'subscriptionPlanDurationInTerm':
                                                serializeParam(
                                              _model
                                                  .subscriptionDurationInTerms,
                                              ParamType.String,
                                            ),
                                            'subscriptionPlanId':
                                                serializeParam(
                                              _model.subscriptionId,
                                              ParamType.String,
                                            ),
                                            'price': serializeParam(
                                              valueOrDefault<String>(
                                                functions
                                                    .convertToTwoDigitDecimal(
                                                        _model.price!),
                                                '0.00',
                                              ),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: 'Continue',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 56.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                  );
                                }
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
