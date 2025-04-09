import 'package:dae/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
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
                    '4',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 60,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  Text(
                    'شعبان , 1446 هجري',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              SizedBox(
                height: 80,
                child: VerticalDivider(color: AppColors.dark, thickness: 2),
              ),
              Column(
                children: [
                  Text(
                    'باقي على صلاة الظهر',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 15),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '11:25',
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge!.copyWith(fontSize: 35),
                        ),
                        TextSpan(text: ' دقيقة'),
                      ],
                    ),
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
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: AppColors.grey),
            ),
            icon: Icon(CupertinoIcons.arrow_turn_down_right),
          ),
        ],
      ),
    );
  }
}
