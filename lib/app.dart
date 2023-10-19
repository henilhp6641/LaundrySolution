

import 'package:ft_washing_app/package/config_packages.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final List<StreamSubscription> _streams = [];

  var locales = [
    const Locale('en', ''),
    const Locale('ar', ''),
  ];

  @override
  void initState() {
    print(AppPref().languageCode);
    WidgetsBinding.instance.addObserver(this);
    // _internetAvailability();
    // FCMUtils.instance.init(_streams);
    // final status = AppTrackingTransparency.requestTrackingAuthorization();
    super.initState();
  }

  @override
  void dispose() {
    for (var element in _streams) {
      element.cancel();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      initialRoute: AppRouter.splash,
      getPages: AppRouter.getPages,
      fallbackLocale: const Locale('en'),
      // locale: Locale(AppPref().languageCode, ''),
      supportedLocales: locales,
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: (MediaQuery.of(context).platformBrightness == Brightness.dark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark),
          child: child ?? Container(),
        );
      },
      // localizationsDelegates: const [
      // S.delegate,
      // GlobalMaterialLocalizations.delegate,
      // GlobalWidgetsLocalizations.delegate,
      // GlobalCupertinoLocalizations.delegate,
      // ],
    );
  }

  // _internetAvailability() async {
  //   _streams.add(Connectivity()
  //       .onConnectivityChanged
  //       .listen((event) => _checkInternetStatus(event)));
  //   if (GetPlatform.isIOS)
  //     _checkInternetStatus(await Connectivity().checkConnectivity());
  // }

  // _checkInternetStatus(ConnectivityResult result) async {
  //   if (result == ConnectivityResult.none) {
  //     isInternetAvailable = false;
  //   } else {
  //     isInternetAvailable = await DataConnectionChecker().hasConnection;
  //   }
  // }
}
