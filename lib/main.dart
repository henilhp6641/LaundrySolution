import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ft_washing_app/package/config_packages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Stripe.publishableKey = "pk_test_51O0u8DE7AgWz46rt2pxxaxGBHVK4jJScqheTivuM5uGGTWqeeAl34TH0L3IC9wDkUtu1JfUG3dx4HE5CLu9H5m5d00gmxFrHUq";

  await dotenv.load(fileName: "asset/.env");

  await AppPref().isPreferenceReady;
  // await FCMUtils.instance.setupChannel();

  // await FirebaseMessaging.instance.setAutoInitEnabled(true);
  //
  await FirebaseMessaging.instance
      .requestPermission(alert: true, sound: true, badge: true);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  //
  // await NotificationUtils().initialize();
  // FirebaseMessaging.instance.getToken().then((value) {value=NotificationUtils().firebaseToken.toString();print("HHHHH $value");});

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  if (AppPref().languageCode.isEmpty) {
    final String defaultLocale = Platform.localeName.split('_')[0];
    AppPref().languageCode =
        (defaultLocale.toLowerCase() == 'ar') ? defaultLocale : 'en';
    if (AppPref().languageCode.isEmpty) {
      AppPref().languageCode = 'en';
    }
  }
  runApp(const MyApp());
}
