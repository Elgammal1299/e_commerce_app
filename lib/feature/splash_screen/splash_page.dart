import 'package:e_commerce_app/core/helper/user_session.dart';
import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // إعداد الأنيميشن
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    // تحديد مكان التنقل بعد الأنيميشن
    _decideNavigation();
  }

  Future<void> _decideNavigation() async {
    // ندي فرصة للانيميشن يشتغل
    await Future.delayed(const Duration(seconds: 3));

    // نجيب حالة تسجيل الدخول
    final loggedIn = await UserSession.isLoggedIn();

    if (!mounted) return;

    if (loggedIn) {
      Navigator.pushReplacementNamed(context, Routes.navBarRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.startRoute);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primryColor,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: SvgPicture.asset(
            AppImages.logoSplash,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
