import 'package:go_router/go_router.dart';
import 'package:riverpod_clean_architecture/core/constants/app_routes.dart';
import 'package:riverpod_clean_architecture/presentation/user/pages/user_detail.dart';
import 'package:riverpod_clean_architecture/presentation/user/pages/users_main_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: usersMain,
    routes: [
      GoRoute(
        path: usersMain,
        name: 'usersMain',
        builder: (context, state) {
          return UsersMainPage();
        },
      ),
      GoRoute(
        path: userDetail,
        name: 'userDetail',
        builder: (context, state) {
          return UserDetail();
        },
      ),
    ],
  );
}
