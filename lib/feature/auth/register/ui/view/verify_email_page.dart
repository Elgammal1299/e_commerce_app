import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/widget/custom_elevated_button.dart';
import 'package:e_commerce_app/core/utils/widget/custom_text_form.dart';
import 'package:e_commerce_app/feature/auth/register/data/model/verify_otp_body.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view/widget/custom_pin_code_widget.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view_model/verify_email_cubit/verify_email_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key, required this.firstName});
  final String firstName;
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final otpController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
        listener: (context, state) {
          if (state is VerifyEmailSuccess) {
            // ✅ رسالة النجاح
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.response)));

            // ✅ الانتقال إلى صفحة الـ Login
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          } else if (state is VerifyEmailError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final cubit = context.read<VerifyEmailCubit>();

          return SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  child: Image.asset(AppImages.bubble2Images),
                ),
                Positioned(
                  left: 0,
                  child: Image.asset(AppImages.bubble1Images),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 150),
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: AppColors.whiteColor,
                        child: CircleAvatar(
                          radius: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(AppImages.avatarImages),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Hello, $firstName !!',
                        style: AppStyles.styleBold52(context),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Type your email',
                        style: AppStyles.styleRegular20(context),
                      ),
                      const SizedBox(height: 16),
                      CustomTextForm(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Type your OTP',
                        style: AppStyles.styleRegular20(context),
                      ),
                      const SizedBox(height: 16),
                      CustomPinCodeWidget(controller: otpController),
                      const SizedBox(height: 50),
                      state is VerifyEmailLoading
                          ? const CircularProgressIndicator()
                          : CustomElevatedButton(
                              text: 'Verify Email',
                              onPressed: () {
                                final body = VerifyOtpBody(
                                  email: emailController.text.trim(),
                                  otp: otpController.text.trim(),
                                );
                                cubit.verifyEmail(body);
                              },
                            ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
