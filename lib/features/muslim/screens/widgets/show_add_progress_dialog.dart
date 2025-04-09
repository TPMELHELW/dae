import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/components/item_input_widget.dart';
import 'package:dae/features/home_screen/screens/widgets/normal_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAddProgressDialog() {
  return Get.dialog(
    Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: Get.width * 0.8,
          maxWidth: Get.width * 0.9,
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                spacing: 10,
                children: [
                  ItemInputWidget(
                    text: 'المستوي',
                    items: ['الاول', "الثاني", "الثالت"],
                    value: 'الاول',
                  ),
                  // SizedBox(width: 10),
                  ItemInputWidget(
                    text: 'الحال',
                    items: ["تاخر", "تقدم"],
                    value: 'تقدم',
                  ),
                ],
              ),
              // SizedBox(height: 20),
              Row(
                children: [
                  ItemInputWidget(
                    text: 'الفتر المقدر لي الدرس',
                    items: ['شهر'],
                    value: 'شهر',
                  ),
                ],
              ),

              // SizedBox(height: 20),
              Row(children: [NormalInputWidget(text: 'اسم الدرس')]),
              ButtonWidget(text: 'حفظ'),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ),
  );
}
