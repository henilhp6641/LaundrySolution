// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'api_client.dart';
//
// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************
//
// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers
//
// class _IpClient implements IpClient {
//   _IpClient(
//     this._dio, {
//     this.baseUrl,
//   }) {
//     baseUrl ??= 'https://api.ipify.org/';
//   }
//
//   final Dio _dio;
//
//   String? baseUrl;
//
//   @override
//   Future<String> getIpAddress() async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final Map<String, dynamic>? _data = null;
//     final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//         .compose(
//           _dio.options,
//           '',
//           queryParameters: queryParameters,
//           data: _data,
//         )
//         .copyWith(
//             baseUrl: _combineBaseUrls(
//           _dio.options.baseUrl,
//           baseUrl,
//         ))));
//     final value = _result.data!;
//     return value;
//   }
//
//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }
//
//   String _combineBaseUrls(
//     String dioBaseUrl,
//     String? baseUrl,
//   ) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }
//
//     final url = Uri.parse(baseUrl);
//
//     if (url.isAbsolute) {
//       return url.toString();
//     }
//
//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }
//
// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers
//
// class _RestClient implements RestClient {
//   _RestClient(
//     this._dio, {
//     this.baseUrl,
//   });
//
//   final Dio _dio;
//
//   String? baseUrl;
//
//   @override
//   Future<RootResponse?> login(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>?>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'login',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value =
//         _result.data == null ? null : RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<RootResponse?> register(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>?>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'register',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value =
//         _result.data == null ? null : RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<AppResponse<UserData>?> verifyOTP(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>?>(
//         _setStreamType<AppResponse<UserData>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'verify-otp',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = _result.data == null
//         ? null
//         : AppResponse<UserData>.fromJson(
//             _result.data!,
//             (json) => UserData.fromJson(json as Map<String, dynamic>),
//           );
//     return value;
//   }
//
//   @override
//   Future<RootResponse> sendOTP(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'send-otp',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<RootResponse?> logout() async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final Map<String, dynamic>? _data = null;
//     final _result = await _dio
//         .fetch<Map<String, dynamic>?>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'logout',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value =
//         _result.data == null ? null : RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<RootResponse> deleteAccount(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'delete-account',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<AppResponse<UserData>?> lastLogin(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>?>(
//         _setStreamType<AppResponse<UserData>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'last-login',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = _result.data == null
//         ? null
//         : AppResponse<UserData>.fromJson(
//             _result.data!,
//             (json) => UserData.fromJson(json as Map<String, dynamic>),
//           );
//     return value;
//   }
//
//   @override
//   Future<AppResponses<MyVehicleData>?> getMyVehicles() async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final Map<String, dynamic>? _data = null;
//     final _result = await _dio.fetch<Map<String, dynamic>?>(
//         _setStreamType<AppResponses<MyVehicleData>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-my-vehicle',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = _result.data == null
//         ? null
//         : AppResponses<MyVehicleData>.fromJson(
//             _result.data!,
//             (json) => MyVehicleData.fromJson(json as Map<String, dynamic>),
//           );
//     return value;
//   }
//
//   @override
//   Future<RootResponse?> addVehicle(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>?>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'add-vehicle',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value =
//         _result.data == null ? null : RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<RootResponse?> deleteMyVehicle(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>?>(_setStreamType<RootResponse>(Options(
//       method: 'DELETE',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'delete-vehicle',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value =
//         _result.data == null ? null : RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<AppResponse<WalletData>?> getWallet(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>?>(
//         _setStreamType<AppResponse<WalletData>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-wallet',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = _result.data == null
//         ? null
//         : AppResponse<WalletData>.fromJson(
//             _result.data!,
//             (json) => WalletData.fromJson(json as Map<String, dynamic>),
//           );
//     return value;
//   }
//
//   @override
//   Future<AppResponse<TransactionHistory>?> getWalletDetail(
//       Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>?>(
//         _setStreamType<AppResponse<TransactionHistory>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-wallet-detail',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = _result.data == null
//         ? null
//         : AppResponse<TransactionHistory>.fromJson(
//             _result.data!,
//             (json) => TransactionHistory.fromJson(json as Map<String, dynamic>),
//           );
//     return value;
//   }
//
//   @override
//   Future<RootResponse> topUPWallet(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'top-up-wallet',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<AppResponse<GetAllParking>> getAllParking(
//       Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<AppResponse<GetAllParking>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-all-parking',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = AppResponse<GetAllParking>.fromJson(
//       _result.data!,
//       (json) => GetAllParking.fromJson(json as Map<String, dynamic>),
//     );
//     return value;
//   }
//
//   @override
//   Future<AppResponse<ParkingData>> getParkingDetail(
//       Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<AppResponse<ParkingData>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-parking-detail',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = AppResponse<ParkingData>.fromJson(
//       _result.data!,
//       (json) => ParkingData.fromJson(json as Map<String, dynamic>),
//     );
//     return value;
//   }
//
//   @override
//   Future<RootResponse?> addParkingBookmark(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>?>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'add-bookmark-parking',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value =
//         _result.data == null ? null : RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<RootResponse?> deleteParkingBookmark(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>?>(_setStreamType<RootResponse>(Options(
//       method: 'DELETE',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'delete-bookmark-parking',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value =
//         _result.data == null ? null : RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<AppResponse<ReserveParkingData>> reserveParking(
//       Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<AppResponse<ReserveParkingData>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'reserve-a-parking',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = AppResponse<ReserveParkingData>.fromJson(
//       _result.data!,
//       (json) => ReserveParkingData.fromJson(json as Map<String, dynamic>),
//     );
//     return value;
//   }
//
//   @override
//   Future<AppResponse<ParkingAvailabilityData>> checkParkingAvailability(
//       Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<AppResponse<ParkingAvailabilityData>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'check-parking-avalibility',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = AppResponse<ParkingAvailabilityData>.fromJson(
//       _result.data!,
//       (json) => ParkingAvailabilityData.fromJson(json as Map<String, dynamic>),
//     );
//     return value;
//   }
//
//   @override
//   Future<AppResponse<ReservationData>> getMyReservation(
//       Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<AppResponse<ReservationData>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-my-reservation',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = AppResponse<ReservationData>.fromJson(
//       _result.data!,
//       (json) => ReservationData.fromJson(json as Map<String, dynamic>),
//     );
//     return value;
//   }
//
//   @override
//   Future<AppResponse<ReservedParkingData>> getReservationDetail(
//       Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<AppResponse<ReservedParkingData>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-reservation-detail',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = AppResponse<ReservedParkingData>.fromJson(
//       _result.data!,
//       (json) => ReservedParkingData.fromJson(json as Map<String, dynamic>),
//     );
//     return value;
//   }
//
//   @override
//   Future<RootResponse?> cancelReservation(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>?>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'cancel-reservation',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value =
//         _result.data == null ? null : RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<RootResponse?> extendReservation(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>?>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'extend-reservation',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value =
//         _result.data == null ? null : RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<AppResponse<NotificationResp>> getNotificationList(
//       Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<AppResponse<NotificationResp>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-notification',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = AppResponse<NotificationResp>.fromJson(
//       _result.data!,
//       (json) => NotificationResp.fromJson(json as Map<String, dynamic>),
//     );
//     return value;
//   }
//
//   @override
//   Future<AppResponse<GeneralSettingData>> getGeneralSettings() async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final Map<String, dynamic>? _data = null;
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<AppResponse<GeneralSettingData>>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-general-setting',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = AppResponse<GeneralSettingData>.fromJson(
//       _result.data!,
//       (json) => GeneralSettingData.fromJson(json as Map<String, dynamic>),
//     );
//     return value;
//   }
//
//   @override
//   Future<WalletPassResp> getWalletPass() async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final Map<String, dynamic>? _data = null;
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<WalletPassResp>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-pass',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = WalletPassResp.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<RootResponse> contactUs(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'contact-us',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<AppResponse<InvoiceData>> getInvoice(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<AppResponse<InvoiceData>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-invoice',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = AppResponse<InvoiceData>.fromJson(
//       _result.data!,
//       (json) => InvoiceData.fromJson(json as Map<String, dynamic>),
//     );
//     return value;
//   }
//
//   @override
//   Future<RootResponse> changeLanguage(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'change-language',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<AppResponses<GetLanguageData>> getLanguage() async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final Map<String, dynamic>? _data = null;
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<AppResponses<GetLanguageData>>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-language',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = AppResponses<GetLanguageData>.fromJson(
//       _result.data!,
//       (json) => GetLanguageData.fromJson(json as Map<String, dynamic>),
//     );
//     return value;
//   }
//
//   @override
//   Future<RootResponse> paidReservation(Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio
//         .fetch<Map<String, dynamic>>(_setStreamType<RootResponse>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'paid-reservation',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = RootResponse.fromJson(_result.data!);
//     return value;
//   }
//
//   @override
//   Future<AppResponse<ReservationData>> getLongTermReservation(
//       Map<String, dynamic> map) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(map);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<AppResponse<ReservationData>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               'get-my-long-term-reservation',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     final value = AppResponse<ReservationData>.fromJson(
//       _result.data!,
//       (json) => ReservationData.fromJson(json as Map<String, dynamic>),
//     );
//     return value;
//   }
//
//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }
//
//   String _combineBaseUrls(
//     String dioBaseUrl,
//     String? baseUrl,
//   ) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }
//
//     final url = Uri.parse(baseUrl);
//
//     if (url.isAbsolute) {
//       return url.toString();
//     }
//
//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }
