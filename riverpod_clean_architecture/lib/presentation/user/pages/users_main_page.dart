import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_clean_architecture/core/themes/colors/app_colors.dart';
import 'package:riverpod_clean_architecture/presentation/shared/components/main_app_bar.dart';
import 'package:riverpod_clean_architecture/presentation/user/widgets/user_card.dart';

class UsersMainPage extends StatelessWidget {
  const UsersMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBlack2,
      appBar: MainAppBar(title: "U S E R S  L I S T"),
      body: Center(child: UserCard()),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.pushNamed('userDetail');
        },
        child: Text("GO TO DETAILS OF USER"),
      ),
    );
  }
}
