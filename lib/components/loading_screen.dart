import '../package/config_packages.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
