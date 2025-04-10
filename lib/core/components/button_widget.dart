import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/core/constants/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPress;
  final String text;
  final Rx<StatusRequest>? statusRequest;
  const ButtonWidget({
    super.key,
    required this.text,
    this.onPress,
    this.statusRequest,
  });

  @override
  Widget build(BuildContext context) {
    final Rx<StatusRequest> currentStatus =
        statusRequest ?? StatusRequest.init.obs;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(400, 48),
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPress,
      child: Obx(
        () =>
            currentStatus == StatusRequest.loading.obs
                ? Lottie.asset('assets/animation/loading.json', height: 50)
                : Text(
                  text,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: Colors.white),
                ),
      ),
    );
  }
}
