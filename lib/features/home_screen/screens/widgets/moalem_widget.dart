import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/components/custom_divider_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/core/constants/app_enum.dart';
import 'package:dae/features/home_screen/controller/moalem_controller.dart';
import 'package:dae/features/muslim/screens/widgets/active_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MoalemWidget extends StatelessWidget {
  const MoalemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final HomeController controller
    // final MoalemController controller = Get.put(MoalemController());
    return GetBuilder<MoalemController>(
      init: Get.put(MoalemController()),
      builder: (controller) {
        return controller.statusRequest.value == StatusRequest.loading
            ? Center(child: Lottie.asset('assets/animation/loading.json'))
            : GridView.builder(
              padding: EdgeInsets.only(bottom: 10, top: 10),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.muslimsData.length,
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
                            controller.muslimsData[index].name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          // ActiveWidget(),
                        ],
                      ),
                      Text(
                        'اخر تحديث :${controller.muslimsData[index].lastUpdate}',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'الجنس: ${controller.muslimsData[index].gender}',
                          ),
                          Text('السن: ${controller.muslimsData[index].age}'),
                        ],
                      ),
                      SizedBox(height: 15),

                      ActiveWidget(
                        isActive: controller.muslimsData[index].active,
                      ),
                      SizedBox(height: 15),
                      ButtonWidget(
                        statusRequest: controller.statusRequest,
                        text: 'اضافة المسلم',
                        onPress:
                            () => controller.addMuslimToMoalem(
                              controller.muslimsData[index].id!,
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
