import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../_lib.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool useRowAppBar;
  final String? bckImage;
  final bool showTitle;
  final bool showTrailing;
  final bool showLeading;
  final bool showDivider;
  final bool enableScroll;
  final double topPadding;
  final double dialogTopPadding;
  final double rowStyleTopPadding;
  final double showSubTitleSpacing;
  final bool showSubTitle;
  final Widget child;
  final Widget? suffixIcon;
  final void Function()? onMenuPressed;
  final Color? backgroundColor;

  BaseScaffold(
      {this.title = "",
      this.subTitle = "",
      this.useRowAppBar = true,
      this.bckImage,
      this.topPadding = 60,
      this.showSubTitleSpacing = 30,
      this.dialogTopPadding = 20,
      this.rowStyleTopPadding = 100,
      this.showSubTitle = true,
      this.showTitle = true,
      this.showLeading = true,
      this.showTrailing = true,
      this.enableScroll = true,
      this.showDivider = false,
      required this.child,
      this.suffixIcon,
      this.onMenuPressed,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? AppColors.white,
      child: Stack(
        children: [
          bckImage != null
              ? Container(
                  height: eqH(331),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(bckImage!), fit: BoxFit.fitWidth)),
                )
              : Container(),
          useRowAppBar
              ? Container(
                  margin: EdgeInsets.only(top: rowStyleTopPadding),
                  color: AppColors.white,
                )
              : SizedBox(),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: eqW(14),
                    right: eqW(20),
                    top: eqH(useRowAppBar ? topPadding : dialogTopPadding)),
                child: useRowAppBar
                    ? _appBar(
                        title: title,
                        showTitle: showTitle,
                        onPop: () => Navigator.pop(context),
                        showLeading: showLeading,
                        showTrailing: showTrailing,
                        suffixIcon: suffixIcon,
                        onMenuPressed: onMenuPressed)
                    : _cancleAppBar(
                        onPop: () => Navigator.pop(context),
                        title: title,
                        subTitle: subTitle,
                        showDivider: showDivider,
                        showSubTitle: showSubTitle,
                        showTitle: showTitle),
              ),
              showSubTitle
                  ? VerticalSpace(showSubTitleSpacing)
                  : VerticalSpace(0),
              Expanded(child: child)
            ],
          ),
        ],
      ),
    );
  }
}

Widget _appBar(
    {String title = "",
    void Function()? onMenuPressed,
    void Function()? onPop,
    Widget? suffixIcon,
    bool showTitle = true,
    bool showLeading = true,
    bool showTrailing = true}) {
  return Container(
      child: Row(
    mainAxisAlignment:
        showLeading ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
    children: [
      showLeading
          ? BackButton(
              onPressed: onPop,
              color: AppColors.textColor,
            )
          : HorizontalSpace(20),
      showTitle
          ? CustomText(
              title,
              color: AppColors.textColor,
              textType: TextType.bigText,
              fontWeight: FontWeight.w600,
            )
          : HorizontalSpace(eqW(20)),
      showTrailing
          ? suffixIcon ?? InkWell(onTap: onMenuPressed, child: Icon(Icons.more))
          : HorizontalSpace(eqW(20)),
    ],
  ));
}

Widget _cancleAppBar(
    {String? title,
    void Function()? onPop,
    String? subTitle,
    bool showTitle = true,
    bool showSubTitle = true,
    bool showDivider = false}) {
  return Container(
    padding: EdgeInsets.only(left: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.topRight,
            child: InkWell(
                onTap: onPop,
                child: Icon(
                  Icons.close,
                  size: 30.sp,
                  color: Theme.of(context).colorScheme.primary,
                ))),
        VerticalSpace(eqH(48)),
        showTitle
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title ?? "",
                    color: AppColors.textColor,
                    textType: TextType.bigText,
                    fontWeight: FontWeight.w600,
                  ),
                  showSubTitle ? VerticalSpace(eqH(8)) : VerticalSpace(0),
                  showSubTitle
                      ? Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Wrap(
                            children: [
                              CustomText(
                                subTitle ?? "",
                                maxLines: 3,
                                color: AppColors.textColor,
                                textType: TextType.smallText,
                              ),
                            ],
                          ),
                        )
                      : VerticalSpace(0),
                  showDivider
                      ? Column(
                          children: [
                            VerticalSpace(5),
                            Divider(
                              color: AppColors.textFieldBorder,
                            ),
                          ],
                        )
                      : VerticalSpace(0)
                ],
              )
            : Container(),
      ],
    ),
  );
}
