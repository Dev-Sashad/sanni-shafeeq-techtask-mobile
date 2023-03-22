import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/utils/constants/app_images.dart';
import 'package:tech_task/utils/mixins/ui_tool_mixin.dart';

class HomeScreen extends ConsumerWidget with UIToolMixin {
  final int crossAxisCount = 2;
  @override
  Widget build(BuildContext context, ref) {
    final vm = ref.watch(homeVm);
    final items = ref.watch(queryIngredients.state).state;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndDocked,
          floatingActionButton: vm.homestate.isDone && vm.ingredients.isNotEmpty
              ? InkWell(
                  onTap: items.isEmpty
                      ? () => showErrorToast('select an item')
                      : () async {
                          final response = await vm.suggestLunch();
                          if (response) {
                            navigationService
                                .navigateTo(suggestedLunchScreenRoute);
                          }
                        },
                  child: Container(
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    padding: pad(both: 10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 3, color: Colors.black12)
                        ],
                        color: items.isEmpty
                            ? AppColors.grey
                            : AppColors.primaryColor,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30),
                        )),
                    child: CustomText(
                      AppStrings.suggestLunchButtonText,
                      color:
                          items.isEmpty ? AppColors.darkGrey : AppColors.white,
                    ),
                  ),
                )
              : null,
          body: SafeArea(
            bottom: false,
            child: RefreshIndicator(
              onRefresh: () async => vm.getIngredients(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(20),
                    RichText(
                        text: TextSpan(
                            text: "Hi!, ",
                            style: Theme.of(context).textTheme.bodyLarge,
                            children: [
                          TextSpan(
                            text: vm.greeting,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          )
                        ])),
                    VerticalSpace(20),
                    const CustomText(
                      AppStrings.lunchQuestion,
                      textType: TextType.smallText,
                      fontWeight: FontWeight.w600,
                    ),
                    VerticalSpace(5),
                    Container(
                      width: screenWidth,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 1.5),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            vm.lunchValue,
                            textType: TextType.smallText,
                            fontWeight: FontWeight.w600,
                          ),
                          InkWell(
                            onTap: () async {
                              customTimePicker(
                                  minTime: DateTime.now(),
                                  context: context,
                                  onConfirmed: (t) {
                                    if (t != null) {
                                      vm.setLunchDate(t);
                                    }
                                  });
                            },
                            child: Icon(
                              Icons.calendar_today_outlined,
                              color: AppColors.primaryColor,
                              size: 20.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    VerticalSpace(20),
                    Builder(builder: (c) {
                      if (vm.homestate.isIdle) {
                        return SizedBox(
                          height: screenHeight * 0.5,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AssetsImage(
                                  imgUrl: AppImages.happyEmoji,
                                  height: 100,
                                  width: 100,
                                ),
                                VerticalSpace(10),
                                CustomText(
                                  AppStrings.fridgeQuestion,
                                  textType: TextType.smallText,
                                  fontWeight: FontWeight.w600,
                                ),
                                VerticalSpace(10),
                                CustomButton(
                                    onPressed: () => vm.getIngredients(),
                                    width: 200,
                                    text: "Open My Fridge")
                              ],
                            ),
                          ),
                        );
                      } else if (vm.homestate.isLoading) {
                        return Expanded(
                          flex: 1,
                          child: CustomScrollWidget(
                              child: AnimationLimiter(
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              children: List.generate(
                                6,
                                (int index) {
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    columnCount: crossAxisCount,
                                    child: const ScaleAnimation(
                                      child: FadeInAnimation(
                                        child: LoaderWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )),
                        );
                      } else if (vm.homestate.isDone) {
                        if (vm.ingredients.isEmpty) {
                          return SizedBox(
                            height: screenHeight * 0.5,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AssetsImage(
                                    imgUrl: AppImages.sadEmoji,
                                    height: 100,
                                    width: 100,
                                  ),
                                  VerticalSpace(10),
                                  CustomText(
                                    AppStrings.noItemInFridgeMessage,
                                    textType: TextType.smallText,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  VerticalSpace(10),
                                  CustomButton(
                                    width: 200,
                                    text: "Refresh",
                                    onPressed: () => vm.getIngredients(),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Expanded(
                              flex: 1,
                              child: CustomScrollWidget(
                                child: Column(
                                  children: [
                                    AnimationLimiter(
                                      child: GridView.builder(
                                        itemCount: vm.ingredients.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            left: 10,
                                            right: 10,
                                            bottom: 10),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                // childAspectRatio: 1,
                                                mainAxisSpacing: 20,
                                                crossAxisSpacing: 20,
                                                crossAxisCount: crossAxisCount),
                                        itemBuilder:
                                            (BuildContext context, int i) {
                                          return AnimationConfiguration
                                              .staggeredGrid(
                                                  position: i,
                                                  duration: const Duration(
                                                      milliseconds: 375),
                                                  columnCount: crossAxisCount,
                                                  child: SlideAnimation(
                                                      child: FadeInAnimation(
                                                    child:
                                                        CustomIngredientsCard(
                                                      data: vm.ingredients[i],
                                                      lunchDate: vm.lunchDate,
                                                      onTap: () =>
                                                          vm.addtoQueryList(vm
                                                              .ingredients[i]
                                                              .title!),
                                                      isSelected:
                                                          items.contains(vm
                                                              .ingredients[i]
                                                              .title),
                                                    ),
                                                  )));
                                        },
                                      ),
                                    ),
                                    VerticalSpace(50)
                                  ],
                                ),
                              ));
                        }
                      } else {
                        return SizedBox(
                          height: screenHeight * 0.5,
                          child: Center(
                            child: RefreshWidget(
                                imgUrl: AppImages.sadEmoji,
                                text: vm.errorMessage,
                                onPressed: () => vm.getIngredients()),
                          ),
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
