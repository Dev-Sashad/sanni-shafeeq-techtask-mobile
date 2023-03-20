import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech_task/_lib.dart';
import 'package:tech_task/screens/lunch/widgets/custom_lunch_tile.dart';
import 'package:tech_task/utils/mixins/ui_tool_mixin.dart';

class CarScreen extends ConsumerWidget with UIToolMixin {
  @override
  Widget build(BuildContext context, ref) {
    final vm = ref.watch(queryresult.state).state;
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollWidget(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(20),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => navigationService.pop(),
                          child: const Icon(
                            FontAwesomeIcons.chevronLeft,
                            size: 20,
                            color: AppColors.black,
                          ),
                        ),
                        HorizontalSpace(40),
                        CustomText(
                          'Suggested Lunch',
                          textType: TextType.bigText,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    VerticalSpace(eqH(20)),
                    Expanded(
                      child: Container(
                          height: screenHeight * 0.7,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: AnimationLimiter(
                              child: Column(
                                children:
                                    AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 700),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: widget,
                                    ),
                                  ),
                                  children: [
                                    ...vm
                                        .map((e) => LunchTile(
                                              data: e,
                                            ))
                                        .toList(),
                                    VerticalSpace(eqH(50))
                                  ],
                                ),
                              ),
                            ),
                          )),
                    )
                  ]),
            ),
          ),
        ));
  }
}
