import 'package:dae/core/components/custom_divider_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/features/muslim/screens/widgets/muslim_grid_widget.dart';
import 'package:flutter/material.dart';

class MuslimScreen extends StatelessWidget {
  const MuslimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(MuslimsController());
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 15),

      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.circular(15),
          ),
          child: CustomDividerWidget(text: 'المسلمين'),
        ),
        SizedBox(height: 20),
        MuslimGridWidget(),
      ],
    );
  }
}
