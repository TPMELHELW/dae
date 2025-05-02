import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/components/normal_text_field_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/core/components/item_input_widget.dart';
import 'package:dae/core/validation/input_validation.dart';
import 'package:dae/features/home_screen/controller/home_controller.dart';
import 'package:dae/features/home_screen/models/new_muslim_model.dart';
import 'package:dae/features/home_screen/screens/widgets/normal_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaeahWidget extends StatelessWidget {
  final bool isEdit;
  final NewMuslimModel? muslimData;
  const DaeahWidget({super.key, this.isEdit = false, this.muslimData});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.light,

        borderRadius: BorderRadius.circular(15),
      ),
      child: Form(
        key: isEdit ? controller.editFormState : controller.formState,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            !isEdit
                ? Row(
                  children: [
                    SizedBox(
                      height: 25,
                      child: VerticalDivider(
                        thickness: 2,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                    Text(
                      'ادخل مسلم',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(fontSize: 18),
                    ),
                  ],
                )
                : SizedBox(),
            Row(
              spacing: 7,
              children: [
                ItemInputWidget(
                  text: 'الجنس',
                  items: controller.genderItems,
                  value: isEdit ? muslimData!.gender : controller.gender,
                  onChange: (value) {
                    controller.gender = value!;
                  },
                ),
                ItemInputWidget(
                  text: 'الدول',
                  items: controller.countryItems,
                  value: isEdit ? muslimData!.country : controller.country,
                  onChange: (value) {
                    controller.country = value!;
                  },
                ),
              ],
            ),
            Row(
              spacing: 7,
              children: [
                NormalInputWidget(
                  text: 'الاسم',
                  controller: controller.name,
                  validator:
                      (value) => AppFieldValidator.validateEmpty(value, 'Name'),
                ),
                NormalInputWidget(
                  text: 'السن',
                  textType: TextInputType.number,
                  validator:
                      (value) => AppFieldValidator.validateEmpty(value, 'Age'),

                  controller: controller.age,
                ),

                ItemInputWidget(
                  text: 'الفتره',
                  items: controller.periodItems,
                  value: controller.period,
                  onChange: (value) {
                    controller.period = value!;
                  },
                ),
              ],
            ),
            Row(
              spacing: 7,
              children: [
                NormalInputWidget(
                  validator:
                      (value) =>
                          AppFieldValidator.validateEmpty(value, 'Number'),
                  text: 'الرقم',
                  textType: TextInputType.number,
                  controller: controller.number,
                ),
                NormalInputWidget(
                  validator: (value) => AppFieldValidator.validateEmail(value),

                  text: 'الايميل',
                  textType: TextInputType.emailAddress,
                  controller: controller.email,
                ),
              ],
            ),
            Row(
              spacing: 7,
              children: [
                NormalInputWidget(
                  text: 'اللغه الاساسيه',
                  controller: controller.primaryLang,
                  validator:
                      (value) => AppFieldValidator.validateEmpty(
                        value,
                        'Primary Language',
                      ),
                ),
                ItemInputWidget(
                  text: 'وسيلة الدعوة',
                  items: controller.wayItems,
                  value: controller.way.value,
                  onChange: (value) {
                    controller.way.value = value!;
                  },
                ),
                Obx(
                  () => ItemInputWidget(
                    text: 'Page',
                    items: ['Page 1', 'Page 2'],
                    value: 'Page 1',
                    onChange:
                        controller.way.value == controller.wayItems[0]
                            ? null
                            : (value) {},
                  ),
                ),
              ],
            ),
            Row(
              spacing: 7,
              children: [
                ItemInputWidget(
                  text: 'الدين السابق',
                  items: controller.previousReligionItems,
                  value: controller.previousReligion,
                  onChange: (value) {
                    controller.previousReligion = value!;
                  },
                ),
                ItemInputWidget(
                  text: 'نوع المسلم',
                  items: controller.typeOfMuslimItems,
                  value: controller.typeOfMuslim,
                  onChange: (value) {
                    controller.typeOfMuslim = value!;
                  },
                ),
              ],
            ),
            Text('نبد عنه و ملاحظات', textAlign: TextAlign.right),
            NormalTextFieldWidget(
              text: 'اكتب نبد عنه المسلم.....',
              controller: controller.notes,
            ),
            ButtonWidget(
              text: 'إدخال',
              statusRequest: controller.statusRequest,
              onPress:
                  () async =>
                      isEdit
                          ? await controller.editMuslimInf(muslimData!.id)
                          : await controller.enterNewMuslim(),
            ),
          ],
        ),
      ),
    );
  }
}
