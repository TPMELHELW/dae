import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/components/custom_divider_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/features/home_screen/models/new_muslim_model.dart';
import 'package:dae/features/muslim/controller/muslims_controller.dart';
import 'package:dae/features/muslim/screens/widgets/lesson_learned_widget.dart';
import 'package:dae/features/muslim/screens/widgets/show_add_progress_dialog.dart';
import 'package:dae/features/muslim/screens/widgets/show_edit_dialog.dart';
import 'package:flutter/material.dart';

class ShowAccountScreen extends StatelessWidget {
  final bool isDaea;
  final NewMuslimModel muslimData;
  final int index;
  const ShowAccountScreen({
    super.key,
    this.isDaea = true,
    required this.muslimData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final MuslimsController controller = MuslimsController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('عودة', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.light,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomDividerWidget(text: 'معلومات المسلم'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      muslimData.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    // ActiveWidget(isActive: null,),
                  ],
                ),
                LessonLearnedWidget(isDaea: isDaea, mainIndex: index),
                ButtonWidget(
                  text: 'تعديل الحساب',
                  onPress: () {
                    // controller.homeController.formState.currentState.;
                    controller.setValues(muslimData);
                    showEditDialog(muslimData);
                  },
                ),
                SizedBox(height: 15),
                !isDaea
                    ? ButtonWidget(
                      text: 'اضافة تقدم',
                      onPress:
                          () =>
                              showAddProgressDialog(muslimData.id!, controller),
                    )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
