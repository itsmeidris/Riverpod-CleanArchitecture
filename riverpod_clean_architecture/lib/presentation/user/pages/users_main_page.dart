import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_clean_architecture/application/providers/user_provider.dart';
import 'package:riverpod_clean_architecture/core/themes/colors/app_colors.dart';
import 'package:riverpod_clean_architecture/presentation/shared/components/main_app_bar.dart';
import 'package:riverpod_clean_architecture/presentation/user/widgets/user_card.dart';

class UsersMainPage extends ConsumerWidget {
  const UsersMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersNotifiersProvider);

    return Scaffold(
      backgroundColor: AppColors.myBlack2,
      appBar: MainAppBar(title: "U S E R S  L I S T"),
      body: usersState.when(
        data: (users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return UserCard(userEntity: user);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
