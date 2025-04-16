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
    return Obx(() {
      switch (statusRequest.value) {
        case StatusRequest.loading:
          return Lottie.asset('assets/animation/loading.json', height: height);
        case StatusRequest.success:
          return widget;
        case StatusRequest.serverFailure:
          return Text('dddd');
        case StatusRequest.offline:
          return Center(child: Text('Error loading data'));
        default:
          return const Text('dddd');
      }
    });
  }
}
