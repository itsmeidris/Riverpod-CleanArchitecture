import 'package:go_router/go_router.dart';
import 'package:riverpod_clean_architecture/application/config/routes/app_routes.dart';
import 'package:riverpod_clean_architecture/domain/entities/user_entity.dart';
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
        path: userDetails,
        name: 'userDetails',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final user = extra['user'] as UserEntity;
          return UserDetail(user: user);
        },
      ),
    ],
  );
}
