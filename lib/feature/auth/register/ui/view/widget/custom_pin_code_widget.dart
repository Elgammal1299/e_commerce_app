import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeWidget extends StatelessWidget {
  const CustomPinCodeWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      appContext: context,
      length: 6,
      // autoFocus: true,
      obscureText: false,
      cursorColor: AppColors.blackColor,
      keyboardType: TextInputType.number,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeFillColor: AppColors.greyColor,
        inactiveColor: AppColors.grey2Color,
        inactiveFillColor: AppColors.whiteColor,
        selectedColor: AppColors.primryColor,
        selectedFillColor: AppColors.primryColor,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (code) {
        //هنا بقا هناخد الكود اللى المستخدم دخله ونشوف بقا هنتعامل معاها ازاى

        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
}
