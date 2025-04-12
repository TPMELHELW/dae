import 'package:dae/core/constants/app_colors.dart';
import 'package:dae/features/muslim/controller/muslims_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LessonLearnedWidget extends StatelessWidget {
  final bool isDaea;
  final int mainIndex;
  const LessonLearnedWidget({
    super.key,
    required this.isDaea,
    required this.mainIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MuslimsController>(
      init: MuslimsController.instance,
      builder:
          (controller) => ListView.builder(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.muslimsData[mainIndex].lessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.black,
                shape: Border.all(color: Colors.black, width: 1.0),
                visualDensity: VisualDensity(vertical: -2),
                leading: Icon(Iconsax.book),
                title: Text(
                  controller.muslimsData[mainIndex].lessons[index].lesson,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                subtitle: Text(
                  controller.muslimsData[mainIndex].lessons[index].time,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing:
                    !isDaea
                        ? SizedBox(
                          width: 96,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Iconsax.edit, size: 18),
                                iconSize: 18,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Iconsax.note_remove, size: 18),
                                iconSize: 18,
                              ),
                            ],
                          ),
                        )
                        : null,
              );
            },
          ),
    );
  }
}



// Container(
//           margin: EdgeInsets.all(10),
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: AppColors.grey),
//           ),
//           child: Row(
//             children: [
//               Icon(Iconsax.book),
//               SizedBox(width: 15),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'حلين يدرس في شريع',
//                     style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: AppColors.kPrimaryColor,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     'اخر تحديث : 2025/2/23',
//                     style: Theme.of(context).textTheme.titleSmall,
//                   ),
//                 ],
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(Iconsax.edit, size: 18),
//                 iconSize: 18,
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(Iconsax.note_remove, size: 18),
//                 iconSize: 18,
//               ),
//             ],
//           ),
//         );