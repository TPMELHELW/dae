import 'package:dae/core/components/button_widget.dart';
import 'package:dae/core/components/normal_text_field_widget.dart';
import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/features/home_screen/screens/widgets/item_input_widget.dart';
import 'package:dae/features/home_screen/screens/widgets/normal_input_widget.dart';
import 'package:flutter/material.dart';

class DaeahWidget extends StatelessWidget {
  final bool isEdit;
  const DaeahWidget({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.light,

        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
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
                items: ['ّذكر', 'أنثي'],
                value: 'أنثي',
              ),
              ItemInputWidget(
                text: 'الدول',
                items: ["مصر", "تركيا"],
                value: 'مصر',
              ),
            ],
          ),
          Row(
            spacing: 7,
            children: [
              NormalInputWidget(text: 'الاسم'),
              NormalInputWidget(text: 'السن', textType: TextInputType.number),

              ItemInputWidget(
                text: 'الفتره',
                items: ["شهر", "اقل من شهر"],
                value: 'شهر',
              ),
            ],
          ),
          Row(
            spacing: 7,
            children: [
              NormalInputWidget(text: 'الرقم', textType: TextInputType.number),
              NormalInputWidget(
                text: 'الايميل',
                textType: TextInputType.emailAddress,
              ),
            ],
          ),
          Row(
            spacing: 7,
            children: [
              NormalInputWidget(
                text: 'اللغه الاساسيه',
                textType: TextInputType.number,
              ),
              ItemInputWidget(
                text: 'وسيلة الدعوة',
                items: ['دعوة ذاتية', 'Islam Port', 'Islam Connect'],
                value: 'دعوة ذاتية',
              ),
              ItemInputWidget(
                text: 'Page',
                items: ['Page 1', 'Page 2'],
                value: 'Page 1',
              ),
            ],
          ),
          Row(
            spacing: 7,
            children: [
              ItemInputWidget(
                text: 'الدين السابق',
                items: ['يهودي', 'مسيحي', "ملحد", "غيره"],
                value: 'مسيحي',
              ),
              ItemInputWidget(
                text: 'نوع المسلم',
                items: ["مسلم عادي", "محب للعلم"],
                value: 'مسلم عادي',
              ),
            ],
          ),
          Text('نبد عنه و ملاحظات', textAlign: TextAlign.right),
          NormalTextFieldWidget(text: 'اكتب نبد عنه المسلم.....'),
          ButtonWidget(text: 'إدخال'),
        ],
      ),
    );
  }
}
