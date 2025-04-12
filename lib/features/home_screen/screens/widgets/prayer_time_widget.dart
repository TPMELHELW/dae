import 'package:dae/core/components/handle_loading_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/features/home_screen/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController.instance;
    return Obx(
      () => HandleLoadingWidget(
        statusRequest: controller.statusRequest,
        height: 150,
        widget:
            controller.prayerTimes.value == null
                ? const Center(child: Text('جاري تحميل البيانات...'))
                : Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.light,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                controller.prayerTimes.value!.hijri.day,
                                style: Theme.of(
                                  context,
                                ).textTheme.titleLarge!.copyWith(
                                  fontSize: 60,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                              Text(
                                '${controller.prayerTimes.value!.hijri.monthName} , ${controller.prayerTimes.value!.hijri.year}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 80,
                            child: VerticalDivider(
                              color: AppColors.dark,
                              thickness: 2,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'باقي على ${controller.nextPrayerInfo['name'] ?? 'الصلاة القادمة'}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                controller.remainingTime,
                                style: Theme.of(
                                  context,
                                ).textTheme.titleLarge!.copyWith(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(iconColor: AppColors.grey),
                        label: Text(
                          'عرض المواعيد',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(color: AppColors.grey),
                        ),
                        icon: const Icon(CupertinoIcons.arrow_turn_down_right),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
