import 'package:dae/features/home_screen/screens/widgets/daeah_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showEditDialog() {
  return Get.dialog(
    Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: Get.width * 0.8,
          maxWidth: Get.width * 0.9,
        ),
        child: DaeahWidget(),
      ),
    ),
  );
}
