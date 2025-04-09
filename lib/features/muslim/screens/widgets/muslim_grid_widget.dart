import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/components/custom_divider_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/core/routes/app_routes.dart';
import 'package:dae/features/muslim/screens/widgets/active_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MuslimGridWidget extends StatelessWidget {
  const MuslimGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 10),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomDividerWidget(text: 'معلومات المسلم'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'محمد محسن',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ActiveWidget(),
                ],
              ),
              Text(
                'اخر تحديث : 2025/2/23',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 20),

              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.dark),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  spacing: 5,
                  children: [Icon(Iconsax.book), Text('حلين يدرس في شريع')],
                ),
              ),
              SizedBox(height: 20),
              ButtonWidget(
                text: 'عرض الحساب',
                onPress:
                    () => Get.toNamed(AppRoutes.showAccount, arguments: true),
              ),
            ],
          ),
        );
      },
    );
  }
}
