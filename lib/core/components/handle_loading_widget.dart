import 'package:dae/core/constants/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HandleLoadingWidget extends StatelessWidget {
  final Rx<StatusRequest> statusRequest;
  final double height;
  final Widget widget;
  const HandleLoadingWidget({
    super.key,
    required this.statusRequest,
    required this.height,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          statusRequest == StatusRequest.loading.obs
              ? Lottie.asset('assets/animation/loading.json', height: height)
              : widget,
    );
  }
}
