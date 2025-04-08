import 'package:dae/core/components/normal_text_field_widget.dart';
import 'package:dae/core/components/password_text_field_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormSignupWidget extends StatelessWidget {
  const FormSignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
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
                ['معلم', 'داعي']
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
            onChanged: (value) {},
          ),
          SizedBox(height: 15),
          Text(
            'الاسم',
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
          ),
          NormalTextFieldWidget(text: 'الاسم'),
          SizedBox(height: 15),

          Text(
            ' رقم الهاتف',
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
          ),
          NormalTextFieldWidget(
            text: ' رقم الهاتف',
            textType: TextInputType.number,
            prefixIcon: Icon(CupertinoIcons.phone),
          ),

          SizedBox(height: 15),

          Text(
            'كلمة السر',
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
          ),
          PasswordTextFieldWidget(),
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
