import 'package:dae/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DropdownFieldWidget extends StatelessWidget {
  final double contentPadding;
  final List<String> items;
  final String value;
  final void Function(String?)? onChange;
  const DropdownFieldWidget({
    super.key,
    required this.contentPadding,
    required this.items,
    required this.value,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,

      alignment: Alignment.center,
      dropdownColor: AppColors.grey,
      borderRadius: BorderRadius.circular(15),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.border),
        ),
      ),

      value: value,
      items:
          items
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(item, textDirection: TextDirection.rtl),
                ),
              )
              .toList(),
      onChanged: onChange,
    );
  }
}
