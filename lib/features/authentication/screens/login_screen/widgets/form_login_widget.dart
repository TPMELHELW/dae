import 'package:dae/core/components/normal_text_field_widget.dart';
import 'package:dae/core/components/password_text_field_widget.dart';
import 'package:flutter/material.dart';

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الاسم',
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
          ),
          NormalTextFieldWidget(text: 'الاسم'),
          SizedBox(height: 15),
          Text(
            'كلمة السر',
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
          ),
          PasswordTextFieldWidget(),
        ],
      ),
    );
  }
}
