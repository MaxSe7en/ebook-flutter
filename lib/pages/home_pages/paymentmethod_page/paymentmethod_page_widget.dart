import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/components/payment_success_alrt_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'paymentmethod_page_model.dart';
export 'paymentmethod_page_model.dart';

class PaymentmethodPageWidget extends StatefulWidget {
  const PaymentmethodPageWidget({
    super.key,
    required this.subscriptionPlanPrice,
    required this.subscriptionPlanName,
    required this.subscriptionPlanDuration,
    required this.subscriptionPlanDurationInTerm,
    required this.subscriptionPlanId,
    required this.price,
  });

  final String? subscriptionPlanPrice;
  final String? subscriptionPlanName;
  final String? subscriptionPlanDuration;
  final String? subscriptionPlanDurationInTerm;
  final String? subscriptionPlanId;
  final String? price;

  @override
  State<PaymentmethodPageWidget> createState() =>
      _PaymentmethodPageWidgetState();
}

class _PaymentmethodPageWidgetState extends State<PaymentmethodPageWidget>
    with TickerProviderStateMixin {
  late PaymentmethodPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentmethodPageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 120.0.ms,
            duration: 400.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 120.0.ms,
            duration: 400.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 120.0.ms,
            duration: 400.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: EbookGroup.currencyApiCall.call(),
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
                children: [
                  wrapWithModel(
                    model: _model.customCenterAppbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CustomCenterAppbarWidget(
                      title: 'Payment method',
                      backIcon: false,
                      addIcon: false,
                      onTapAdd: () async {},
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<ApiCallResponse>(
                      future: EbookGroup.paymentGatewayApiCall.call(),
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
                        final columnPaymentGatewayApiResponse = snapshot.data!;

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: ListView(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16.0,
                                    0,
                                    16.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 19.0),
                                      child: Text(
                                        'Payment method',
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
                                          0.0, 0.0, 0.0, 16.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.selectpayment = 0;
                                          safeSetState(() {});
                                          _model.planmode = 'stripe';
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 16.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .shadowColor,
                                                offset: const Offset(
                                                  0.0,
                                                  4.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/stripe_ic.png',
                                                    width: 34.0,
                                                    height: 34.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Text(
                                                      'Stripe',
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 17.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    if (_model.selectpayment ==
                                                        0) {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Radiofill_button.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    } else {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Radio_button.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation1']!),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.selectpayment = 1;
                                          safeSetState(() {});
                                          _model.planmode = 'razorpay';
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 16.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .shadowColor,
                                                offset: const Offset(
                                                  0.0,
                                                  4.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/razor_pay.png',
                                                    width: 34.0,
                                                    height: 34.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Text(
                                                      'Razorpay',
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 17.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    if (_model.selectpayment ==
                                                        1) {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Radiofill_button.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    } else {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Radio_button.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation2']!),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.selectpayment = 2;
                                          safeSetState(() {});
                                          _model.planmode = 'paypal';
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 16.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .shadowColor,
                                                offset: const Offset(
                                                  0.0,
                                                  4.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/paypal.png',
                                                    width: 34.0,
                                                    height: 34.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Text(
                                                      'Paypal',
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 17.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    if (_model.selectpayment ==
                                                        2) {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Radiofill_button.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    } else {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Radio_button.svg',
                                                          width: 24.0,
                                                          height: 24.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation3']!),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 20.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.getuserR =
                                        await EbookGroup.getuserApiCall.call(
                                      userId: FFAppState().userId,
                                      token: FFAppState().token,
                                    );

                                    if (EbookGroup.getuserApiCall.success(
                                          (_model.getuserR?.jsonBody ?? ''),
                                        ) ==
                                        1) {
                                      if (_model.selectpayment == 0) {
                                        await actions.initStripe(
                                          'pk_test_kGEVXq7ga94dcLBUZJbdQu9500lLQ5lcyQ',
                                        );
                                        await actions.stripeCustom(
                                          context,
                                          widget.price!,
                                          EbookGroup.currencyApiCall.currency(
                                            columnCurrencyApiResponse.jsonBody,
                                          )!,
                                          () async {
                                            _model.subscriptionR =
                                                await EbookGroup
                                                    .usersubscriptionApiCall
                                                    .call(
                                              userId: FFAppState().userId,
                                              subscriptionplanId:
                                                  widget.subscriptionPlanId,
                                              paymentmode: 'stripe',
                                              transactionId: FFAppState()
                                                  .paypalTransationId,
                                              paymentstatus: 'success',
                                              paymentdate: dateTimeFormat(
                                                  "dd-MM-yyyy",
                                                  getCurrentTimestamp),
                                              price: widget.price,
                                              token: FFAppState().token,
                                            );

                                            if (EbookGroup
                                                    .usersubscriptionApiCall
                                                    .success(
                                                  (_model.subscriptionR
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                1) {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus(),
                                                      child:
                                                          PaymentSuccessAlrtWidget(
                                                        onTapHome: () async {
                                                          Navigator.pop(
                                                              context);

                                                          context.goNamed(
                                                              'HomePage');
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    EbookGroup
                                                        .usersubscriptionApiCall
                                                        .message(
                                                      (_model.subscriptionR
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!,
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
                                            }
                                          },
                                          () async {
                                            context.goNamed('HomePage');
                                          },
                                          'sk_test_utRGU4wkG19w3o3dCsu4N42b00hRPKIwiJ',
                                        );
                                      } else if (_model.selectpayment == 1) {
                                        await actions.razorpayCustom(
                                          context,
                                          'rzp_test_1DP5mmOlF5G5ag',
                                          widget.price!,
                                          '${EbookGroup.getuserApiCall.firstname(
                                            (_model.getuserR?.jsonBody ?? ''),
                                          )} ${EbookGroup.getuserApiCall.lastname(
                                            (_model.getuserR?.jsonBody ?? ''),
                                          )}',
                                          'For buy premium plan',
                                          EbookGroup.getuserApiCall.phone(
                                            (_model.getuserR?.jsonBody ?? ''),
                                          )!,
                                          EbookGroup.getuserApiCall.email(
                                            (_model.getuserR?.jsonBody ?? ''),
                                          )!,
                                          () async {
                                            _model.subscriptionrazorR =
                                                await EbookGroup
                                                    .usersubscriptionApiCall
                                                    .call(
                                              userId: FFAppState().userId,
                                              subscriptionplanId:
                                                  widget.subscriptionPlanId,
                                              paymentmode: 'stripe',
                                              transactionId: FFAppState()
                                                  .paypalTransationId,
                                              paymentstatus: 'success',
                                              paymentdate: dateTimeFormat(
                                                  "dd-MM-yyyy",
                                                  getCurrentTimestamp),
                                              price: widget.price,
                                              token: FFAppState().token,
                                            );

                                            if (EbookGroup
                                                    .usersubscriptionApiCall
                                                    .success(
                                                  (_model.subscriptionrazorR
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                1) {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus(),
                                                      child:
                                                          PaymentSuccessAlrtWidget(
                                                        onTapHome: () async {
                                                          Navigator.pop(
                                                              context);

                                                          context.goNamed(
                                                              'HomePage');
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    EbookGroup
                                                        .usersubscriptionApiCall
                                                        .message(
                                                      (_model.subscriptionrazorR
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!,
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
                                            }
                                          },
                                          () async {
                                            context.goNamed('HomePage');
                                          },
                                          EbookGroup.currencyApiCall.currency(
                                            columnCurrencyApiResponse.jsonBody,
                                          )!,
                                        );
                                      } else {
                                        await actions.paypalCustom(
                                          context,
                                          'AU9rVln8yvfm2UjNMWQKpcLwtAXfpDCg-Q_VlvB36I3u9T938qw25cNkqvzKQ78gmFT2Cwx60KdteEFN',
                                          'EL7Wo0g7CYfYqbSRJxNDvIx9X2IgID5U6mXqEvkTKXXrGHbsMSZ7DpIC39KDmLnzOoHAy4fG02pthApQ',
                                          widget.price!,
                                          EbookGroup.currencyApiCall.currency(
                                            columnCurrencyApiResponse.jsonBody,
                                          )!,
                                          () async {
                                            if (FFAppState()
                                                    .paymentSuccessCheck ==
                                                true) {
                                              _model.subscriptionpayR =
                                                  await EbookGroup
                                                      .usersubscriptionApiCall
                                                      .call(
                                                userId: FFAppState().userId,
                                                subscriptionplanId:
                                                    widget.subscriptionPlanId,
                                                paymentmode: 'stripe',
                                                transactionId: FFAppState()
                                                    .paypalTransationId,
                                                paymentstatus: 'success',
                                                paymentdate: dateTimeFormat(
                                                    "dd-MM-yyyy",
                                                    getCurrentTimestamp),
                                                price: widget.price,
                                                token: FFAppState().token,
                                              );

                                              if (EbookGroup
                                                      .usersubscriptionApiCall
                                                      .success(
                                                    (_model.subscriptionpayR
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  1) {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus(),
                                                        child:
                                                            PaymentSuccessAlrtWidget(
                                                          onTapHome: () async {
                                                            Navigator.pop(
                                                                context);

                                                            context.goNamed(
                                                                'HomePage');
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      EbookGroup
                                                          .usersubscriptionApiCall
                                                          .message(
                                                        (_model.subscriptionR
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!,
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
                                              }
                                            }
                                          },
                                          () async {
                                            context.goNamed('HomePage');
                                          },
                                          () async {
                                            context.goNamed('HomePage');
                                          },
                                        );
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'Buy now',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 56.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          color: Colors.white,
                                          fontSize: 16.0,
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
                              ),
                            ),
                          ],
                        );
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
