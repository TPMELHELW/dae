import 'package:dae/core/components/normal_text_field_widget.dart';
import 'package:dae/core/components/password_text_field_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/core/validation/input_validation.dart';
import 'package:dae/features/authentication/controller/signup_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormSignupWidget extends StatelessWidget {
  const FormSignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = SignupController.instance;
    return Form(
      key: controller.formState,
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('الصفا', style: Theme.of(context).textTheme.bodyLarge),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.border),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            value: 'داعي',
            items:
                controller.items
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
            onChanged: (value) {
              controller.alsafa = value!;
            },
          ),
          SizedBox(height: 15),
          Text(
            'الاسم',
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
          ),
          NormalTextFieldWidget(
            text: 'الاسم',
            controller: controller.name,
            validator:
                (value) => AppFieldValidator.validateEmpty(value, 'Name'),
          ),
          SizedBox(height: 15),
          Text(
            'الايميل',
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
          ),
          NormalTextFieldWidget(
            text: 'الايميل',
            controller: controller.email,
            validator: (value) => AppFieldValidator.validateEmail(value),
          ),
          SizedBox(height: 15),

          Text(
            ' رقم الهاتف',
            style: Theme.of(context).textTheme.bodyLarge,

            textDirection: TextDirection.rtl,
          ),
          NormalTextFieldWidget(
            controller: controller.phoneNumber,
            text: ' رقم الهاتف',
            textType: TextInputType.number,
            validator: (value) => AppFieldValidator.validatePhoneNumber(value),

            prefixIcon: Icon(CupertinoIcons.phone),
          ),

          SizedBox(height: 15),

          Text(
            'كلمة السر',
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
          ),
          PasswordTextFieldWidget(controller: controller.password),
          SizedBox(height: 15),

          Text(
            ' تاكيد كلمة السر',
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
          ),
          PasswordTextFieldWidget(),
        ],
      ),
    );
  }
}
