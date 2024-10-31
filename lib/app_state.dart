import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isIntro = prefs.getBool('ff_isIntro') ?? _isIntro;
    });
    _safeInit(() {
      _isLogin = prefs.getBool('ff_isLogin') ?? _isLogin;
    });
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
    _safeInit(() {
      _currentPassword =
          prefs.getString('ff_currentPassword') ?? _currentPassword;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userDetail')) {
        try {
          _userDetail = jsonDecode(prefs.getString('ff_userDetail') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _onlyPhoneNumber =
          prefs.getString('ff_onlyPhoneNumber') ?? _onlyPhoneNumber;
    });
    _safeInit(() {
      _favChange = prefs.getBool('ff_favChange') ?? _favChange;
    });
    _safeInit(() {
      _bookId = prefs.getString('ff_bookId') ?? _bookId;
    });
    _safeInit(() {
      _currentPagesPdf = prefs.getInt('ff_currentPagesPdf') ?? _currentPagesPdf;
    });
    _safeInit(() {
      _homePageLiveReadBook =
          prefs.getString('ff_homePageLiveReadBook') ?? _homePageLiveReadBook;
    });
    _safeInit(() {
      _homePageCurrentPdfIndex = prefs.getInt('ff_homePageCurrentPdfIndex') ??
          _homePageCurrentPdfIndex;
    });
    _safeInit(() {
      _homePageTotalPdfPageIndex =
          prefs.getInt('ff_homePageTotalPdfPageIndex') ??
              _homePageTotalPdfPageIndex;
    });
    _safeInit(() {
      _homePageBookId = prefs.getString('ff_homePageBookId') ?? _homePageBookId;
    });
    _safeInit(() {
      _homePageBookName =
          prefs.getString('ff_homePageBookName') ?? _homePageBookName;
    });
    _safeInit(() {
      _homePageBookPdf =
          prefs.getString('ff_homePageBookPdf') ?? _homePageBookPdf;
    });
    _safeInit(() {
      _deviceId = prefs.getString('ff_deviceId') ?? _deviceId;
    });
    _safeInit(() {
      _tokenFcm = prefs.getString('ff_tokenFcm') ?? _tokenFcm;
    });
    _safeInit(() {
      _searchList = prefs.getStringList('ff_searchList') ?? _searchList;
    });
    _safeInit(() {
      _pdfPathSave = prefs.getString('ff_pdfPathSave') ?? _pdfPathSave;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isIntro = false;
  bool get isIntro => _isIntro;
  set isIntro(bool value) {
    _isIntro = value;
    prefs.setBool('ff_isIntro', value);
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  set isLogin(bool value) {
    _isLogin = value;
    prefs.setBool('ff_isLogin', value);
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
  }

  String _countryCode = '91';
  String get countryCode => _countryCode;
  set countryCode(String value) {
    _countryCode = value;
  }

  int _introIndex = 0;
  int get introIndex => _introIndex;
  set introIndex(int value) {
    _introIndex = value;
  }

  bool _connected = true;
  bool get connected => _connected;
  set connected(bool value) {
    _connected = value;
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
    prefs.setString('ff_userId', value);
  }

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    prefs.setString('ff_token', value);
  }

  String _currentPassword = '';
  String get currentPassword => _currentPassword;
  set currentPassword(String value) {
    _currentPassword = value;
    prefs.setString('ff_currentPassword', value);
  }

  String _currency = '';
  String get currency => _currency;
  set currency(String value) {
    _currency = value;
  }

  dynamic _userDetail;
  dynamic get userDetail => _userDetail;
  set userDetail(dynamic value) {
    _userDetail = value;
    prefs.setString('ff_userDetail', jsonEncode(value));
  }

  String _onlyPhoneNumber = '';
  String get onlyPhoneNumber => _onlyPhoneNumber;
  set onlyPhoneNumber(String value) {
    _onlyPhoneNumber = value;
    prefs.setString('ff_onlyPhoneNumber', value);
  }

  bool _favChange = false;
  bool get favChange => _favChange;
  set favChange(bool value) {
    _favChange = value;
    prefs.setBool('ff_favChange', value);
  }

  String _bookId = '';
  String get bookId => _bookId;
  set bookId(String value) {
    _bookId = value;
    prefs.setString('ff_bookId', value);
  }

  int _currentPagesPdf = 1;
  int get currentPagesPdf => _currentPagesPdf;
  set currentPagesPdf(int value) {
    _currentPagesPdf = value;
    prefs.setInt('ff_currentPagesPdf', value);
  }

  int _totalPages = 1;
  int get totalPages => _totalPages;
  set totalPages(int value) {
    _totalPages = value;
  }

  String _homePageLiveReadBook = '';
  String get homePageLiveReadBook => _homePageLiveReadBook;
  set homePageLiveReadBook(String value) {
    _homePageLiveReadBook = value;
    prefs.setString('ff_homePageLiveReadBook', value);
  }

  int _homePageCurrentPdfIndex = 1;
  int get homePageCurrentPdfIndex => _homePageCurrentPdfIndex;
  set homePageCurrentPdfIndex(int value) {
    _homePageCurrentPdfIndex = value;
    prefs.setInt('ff_homePageCurrentPdfIndex', value);
  }

  int _homePageTotalPdfPageIndex = 1;
  int get homePageTotalPdfPageIndex => _homePageTotalPdfPageIndex;
  set homePageTotalPdfPageIndex(int value) {
    _homePageTotalPdfPageIndex = value;
    prefs.setInt('ff_homePageTotalPdfPageIndex', value);
  }

  String _homePageBookId = '';
  String get homePageBookId => _homePageBookId;
  set homePageBookId(String value) {
    _homePageBookId = value;
    prefs.setString('ff_homePageBookId', value);
  }

  String _homePageBookName = '';
  String get homePageBookName => _homePageBookName;
  set homePageBookName(String value) {
    _homePageBookName = value;
    prefs.setString('ff_homePageBookName', value);
  }

  String _homePageBookPdf = '';
  String get homePageBookPdf => _homePageBookPdf;
  set homePageBookPdf(String value) {
    _homePageBookPdf = value;
    prefs.setString('ff_homePageBookPdf', value);
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String value) {
    _deviceId = value;
    prefs.setString('ff_deviceId', value);
  }

  String _tokenFcm = '';
  String get tokenFcm => _tokenFcm;
  set tokenFcm(String value) {
    _tokenFcm = value;
    prefs.setString('ff_tokenFcm', value);
  }

  List<String> _authorId = [];
  List<String> get authorId => _authorId;
  set authorId(List<String> value) {
    _authorId = value;
  }

  void addToAuthorId(String value) {
    authorId.add(value);
  }

  void removeFromAuthorId(String value) {
    authorId.remove(value);
  }

  void removeAtIndexFromAuthorId(int index) {
    authorId.removeAt(index);
  }

  void updateAuthorIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    authorId[index] = updateFn(_authorId[index]);
  }

  void insertAtIndexInAuthorId(int index, String value) {
    authorId.insert(index, value);
  }

  List<String> _categoryId = [];
  List<String> get categoryId => _categoryId;
  set categoryId(List<String> value) {
    _categoryId = value;
  }

  void addToCategoryId(String value) {
    categoryId.add(value);
  }

  void removeFromCategoryId(String value) {
    categoryId.remove(value);
  }

  void removeAtIndexFromCategoryId(int index) {
    categoryId.removeAt(index);
  }

  void updateCategoryIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoryId[index] = updateFn(_categoryId[index]);
  }

  void insertAtIndexInCategoryId(int index, String value) {
    categoryId.insert(index, value);
  }

  bool _filterVariable = false;
  bool get filterVariable => _filterVariable;
  set filterVariable(bool value) {
    _filterVariable = value;
  }

  List<String> _searchList = [];
  List<String> get searchList => _searchList;
  set searchList(List<String> value) {
    _searchList = value;
    prefs.setStringList('ff_searchList', value);
  }

  void addToSearchList(String value) {
    searchList.add(value);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void removeFromSearchList(String value) {
    searchList.remove(value);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void removeAtIndexFromSearchList(int index) {
    searchList.removeAt(index);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void updateSearchListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchList[index] = updateFn(_searchList[index]);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void insertAtIndexInSearchList(int index, String value) {
    searchList.insert(index, value);
    prefs.setStringList('ff_searchList', _searchList);
  }

  String _pdfPathSave = '';
  String get pdfPathSave => _pdfPathSave;
  set pdfPathSave(String value) {
    _pdfPathSave = value;
    prefs.setString('ff_pdfPathSave', value);
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
  }

  double _progress = 0.0;
  double get progress => _progress;
  set progress(double value) {
    _progress = value;
  }

  String _subscriptionId = '';
  String get subscriptionId => _subscriptionId;
  set subscriptionId(String value) {
    _subscriptionId = value;
  }

  bool _paymentSuccessCheck = false;
  bool get paymentSuccessCheck => _paymentSuccessCheck;
  set paymentSuccessCheck(bool value) {
    _paymentSuccessCheck = value;
  }

  String _paypalTransationId = '';
  String get paypalTransationId => _paypalTransationId;
  set paypalTransationId(String value) {
    _paypalTransationId = value;
  }

  String _razorpayTransationId = '';
  String get razorpayTransationId => _razorpayTransationId;
  set razorpayTransationId(String value) {
    _razorpayTransationId = value;
  }

  final _getBookbyCategoryCacheManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getBookbyCategoryCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getBookbyCategoryCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetBookbyCategoryCacheCache() =>
      _getBookbyCategoryCacheManager.clear();
  void clearGetBookbyCategoryCacheCacheKey(String? uniqueKey) =>
      _getBookbyCategoryCacheManager.clearRequest(uniqueKey);

  final _getFavouriteBookCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getFavouriteBookCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getFavouriteBookCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetFavouriteBookCacheCache() =>
      _getFavouriteBookCacheManager.clear();
  void clearGetFavouriteBookCacheCacheKey(String? uniqueKey) =>
      _getFavouriteBookCacheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
