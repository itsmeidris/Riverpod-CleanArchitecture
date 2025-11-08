import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture/application/core/themes/colors/app_colors.dart';
import 'package:riverpod_clean_architecture/domain/entities/user_entity.dart';
import 'package:riverpod_clean_architecture/presentation/shared/components/main_app_bar.dart';

class UserDetail extends StatelessWidget {
  final UserEntity user;
  const UserDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBlack2,
      appBar: MainAppBar(title: "U S E R  D E T A I L"),
      body: Center(
        child: Text(
          'NAME: ${user.firstName}',
          style: TextStyle(color: AppColors.myWhite, fontSize: 32),
        ),
      ),
    );
  }
}
