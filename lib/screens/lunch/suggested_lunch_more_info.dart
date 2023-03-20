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
          topPadding: 20,
          title: data.title ?? "",
          child: CustomScrollWidget(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  VerticalSpace(20),
                  ...data.ingredients!
                      .map((e) => Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: AppColors.primaryColor,
                                ),
                                HorizontalSpace(20),
                                CustomText(
                                  e,
                                  textType: TextType.largeText,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ))
                      .toList()
                ],
              ),
            ),
          )),
    );
  }
}
