import 'package:e_commerce_app/core/utils/widget/custom_elevated_button.dart';
import 'package:e_commerce_app/core/utils/widget/custom_text_form.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view/widget/custom_filed_password.dart';
import 'package:e_commerce_app/feature/auth/login/ui/view_model/login_cubit/login_cubit.dart';
import 'package:e_commerce_app/feature/auth/login/data/model/login_body_model.dart';
import 'package:e_commerce_app/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final ValueNotifier<bool> isPasswordHidden = ValueNotifier(true);

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  void _submitLogin() {
    if (_formKey.currentState?.validate() != true) return;

    final body = LoginBodyModel(
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text.trim(),
    );

    context.read<LoginCubit>().login(body);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, Routes.navBarRoute);
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextForm(controller: emailCtrl, hintText: 'Email'),
              SizedBox(height: 16),
              CustomFiledPassword(
                hintText: 'Password',
                isPasswordHidden: isPasswordHidden,
                passwordCtrl: passwordCtrl,
              ),
              SizedBox(height: 40),
              isLoading
                  ? CircularProgressIndicator()
                  : CustomElevatedButton(text: 'Next', onPressed: _submitLogin),
              SizedBox(height: 14),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(onPressed: () {}, child: Text('Cancel')),
              ),
            ],
          ),
        );
      },
    );
  }
}
