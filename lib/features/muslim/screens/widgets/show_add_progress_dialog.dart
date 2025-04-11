import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/components/item_input_widget.dart';
import 'package:dae/features/home_screen/screens/widgets/normal_input_widget.dart';
import 'package:dae/features/muslim/controller/muslims_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAddProgressDialog(String docId, MuslimsController controller) {
  final MuslimsController controller = MuslimsController.instance;
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
                    items: controller.levelItems,
                    value: controller.level,
                    onChange: (value) {
                      controller.level = value!;
                    },
                  ),
                  // SizedBox(width: 10),
                  ItemInputWidget(
                    text: 'الحال',
                    items: controller.statusItems,
                    value: controller.status,
                    onChange: (value) {
                      controller.status = value!;
                    },
                  ),
                ],
              ),
              // SizedBox(height: 20),
              Row(
                children: [
                  ItemInputWidget(
                    text: 'الفتر المقدر لي الدرس',
                    items: controller.periodItems,
                    value: controller.period,
                    onChange: (value) {
                      controller.period = value!;
                    },
                  ),
                ],
              ),

              // SizedBox(height: 20),
              Row(
                children: [
                  NormalInputWidget(
                    text: 'اسم الدرس',
                    controller: controller.lesson,
                  ),
                ],
              ),
              ButtonWidget(
                text: 'حفظ',
                statusRequest: controller.statusRequest,
                onPress: () => controller.saveLesson(docId),
              ),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ),
  );
}
