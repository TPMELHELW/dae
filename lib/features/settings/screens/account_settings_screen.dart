import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/components/custom_divider_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/features/settings/controller/account_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountSettingsController controller = Get.put(
      AccountSettingsController(),
    );
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.light,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomDividerWidget(text: 'معلومات المستخدم'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.navigationController.userData.value!.userName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // ActiveWidget(),
                ],
              ),
              ButtonWidget(
                text: 'تعديل الحساب',
                onPress: () {
                  print(
                    controller.navigationController.userData.value!.muslims,
                  );
                },
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  spacing: 20,
                  children: [
                    Icon(Iconsax.user),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('عدد المسلمين الدي ادخلتهم'),
                        Obx(
                          () => Text(
                            controller
                                .navigationController
                                .userData
                                .value!
                                .numberOfMuslims
                                .toString(),
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge!.copyWith(
                              color: AppColors.kPrimaryColor,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ButtonWidget(
                text: 'تسجيل الخروج',
                statusRequest: controller.statusRequest,
                onPress: () => controller.signOut(),
              ),
              // ListTile(
              //   onTap: () {
              //     Get.dialog(
              //       Dialog(
              //         insetPadding: EdgeInsets.symmetric(
              //           horizontal: 20,
              //           vertical: 40,
              //         ),

              //         child: ConstrainedBox(
              //           constraints: BoxConstraints(
              //             minWidth: Get.width * 0.8,
              //             maxWidth: Get.width * 0.9,
              //           ),

              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Text(
              //                 'Mahmoud Elhelw',
              //                 style: Theme.of(
              //                   context,
              //                 ).textTheme.headlineLarge!.copyWith(
              //                   color: AppColors.dark,
              //                   fontSize: 30,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              //   leading: Icon(Iconsax.profile_2user),
              //   title: Text('Developers Information'),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
