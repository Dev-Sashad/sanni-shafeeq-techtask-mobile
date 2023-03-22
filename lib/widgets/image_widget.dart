import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssetsImage extends StatelessWidget {
  final String imgUrl;
  final BoxFit fit;
  final BoxShape shape;
  final double height;
  final double width;
  final double opacity;

  const AssetsImage(
      {Key? key,
      required this.imgUrl,
      this.fit = BoxFit.contain,
      this.shape = BoxShape.rectangle,
      this.height = 24,
      this.width = 24,
      this.opacity = 1.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
          image: DecorationImage(
            image: AssetImage(imgUrl),
            fit: fit,
            opacity: opacity,
          ),
        ),
      );
}

class FileImageWidget extends StatelessWidget {
  final File file;
  final BoxFit fit;
  final BoxShape shape;
  final double height;
  final double width;
  const FileImageWidget({
    Key? key,
    required this.file,
    this.fit = BoxFit.contain,
    this.shape = BoxShape.rectangle,
    this.height = 24,
    this.width = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
        ),
        child: Image.file(
          file,
          height: height,
          width: width,
          fit: fit,
        ),
      );
}

class SvgImage extends StatelessWidget {
  final String imgUrl;
  final BoxFit fit;
  final BoxShape shape;
  final double height;
  final double width;
  final Color? color;
  const SvgImage(
      {Key? key,
      required this.imgUrl,
      this.fit = BoxFit.contain,
      this.shape = BoxShape.rectangle,
      this.height = 24,
      this.width = 24,
      this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
        ),
        child: SvgPicture.asset(
          imgUrl,
          fit: fit,
          color: color,
        ),
      );
}
