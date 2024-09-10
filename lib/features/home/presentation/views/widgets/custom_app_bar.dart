import 'package:bookly_app/core/routing/routes.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(Assets.logo, height: 16.1.h),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(Routes.search);
          },
          icon: const Icon(
            Icons.search,
            size: 25,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
