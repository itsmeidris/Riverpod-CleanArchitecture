import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture/application/core/themes/colors/app_colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleClr;
  final Color? bgClr;
  const MainAppBar({super.key, required this.title, this.titleClr, this.bgClr});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgClr ?? AppColors.myBlack2,
      surfaceTintColor: AppColors.myTransparent,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          color: titleClr ?? AppColors.myWhite,
          fontWeight: FontWeight.w400,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}
