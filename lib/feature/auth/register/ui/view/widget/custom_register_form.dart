import 'package:e_commerce_app/core/router/routes.dart';
import 'package:e_commerce_app/core/utils/widget/custom_elevated_button.dart';
import 'package:e_commerce_app/core/utils/widget/custom_text_form.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view/widget/custom_filed_password.dart';
import 'package:e_commerce_app/feature/auth/register/data/model/register_body_model.dart';
import 'package:e_commerce_app/feature/auth/register/ui/view_model/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRegisterForm extends StatefulWidget {
  const CustomRegisterForm({super.key});

  @override
  State<CustomRegisterForm> createState() => _CustomRegisterFormState();
}

class _CustomRegisterFormState extends State<CustomRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final ValueNotifier<bool> isPasswordHidden = ValueNotifier(true);

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    super.dispose();
  }

  void _submitRegister() {
    if (_formKey.currentState?.validate() != true) return;

    final body = RegisterBodyModel(
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text.trim(),
      firstName: firstNameCtrl.text.trim(),
      lastName: lastNameCtrl.text.trim(),
    );

    // إطلاق الـ register عبر Cubit
    context.read<RegisterCubit>().register(body);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterError) {
          // عرض Snackbar أو Dialog للخطأ
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is RegisterSuccess) {
          final fristName = state.fristName;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.response.message)));
          Navigator.pushReplacementNamed(context, Routes.verifyEmailRoute, arguments: fristName);
        }
      },
      builder: (context, state) {
        final isLoading = state is RegisterLoading;

        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextForm(controller: emailCtrl, hintText: 'Email'),
              SizedBox(height: 7),
              CustomFiledPassword(
                hintText: 'Password',
                isPasswordHidden: isPasswordHidden,
                passwordCtrl: passwordCtrl,
              ),
              SizedBox(height: 7),
              CustomTextForm(controller: firstNameCtrl, hintText: 'First Name'),
              SizedBox(height: 7),
              CustomTextForm(controller: lastNameCtrl, hintText: 'Last Name'),
              SizedBox(height: 70),
              isLoading
                  ? CircularProgressIndicator()
                  : CustomElevatedButton(
                      text: 'Done',
                      onPressed: _submitRegister,
                    ),
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
