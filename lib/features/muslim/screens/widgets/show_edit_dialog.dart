import 'package:dae/features/home_screen/screens/widgets/daeah_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

showEditDialog() {
  return Get.defaultDialog(
    title: '',
    content: DaeahWidget(isEdit: true),
    contentPadding: EdgeInsets.all(0),
  );
}
