import 'package:flutter/material.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/core/model/recipes_model.dart';

class LunchTile extends StatelessWidget {
  final RecipesModel data;
  LunchTile({required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              CustomText(
                data.title!,
                textType: TextType.mediumText,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
                maxLines: 10,
              ),
            ],
          ),
          VerticalSpace(5),
          InkWell(
            onTap: () {
              slideUpdialogshow(ViewMoreInfo(
                data: data,
              ));
            },
            child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  padding: pad(both: 5),
                  child: CustomText(
                    "view recipes",
                    textType: TextType.smallestText,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10),
                        right: Radius.circular(10),
                      )),
                )),
          )
        ],
      ),
    );
  }
}
