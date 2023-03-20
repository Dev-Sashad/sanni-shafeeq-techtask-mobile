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
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: CustomText(
              data.title!,
              textType: TextType.mediumText,
              color: AppColors.textColor,
            ),
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
                  alignment: Alignment.center,
                  padding: pad(both: 5),
                  child: CustomText(
                    "view recipes",
                    textType: TextType.smallestText,
                    color: AppColors.black,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.white,
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
