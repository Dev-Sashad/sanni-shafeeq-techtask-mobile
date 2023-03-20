import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double value;
  VerticalSpace(this.value);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  final double value;
  HorizontalSpace(this.value);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value,
    );
  }
}
