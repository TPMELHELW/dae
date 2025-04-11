import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/components/custom_divider_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/core/routes/app_routes.dart';
import 'package:dae/features/home_screen/models/new_muslim_model.dart';
import 'package:dae/features/muslim/controller/muslims_controller.dart';
import 'package:dae/features/muslim/screens/widgets/active_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class MuslimGridWidget extends StatelessWidget {
  const MuslimGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MuslimsController controller = MuslimsController.instance;
    return StreamBuilder<List<NewMuslimModel>>(
      stream: controller.getMuslimsData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Lottie.asset('assets/animation/loading.json');
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final data = snapshot.data ?? [];
        // print(data[0].lessons);
        return GridView.builder(
          padding: EdgeInsets.only(bottom: 10),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
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
                        data[index].name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      ActiveWidget(isActive: data[index].active),
                    ],
                  ),
                  Text(
                    'اخر تحديث : ${data[index].lastUpdate}',
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
                      children: [
                        Icon(Iconsax.book),
                        Text(
                          data[index].lessons.isEmpty
                              ? 'لا يوجد دروس'
                              : data[index].lessons.last.lesson.toString(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ButtonWidget(
                    text: 'عرض الحساب',
                    onPress:
                        () => Get.toNamed(
                          AppRoutes.showAccount,
                          arguments: {
                            'isDaea':
                                controller
                                    .navigationController
                                    .userData
                                    .value!
                                    .isDaea,
                            'muslimData': data[index],
                            'index': index,
                          },
                        ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
