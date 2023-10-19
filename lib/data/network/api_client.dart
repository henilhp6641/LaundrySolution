//
//
// import 'package:retrofit/http.dart';
//
// import '../../package/config_packages.dart';
// import '../../utils/app_toast.dart';
// import '../../widgets/app_loader.dart';
//
// part 'api_client.g.dart';
//
bool isInternetAvailable = true;
//
// @RestApi(baseUrl: 'https://api.ipify.org/')
// abstract class IpClient {
//   factory IpClient(Dio dio, {String? baseUrl}) = _IpClient;
//
//   @GET('')
//   Future<String> getIpAddress();
// }
//
// @RestApi()
// abstract class RestClient {
//   factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;
//
//   //region USER AUTHENTICATION
//   @POST("login")
//   Future<RootResponse?> login(@Body() Map<String, dynamic> map);
//
//   @POST("register")
//   Future<RootResponse?> register(@Body() Map<String, dynamic> map);
//
//   @POST("verify-otp")
//   Future<AppResponse<UserData>?> verifyOTP(@Body() Map<String, dynamic> map);
//
//   @POST("send-otp")
//   Future<RootResponse> sendOTP(@Body() Map<String, dynamic> map);
//
//   @POST("logout")
//   Future<RootResponse?> logout();
//   @POST("delete-account")
//   Future<RootResponse> deleteAccount(@Body() Map<String, dynamic> map);
//
//   @POST("last-login")
//   Future<AppResponse<UserData>?> lastLogin(@Body() Map<String, dynamic> map);
//
//   //endregion
//
//   //region MY VEHICLES MODULE
//   @POST("get-my-vehicle")
//   Future<AppResponses<MyVehicleData>?> getMyVehicles();
//
//   @POST("add-vehicle")
//   Future<RootResponse?> addVehicle(@Body() Map<String, dynamic> map);
//
//   @DELETE("delete-vehicle")
//   Future<RootResponse?> deleteMyVehicle(@Body() Map<String, dynamic> map);
//
//   //endregion
//
//   //region WALLET
//   @POST("get-wallet")
//   Future<AppResponse<WalletData>?> getWallet(@Body() Map<String, dynamic> map);
//
//   @POST("get-wallet-detail")
//   Future<AppResponse<TransactionHistory>?> getWalletDetail(
//       @Body() Map<String, dynamic> map);
//
//   @POST("top-up-wallet")
//   Future<RootResponse> topUPWallet(@Body() Map<String, dynamic> map);
//
//   //endregion
//
//   //region PARKING MODULE
//   @POST("get-all-parking")
//   Future<AppResponse<GetAllParking>> getAllParking(
//       @Body() Map<String, dynamic> map);
//
//   @POST("get-parking-detail")
//   Future<AppResponse<ParkingData>> getParkingDetail(
//       @Body() Map<String, dynamic> map);
//
//   @POST("add-bookmark-parking")
//   Future<RootResponse?> addParkingBookmark(@Body() Map<String, dynamic> map);
//
//   @DELETE("delete-bookmark-parking")
//   Future<RootResponse?> deleteParkingBookmark(@Body() Map<String, dynamic> map);
//
//   @POST("reserve-a-parking")
//   Future<AppResponse<ReserveParkingData>> reserveParking(
//       @Body() Map<String, dynamic> map);
//
//   @POST("check-parking-avalibility")
//   Future<AppResponse<ParkingAvailabilityData>> checkParkingAvailability(
//       @Body() Map<String, dynamic> map);
//
//   @POST("get-my-reservation")
//   Future<AppResponse<ReservationData>> getMyReservation(
//       @Body() Map<String, dynamic> map);
//
//   @POST("get-reservation-detail")
//   Future<AppResponse<ReservedParkingData>> getReservationDetail(
//       @Body() Map<String, dynamic> map);
//
//   @POST("cancel-reservation")
//   Future<RootResponse?> cancelReservation(@Body() Map<String, dynamic> map);
//
//   @POST("extend-reservation")
//   Future<RootResponse?> extendReservation(@Body() Map<String, dynamic> map);
//
// //endregion
//
//   @POST("get-notification")
//   Future<AppResponse<NotificationResp>> getNotificationList(
//       @Body() Map<String, dynamic> map);
//
//   @GET("get-general-setting")
//   Future<AppResponse<GeneralSettingData>> getGeneralSettings();
//
//   @GET("get-pass")
//   Future<WalletPassResp> getWalletPass();
//
//   @POST("contact-us")
//   Future<RootResponse> contactUs(@Body() Map<String, dynamic> map);
//
//   @POST("get-invoice")
//   Future<AppResponse<InvoiceData>> getInvoice(@Body() Map<String, dynamic> map);
//   @POST("change-language")
//   Future<RootResponse> changeLanguage(@Body() Map<String, dynamic> map);
//   @GET("get-language")
//   Future<AppResponses<GetLanguageData>> getLanguage();
//   @POST("paid-reservation")
//   Future<RootResponse> paidReservation(@Body() Map<String, dynamic> map);
//
//   @POST("get-my-long-term-reservation")
//   Future<AppResponse<ReservationData>> getLongTermReservation(
//       @Body() Map<String, dynamic> map);
// }
//
// Future<T?> callApi<T>(Future<T> request, [bool doShowLoader = true]) async {
//   if (!isInternetAvailable) {
//     showErrorToast('Internet not available');
//     return null;
//   }
//   try {
//     if (doShowLoader) showLoader(isCancelable: false);
//     var response = await request;
//     if (doShowLoader) dismissLoader();
//     return response;
//   } on DioError catch (dioError) {
//     if (doShowLoader) dismissLoader();
//     debugPrint("callApi :: DioError -> $dioError");
//     onResponseError(dioError);
//   } catch (error) {
//     if (doShowLoader) dismissLoader();
//     debugPrint("callApi :: Error -> $error");
//   }
//   return null;
// }
//
// onResponseError(onError) {
//   debugPrint(
//       "onResponseError:onError ${onError.toString()} || ${onError.response.statusCode}");
//   if (onError is DioError) {
//     switch (onError.response?.statusCode) {
//       case 400:
//       case 401:
//         showAppToast('Login expires. Please re-login with Phone number.');
//         var languageCode = AppPref().languageCode;
//         var isDark = AppPref().isDark;
//         AppPref().clear();
//         AppPref().isFirstTime = false;
//         AppPref().isDark = isDark;
//         AppPref().languageCode = languageCode;
//         //  Get.offAllNamed(AppRouter.loginOption);
//         break;
//       case 403:
//       case 404:
//         break;
//       case 406:
//         var json = onError.response?.data;
//         showErrorSheet(json.toString().replaceAll('[', '').replaceAll(']', ''));
//         break;
//       case 408:
//       case 409:
//       case 422:
//       case 423:
//       case 426:
//         break;
//       case 500:
//         showErrorSheet('Internal Server Error');
//         break;
//       default:
//         break;
//     }
//   }
// }
//
// /// to show error
// void showErrorSheet(String errorText, {Function()? onTap}) {
//   showModalBottomSheet(
//     // backgroundColor: AppPref().isDark!? AppColor.dropDownBgDark : AppColor.dropDownBgDark,
//     context: Get.context!,
//     isScrollControlled: true,
//     builder: (context) => Container(
//       color: context.theme.scaffoldBackgroundColor,
//       padding: EdgeInsetsDirectional.only(
//           start: 24,
//           end: 24,
//           top: 18,
//           bottom: context.bottomPaddingIfNeeded(18)),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Center(
//           //     child: AppText.semiBold(S.of(context).error,
//           //         color: context.textTheme.titleLarge?.color,
//           //         size: 24,
//           //         textAlign: TextAlign.start)),
//           const Gap(16),
//           for (var data in errorText.split(',')) ...{
//             Container(
//               margin: const EdgeInsets.only(bottom: 4),
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(top: 4),
//                     child: CircleAvatar(
//                         backgroundColor: context.textTheme.titleLarge?.color,
//                         radius: 5),
//                   ),
//                   const Gap(8),
//                   // Expanded(
//                   //     child: AppText.medium(data.trim().capitalizeFirst,
//                   //         color: context.textTheme.titleLarge?.color,
//                   //         size: 14,
//                   //         textAlign: TextAlign.start)),
//                 ],
//               ),
//             ),
//           },
//           const Gap(16),
//           // AppButton.fix(S.of(context).okay,
//           //     onPressed: onTap ?? () => Get.back())
//         ],
//       ),
//     ),
//   );
// }
