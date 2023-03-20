import 'package:flutter/material.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/core/model/recipes_model.dart';

class ViewMoreInfo extends ConsumerWidget {
  final RecipesModel data;
  const ViewMoreInfo({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return DialogCustomContainer(
      child: BaseScaffold(
          backgroundColor: Colors.transparent,
          useRowAppBar: false,
          showLeading: false,
          showSubTitle: false,
          onPop: () => Navigator.of(context).pop(),
          title: data.title ?? "",
          child: CustomScrollWidget(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  ...data.ingredients!
                      .map((e) => Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: AppColors.primaryColor,
                              ),
                              HorizontalSpace(20),
                              CustomText(
                                e,
                                textType: TextType.mediumText,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ))
                      .toList()
                ],
              ),
            ),
          )),
    );
  }
}
