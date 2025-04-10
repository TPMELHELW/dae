import 'package:dae/core/components/normal_text_field_widget.dart';
import 'package:flutter/material.dart';

class NormalInputWidget extends StatelessWidget {
  final String text;
  final TextInputType? textType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const NormalInputWidget({
    super.key,
    required this.text,
    this.textType = TextInputType.name,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 7,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: Theme.of(context).textTheme.bodyLarge),
          NormalTextFieldWidget(
            controller: controller,
            validator: validator,
            text: text,
            contentPadding: 10,
            textType: textType,
          ),
        ],
      ),
    );
  }
}
