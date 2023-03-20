import 'package:flutter/material.dart';
import 'package:tech_task/_lib.dart';

class RefreshWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final String? imgUrl;
  const RefreshWidget({Key? key, this.onPressed, this.text, this.imgUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalSpace(20),
            imgUrl != null
                ? AssetsImage(imgUrl: imgUrl!, height: 100, width: 100)
                : const Icon(
                    Icons.wifi_off_sharp,
                    size: 50.0,
                    color: Colors.black26,
                  ),
            Text(
              text ?? "Oops, something went wrong. Try again!!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black38,
              ),
            ),
            VerticalSpace(20),
            CustomButton(width: eqW(250), text: "Refresh", onPressed: onPressed)
          ],
        ));
  }
}
