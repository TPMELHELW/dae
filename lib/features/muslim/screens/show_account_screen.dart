import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/components/custom_divider_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/features/muslim/screens/widgets/active_widget.dart';
import 'package:dae/features/muslim/screens/widgets/lesson_learned_widget.dart';
import 'package:dae/features/muslim/screens/widgets/show_add_progress_dialog.dart';
import 'package:dae/features/muslim/screens/widgets/show_edit_dialog.dart';
import 'package:flutter/material.dart';

class ShowAccountScreen extends StatelessWidget {
  final bool isDaea;
  const ShowAccountScreen({super.key, this.isDaea = true});

  @override
  Widget build(BuildContext context) {
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
                      'محمد محسن',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ActiveWidget(),
                  ],
                ),
                LessonLearnedWidget(isDaea: isDaea),
                ButtonWidget(
                  text: 'تعديل الحساب',
                  onPress: () => showEditDialog(),
                ),
                SizedBox(height: 15),
                isDaea
                    ? ButtonWidget(
                      text: 'اضافة تقدم',
                      onPress: () => showAddProgressDialog(),
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
