import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/components/custom_divider_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/features/muslim/screens/widgets/active_widget.dart';
import 'package:flutter/material.dart';

class MoalemWidget extends StatelessWidget {
  const MoalemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: MediaQuery.of(context).size.height * 0.30,
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
                  // ActiveWidget(),
                ],
              ),
              Text(
                'اخر تحديث : 2025/2/23',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('الجنس: ذكر'), Text('السن: 20')],
              ),
              SizedBox(height: 15),

              // ActiveWidget(text: 'غير متابع'),
              SizedBox(height: 15),
              ButtonWidget(text: 'اضافة المسلم'),
            ],
          ),
        );
      },
    );
  }
}
