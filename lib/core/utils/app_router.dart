import 'package:bookly/features/home/presentation/views/screens/home_screen.dart';
import 'package:bookly/features/splash/presentation/views/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSplashScreen = '/';
  static const String kHomeScreen = '/home';

  static final router = GoRouter(
    routes: [
      GoRoute(path: kSplashScreen, builder: (context, state) => SplashScreen()),
      GoRoute(path: kHomeScreen, builder: (context, state) => HomeScreen()),
    ],
  );
}
