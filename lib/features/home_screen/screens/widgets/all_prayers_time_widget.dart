import 'package:dae/features/home_screen/controller/home_controller.dart';
import 'package:dae/features/home_screen/screens/widgets/one_prayer_widget.dart';
import 'package:flutter/cupertino.dart';

class AllPrayersTimeWidget extends StatelessWidget {
  final HomeController controller;
  const AllPrayersTimeWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OnePrayerWidget(
                icon: 'assets/icons/alfajr.svg',
                name: 'الفجر',
                time: controller.prayerTimes.value!.fajr,
              ),
              OnePrayerWidget(
                icon: 'assets/icons/elshrouq.svg',
                name: 'الشروق',
                time: controller.prayerTimes.value!.sunrise,
              ),
              OnePrayerWidget(
                icon: 'assets/icons/alduhr.svg',
                name: 'الضهر',
                time: controller.prayerTimes.value!.dhuhr,
              ),
              OnePrayerWidget(
                icon: 'assets/icons/alasr.svg',
                name: 'العصر',
                time: controller.prayerTimes.value!.asr,
              ),
              OnePrayerWidget(
                icon: 'assets/icons/maghrip.svg',
                name: 'المغرب',
                time: controller.prayerTimes.value!.maghrib,
              ),
              OnePrayerWidget(
                icon: 'assets/icons/alisha.svg',
                name: 'العشاء',
                time: controller.prayerTimes.value!.isha,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
