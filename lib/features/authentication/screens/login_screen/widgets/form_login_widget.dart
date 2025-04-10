import 'package:dae/core/components/normal_text_field_widget.dart';
import 'package:dae/core/components/password_text_field_widget.dart';
import 'package:dae/core/validation/input_validation.dart';
import 'package:dae/features/authentication/controller/login_controller.dart';
import 'package:flutter/material.dart';

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = LoginController.instance;
    return Form(
      key: controller.formState,
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الاسم',
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
          ),
          NormalTextFieldWidget(
            text: 'الاسم',
            controller: controller.email,
            validator: (value) => AppFieldValidator.validateEmail(value),
          ),
          SizedBox(height: 15),
          Text(
            'كلمة السر',
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
          ),
          PasswordTextFieldWidget(controller: controller.password),
        ],
      ),
    );
  }
}
