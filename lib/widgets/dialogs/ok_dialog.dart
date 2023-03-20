import 'package:flutter/material.dart';
import 'package:tech_task/_lib.dart';

class OkDialog extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? message;
  final String? buttonMsg;
  final Color? iconBorderColor;
  final void Function()? onpressed;
  const OkDialog(this.icon,
      {Key? key,
      this.message,
      this.iconBorderColor = Colors.red,
      this.onpressed,
      this.buttonMsg = "OK",
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SimpleDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: iconBorderColor!)),
                child: Icon(
                  icon,
                  size: 60,
                  color: iconBorderColor,
                ),
              ),
              VerticalSpace(10),
              CustomText(
                title ?? '',
                textType: TextType.largeText,
                fontWeight: FontWeight.bold,
              ),
              VerticalSpace(5),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: message,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              VerticalSpace(10),
              InkWell(
                onTap: onpressed ?? () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 15.0, bottom: 15.0, left: 50.0, right: 50.0),
                  margin: const EdgeInsets.only(top: 40.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).colorScheme.primary),
                  child: Text(buttonMsg!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: "Carmen Sans")),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
