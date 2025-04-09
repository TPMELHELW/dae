import 'package:dae/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LessonLearnedWidget extends StatelessWidget {
  const LessonLearnedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.grey),
          ),
          child: Row(
            children: [
              Icon(Iconsax.book),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'حلين يدرس في شريع',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'اخر تحديث : 2025/2/23',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
