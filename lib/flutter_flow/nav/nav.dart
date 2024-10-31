import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const SplashPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const SplashPageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomePage')
              : const HomePageWidget(),
        ),
        FFRoute(
          name: 'SplashPage',
          path: '/splashPage',
          builder: (context, params) => const SplashPageWidget(),
        ),
        FFRoute(
          name: 'OnboardingPage',
          path: '/onboardingPage',
          builder: (context, params) => const OnboardingPageWidget(),
        ),
        FFRoute(
          name: 'SignInPage',
          path: '/signInPage',
          builder: (context, params) => const SignInPageWidget(),
        ),
        FFRoute(
          name: 'SignUpPage',
          path: '/signUpPage',
          builder: (context, params) => const SignUpPageWidget(),
        ),
        FFRoute(
          name: 'CategoriesScreen',
          path: '/categoriesScreen',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'CategoriesScreen')
              : const CategoriesScreenWidget(),
        ),
        FFRoute(
          name: 'SubCategoriesScreen',
          path: '/subCategoriesScreen',
          builder: (context, params) => SubCategoriesScreenWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HistoryDetailsPage',
          path: '/historyDetailsPage',
          builder: (context, params) => HistoryDetailsPageWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'TrendingbooksPage',
          path: '/trendingbooksPage',
          builder: (context, params) => const TrendingbooksPageWidget(),
        ),
        FFRoute(
          name: 'FilterPage',
          path: '/filterPage',
          builder: (context, params) => const FilterPageWidget(),
        ),
        FFRoute(
          name: 'BestauthorPage',
          path: '/bestauthorPage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'BestauthorPage')
              : const BestauthorPageWidget(),
        ),
        FFRoute(
          name: 'PopularbooksPage',
          path: '/popularbooksPage',
          builder: (context, params) => const PopularbooksPageWidget(),
        ),
        FFRoute(
          name: 'RecentreviewsPage',
          path: '/recentreviewsPage',
          builder: (context, params) => RecentreviewsPageWidget(
            reviewId: params.getParam(
              'reviewId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'AboutauthorPage',
          path: '/aboutauthorPage',
          builder: (context, params) => AboutauthorPageWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            authorImage: params.getParam(
              'authorImage',
              ParamType.String,
            ),
            authorId: params.getParam(
              'authorId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ReadBookPage',
          path: '/readBookPage',
          builder: (context, params) => ReadBookPageWidget(
            pdf: params.getParam(
              'pdf',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SearchPage',
          path: '/searchPage',
          builder: (context, params) => const SearchPageWidget(),
        ),
        FFRoute(
          name: 'NotificationsPage',
          path: '/notificationsPage',
          builder: (context, params) => const NotificationsPageWidget(),
        ),
        FFRoute(
          name: 'LatestPage',
          path: '/latestPage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'LatestPage')
              : const LatestPageWidget(),
        ),
        FFRoute(
          name: 'FavoritesPage',
          path: '/favoritesPage',
          builder: (context, params) => const FavoritesPageWidget(),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'ProfilePage')
              : const ProfilePageWidget(),
        ),
        FFRoute(
          name: 'MyprofilePage',
          path: '/myprofilePage',
          builder: (context, params) => const MyprofilePageWidget(),
        ),
        FFRoute(
          name: 'EditprofilePage',
          path: '/editprofilePage',
          builder: (context, params) => const EditprofilePageWidget(),
        ),
        FFRoute(
          name: 'DownloadPage',
          path: '/downloadPage',
          builder: (context, params) => const DownloadPageWidget(),
        ),
        FFRoute(
          name: 'SettingsPage',
          path: '/settingsPage',
          builder: (context, params) => const SettingsPageWidget(),
        ),
        FFRoute(
          name: 'ChangepasswordPage',
          path: '/changepasswordPage',
          builder: (context, params) => const ChangepasswordPageWidget(),
        ),
        FFRoute(
          name: 'PrivacypolicyPage',
          path: '/privacypolicyPage',
          builder: (context, params) => const PrivacypolicyPageWidget(),
        ),
        FFRoute(
          name: 'TermsconditionsPage',
          path: '/termsconditionsPage',
          builder: (context, params) => const TermsconditionsPageWidget(),
        ),
        FFRoute(
          name: 'AboutusPage',
          path: '/aboutusPage',
          builder: (context, params) => const AboutusPageWidget(),
        ),
        FFRoute(
          name: 'Bookdetailspage',
          path: '/bookdetailspage',
          builder: (context, params) => BookdetailspageWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ForgotpasswordPage',
          path: '/forgotpasswordPage',
          builder: (context, params) => const ForgotpasswordPageWidget(),
        ),
        FFRoute(
          name: 'VerificationPage',
          path: '/verificationPage',
          builder: (context, params) => VerificationPageWidget(
            firstname: params.getParam(
              'firstname',
              ParamType.String,
            ),
            lastname: params.getParam(
              'lastname',
              ParamType.String,
            ),
            username: params.getParam(
              'username',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
            phone: params.getParam(
              'phone',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ResetpasswordPage',
          path: '/resetpasswordPage',
          builder: (context, params) => ResetpasswordPageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'NavbarHomePage',
          path: '/navbarHomePage',
          builder: (context, params) => const NavbarHomePageWidget(),
        ),
        FFRoute(
          name: 'NavbarCategoriesPage',
          path: '/navbarCategoriesPage',
          builder: (context, params) => const NavbarCategoriesPageWidget(),
        ),
        FFRoute(
          name: 'NavbarLatestPage',
          path: '/navbarLatestPage',
          builder: (context, params) => const NavbarLatestPageWidget(),
        ),
        FFRoute(
          name: 'NavbarAuthorPage',
          path: '/navbarAuthorPage',
          builder: (context, params) => const NavbarAuthorPageWidget(),
        ),
        FFRoute(
          name: 'NavbarProfilePage',
          path: '/navbarProfilePage',
          builder: (context, params) => const NavbarProfilePageWidget(),
        ),
        FFRoute(
          name: 'ForgotVerificationPage',
          path: '/forgotVerificationPage',
          builder: (context, params) => ForgotVerificationPageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'DeleteAccountInstructionPage',
          path: '/deleteAccountInstructionPage',
          builder: (context, params) => const DeleteAccountInstructionPageWidget(),
        ),
        FFRoute(
          name: 'GetBookByCategoryPage',
          path: '/getBookByCategoryPage',
          builder: (context, params) => GetBookByCategoryPageWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SubscriptionPage',
          path: '/subscriptionPage',
          builder: (context, params) => const SubscriptionPageWidget(),
        ),
        FFRoute(
          name: 'ReadBookCustomPage',
          path: '/readBookCustomPage',
          builder: (context, params) => ReadBookCustomPageWidget(
            pdf: params.getParam(
              'pdf',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'filter_result_page',
          path: '/filterResultPage',
          builder: (context, params) => const FilterResultPageWidget(),
        ),
        FFRoute(
          name: 'ReviewsummaryPage',
          path: '/reviewsummaryPage',
          builder: (context, params) => ReviewsummaryPageWidget(
            paymentName: params.getParam(
              'paymentName',
              ParamType.String,
            ),
            subscriptionPlanId: params.getParam(
              'subscriptionPlanId',
              ParamType.String,
            ),
            subscriptionPlanName: params.getParam(
              'subscriptionPlanName',
              ParamType.String,
            ),
            subscriptionPlanDuration: params.getParam(
              'subscriptionPlanDuration',
              ParamType.String,
            ),
            subscriptionPlanDurationInTerms: params.getParam(
              'subscriptionPlanDurationInTerms',
              ParamType.String,
            ),
            subscriptionPlanPrice: params.getParam(
              'subscriptionPlanPrice',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'PaymentmethodPage',
          path: '/paymentmethodPage',
          builder: (context, params) => PaymentmethodPageWidget(
            subscriptionPlanPrice: params.getParam(
              'subscriptionPlanPrice',
              ParamType.String,
            ),
            subscriptionPlanName: params.getParam(
              'subscriptionPlanName',
              ParamType.String,
            ),
            subscriptionPlanDuration: params.getParam(
              'subscriptionPlanDuration',
              ParamType.String,
            ),
            subscriptionPlanDurationInTerm: params.getParam(
              'subscriptionPlanDurationInTerm',
              ParamType.String,
            ),
            subscriptionPlanId: params.getParam(
              'subscriptionPlanId',
              ParamType.String,
            ),
            price: params.getParam(
              'price',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splashPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
         final child =  PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
