import 'package:e_commerce_app/core/utils/widget/custom_text_form.dart';
import 'package:flutter/material.dart';

class CustomFiledPassword extends StatelessWidget {
  const CustomFiledPassword({
    super.key,
    required this.isPasswordHidden,
    required this.passwordCtrl,
    required this.hintText,
  });

  final ValueNotifier<bool> isPasswordHidden;
  final TextEditingController passwordCtrl;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isPasswordHidden,
        builder: (context, hidden, child) {
          return CustomTextForm(
            suffixIcon: IconButton(
              icon: Icon(
                hidden ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                isPasswordHidden.value = !hidden;
              },
            ),
            hintText: hintText,
            isObscureText: hidden,
            keyboardType: TextInputType.visiblePassword,
            controller: passwordCtrl,
          );
        });
  }
}
