import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech_task/_lib.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? height;
  final double? radius;
  final double? width;
  final bool? active;
  final Color? textColor;
  final Color? borderColor;
  final Color? fillColor;
  final String? text;
  final double? padding;
  final bool? useRow;

  const CustomButton(
      {Key? key,
      this.onPressed,
      this.height,
      this.radius = 5,
      this.width,
      this.textColor,
      this.useRow = false,
      this.active = true,
      this.borderColor = AppColors.primaryColor,
      this.fillColor = AppColors.primaryColor,
      required this.text,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            width: width ?? screenWidth,
            height: height ?? 52,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius!),
                color: active! ? fillColor : AppColors.grey,
                border: Border.all(
                    color: active! ? borderColor! : AppColors.grey,
                    width: 1.5)),
            child: useRow!
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: active!
                                      ? textColor ?? AppColors.darkGrey
                                      : AppColors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          FontAwesomeIcons.chevronDown,
                          size: 15,
                          color: textColor ?? AppColors.darkGrey,
                        )
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                    text!,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: active!
                            ? textColor ?? AppColors.darkGrey
                            : AppColors.white,
                        fontWeight: FontWeight.bold),
                  ))));
  }
}
