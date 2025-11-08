import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_clean_architecture/presentation/notifiers/providers/users/user_provider.dart';
import 'package:riverpod_clean_architecture/application/core/themes/colors/app_colors.dart';
import 'package:riverpod_clean_architecture/presentation/notifiers/states/user/user_state.dart';
import 'package:riverpod_clean_architecture/presentation/shared/components/main_app_bar.dart';
import 'package:riverpod_clean_architecture/presentation/user/components/user_card.dart';
import 'package:riverpod_clean_architecture/presentation/shared/user_skeleton_card.dart';

class UsersMainPage extends ConsumerWidget {
  const UsersMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersNotifiersProvider);

    return Scaffold(
      backgroundColor: AppColors.myBlack2,
      appBar: MainAppBar(title: "U S E R S  L I S T"),
      body: usersState.when(
        success: (users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return UserCard(
              userEntity: user,
              onTap: () {
                context.pushNamed('userDetails', extra: {'user': user});
              },
            );
          },
        ),
        loading: () => UserSkeletonCard(),
        error: (error) => Center(child: Text('Error: $error')),
        initial: () => Center(
          child: Text(
            'WELCOME TO USERS',
            style: TextStyle(color: AppColors.myWhite, fontSize: 32),
          ),
        ),
      ),
    );
  }
}
