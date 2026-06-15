import 'package:go_router/go_router.dart';
import 'package:my_mini_shop/app/modules/privacy/view/privacy_screen.dart';
import 'package:my_mini_shop/app/modules/register_user/view/register_user_screen.dart';
import 'package:my_mini_shop/app/modules/wellcome/view/wellcome_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      WellcomRouter._route,
      PrivacyRouter._route,
      RegisterUserRouter._route,
    ],
  );
}

class WellcomRouter {
  static String path = '/';
  static final GoRoute _route = GoRoute(
    path: path,
    builder: (context, state) => WellcomeScreen(),
  );
}

class PrivacyRouter {
  static String path = '/privacy';
  static final GoRoute _route = GoRoute(
    path: path,
    builder: (context, state) => PrivacyScreen(),
  );
}

class RegisterUserRouter {
  static String path = '/register-user';
  static final GoRoute _route = GoRoute(
    path: path,
    builder: (context, state) => RegisterUserScreen(),
  );
}
