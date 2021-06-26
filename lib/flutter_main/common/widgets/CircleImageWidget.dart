import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/skeleton.dart';

class CircleImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final String placeholder;
  final String url;
  final Color borderColor;
  final Color backgroundColor;
  final double borderWidth;
  final File imageFile;
  final IconData icon;
  final BoxFit fit;
  final enableBorders;

  const CircleImageWidget({
    Key key,
    this.width = 65,
    this.height = 65,
    this.placeholder = "assets/img_profile.jpeg",
    @required this.url,
    this.radius = 65 / 2,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 4,
    this.imageFile,
    this.icon,
    this.fit = BoxFit.cover,
    this.enableBorders = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: enableBorders
            ? Border.all(
                color: borderColor,
                width: borderWidth,
              )
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: imageFile == null && icon == null
            ? CachedNetworkImage(
          imageUrl: url,
                placeholder: (context, url) => Skeleton(),
                imageBuilder: (ctx, imageProvider) => Image(
                  image: imageProvider,
                  fit: fit,
                ),
              )
            : icon != null
                ? Icon(
                    icon,
                    size: 18,
                    color: Color(0xff4fd5dc),
                  )
                : Image.file(imageFile, fit: fit),
      ),
    );
  }
}
