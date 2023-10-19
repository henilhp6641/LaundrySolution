// import 'package:Najam/package/config_packages.dart';
// import 'package:Najam/package/screen_packages.dart';
// import 'package:flutter/foundation.dart' as Foundation;
//
// late Dio dio;
// late RestClient apiClient;
// late IpClient ipClient;
//
// BaseOptions baseOptions = BaseOptions(
//     connectTimeout: const Duration(seconds: 6),
//     receiveTimeout: const Duration(seconds: 6));
//
// const String baseUrl = kDebugMode
//     ? 'https://dev.pickedsa.com/api/'
//     : 'https://dev.pickedsa.com/api/';
//
// // const String baseUrl = 'https://services.pickedsa.com/api/';
//
// Future<void> dioSetUp({int? language}) async {
//   dio = Dio(baseOptions);
//
//   dio.interceptors.add(InterceptorsWrapper(onRequest:
//       (RequestOptions option, RequestInterceptorHandler handler) async {
//     var customHeaders = {
//       'Accept': 'application/json',
//       'token': AppPref().isLogin ? AppPref().token : '',
//       'language': language ?? (AppPref().languageCode == "en" ? 1 : 2),
//     };
//     option.headers.addAll(customHeaders);
//     handler.next(option);
//   }));
//
//   /// PreDioLogger to print api log in DEBUG mode
//   if (!Foundation.kReleaseMode) {
//     var logger = PrettyDioLogger(
//       maxWidth: 232,
//       requestHeader: true,
//       requestBody: true,
//     );
//     dio.interceptors.add(logger);
//   }
//
//   apiClient = RestClient(dio, baseUrl: baseUrl);
//   ipClient = IpClient(Dio(baseOptions));
// }
