import 'dart:async';

import 'serialization_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'SplashPage': ParameterData.none(),
  'OnboardingPage': ParameterData.none(),
  'SignInPage': ParameterData.none(),
  'SignUpPage': ParameterData.none(),
  'CategoriesScreen': ParameterData.none(),
  'SubCategoriesScreen': (data) async => ParameterData(
        allParams: {
          'id': getParameter<String>(data, 'id'),
          'name': getParameter<String>(data, 'name'),
        },
      ),
  'HistoryDetailsPage': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'id': getParameter<String>(data, 'id'),
        },
      ),
  'TrendingbooksPage': ParameterData.none(),
  'FilterPage': ParameterData.none(),
  'BestauthorPage': ParameterData.none(),
  'PopularbooksPage': ParameterData.none(),
  'RecentreviewsPage': (data) async => ParameterData(
        allParams: {
          'reviewId': getParameter<String>(data, 'reviewId'),
        },
      ),
  'AboutauthorPage': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'authorImage': getParameter<String>(data, 'authorImage'),
          'authorId': getParameter<String>(data, 'authorId'),
        },
      ),
  'ReadBookPage': (data) async => ParameterData(
        allParams: {
          'pdf': getParameter<String>(data, 'pdf'),
          'id': getParameter<String>(data, 'id'),
          'name': getParameter<String>(data, 'name'),
        },
      ),
  'SearchPage': ParameterData.none(),
  'NotificationsPage': ParameterData.none(),
  'LatestPage': ParameterData.none(),
  'FavoritesPage': ParameterData.none(),
  'ProfilePage': ParameterData.none(),
  'MyprofilePage': ParameterData.none(),
  'EditprofilePage': ParameterData.none(),
  'DownloadPage': ParameterData.none(),
  'SettingsPage': ParameterData.none(),
  'ChangepasswordPage': ParameterData.none(),
  'PrivacypolicyPage': ParameterData.none(),
  'TermsconditionsPage': ParameterData.none(),
  'AboutusPage': ParameterData.none(),
  'Bookdetailspage': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'image': getParameter<String>(data, 'image'),
          'id': getParameter<String>(data, 'id'),
        },
      ),
  'ForgotpasswordPage': ParameterData.none(),
  'VerificationPage': (data) async => ParameterData(
        allParams: {
          'firstname': getParameter<String>(data, 'firstname'),
          'lastname': getParameter<String>(data, 'lastname'),
          'username': getParameter<String>(data, 'username'),
          'email': getParameter<String>(data, 'email'),
          'password': getParameter<String>(data, 'password'),
          'phone': getParameter<String>(data, 'phone'),
        },
      ),
  'ResetpasswordPage': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'NavbarHomePage': ParameterData.none(),
  'NavbarCategoriesPage': ParameterData.none(),
  'NavbarLatestPage': ParameterData.none(),
  'NavbarAuthorPage': ParameterData.none(),
  'NavbarProfilePage': ParameterData.none(),
  'ForgotVerificationPage': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'DeleteAccountInstructionPage': ParameterData.none(),
  'GetBookByCategoryPage': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'id': getParameter<String>(data, 'id'),
        },
      ),
  'SubscriptionPage': ParameterData.none(),
  'ReadBookCustomPage': (data) async => ParameterData(
        allParams: {
          'pdf': getParameter<String>(data, 'pdf'),
          'id': getParameter<String>(data, 'id'),
          'name': getParameter<String>(data, 'name'),
          'image': getParameter<String>(data, 'image'),
        },
      ),
  'filter_result_page': ParameterData.none(),
  'ReviewsummaryPage': (data) async => ParameterData(
        allParams: {
          'paymentName': getParameter<String>(data, 'paymentName'),
          'subscriptionPlanId':
              getParameter<String>(data, 'subscriptionPlanId'),
          'subscriptionPlanName':
              getParameter<String>(data, 'subscriptionPlanName'),
          'subscriptionPlanDuration':
              getParameter<String>(data, 'subscriptionPlanDuration'),
          'subscriptionPlanDurationInTerms':
              getParameter<String>(data, 'subscriptionPlanDurationInTerms'),
          'subscriptionPlanPrice':
              getParameter<String>(data, 'subscriptionPlanPrice'),
        },
      ),
  'PaymentmethodPage': (data) async => ParameterData(
        allParams: {
          'subscriptionPlanPrice':
              getParameter<String>(data, 'subscriptionPlanPrice'),
          'subscriptionPlanName':
              getParameter<String>(data, 'subscriptionPlanName'),
          'subscriptionPlanDuration':
              getParameter<String>(data, 'subscriptionPlanDuration'),
          'subscriptionPlanDurationInTerm':
              getParameter<String>(data, 'subscriptionPlanDurationInTerm'),
          'subscriptionPlanId':
              getParameter<String>(data, 'subscriptionPlanId'),
          'price': getParameter<String>(data, 'price'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
