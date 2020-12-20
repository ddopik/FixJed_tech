import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';

import '../../../skeleton.dart';


enum kSize { small, medium, large }

class CustomImageLoader {
 static Widget image({
    String url,
    kSize size,
    double width,
    double height,
    BoxFit fit,
    String tag,
    double offset = 0.0,
    bool isResize = false,
    isVideo = false,
    hidePlaceHolder = false,
  }) {
    if (height == null && width == null) {
      width = 200;
    }

    if (url == null || url == '') {
      return Skeleton(
        width: width,
        height: height ?? width * 1.2,
      );
    }

    if (isVideo) {
      return Stack(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(color: Colors.black12.withOpacity(1)),
            child: ExtendedImage.network(
              url,
              width: width,
              height: height ?? width * 1.2,
              fit: fit,
              cache: true,
              enableLoadState: false,
              alignment: Alignment(
                  (offset >= -1 && offset <= 1)
                      ? offset
                      : (offset > 0)
                          ? 1.0
                          : -1.0,
                  0.0),
            ),
          ),
          Positioned.fill(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white70.withOpacity(0.5),
              size: width == null ? 30 : width / 1.7,
            ),
          ),
        ],
      );
    }



    return ExtendedImage.network(
      url,
      width: width,
      height: height,
      fit: fit,
      cache: true,
      enableLoadState: false,
      alignment: Alignment(
        (offset >= -1 && offset <= 1)
            ? offset
            : (offset > 0)
                ? 1.0
                : -1.0,
        0.0,
      ),
      loadStateChanged: (ExtendedImageState state) {
        Widget widget;
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            widget = hidePlaceHolder
                ? const SizedBox()
                : Skeleton(
                    width: width ?? 100,
                    height: height ?? 140,
                  );
            break;
          case LoadState.completed:
            widget = ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              width: width,
              height: height,
              fit: fit,
            );
            break;
          case LoadState.failed:
            widget = Container(
              width: width,
              height: height ?? width * 1.2,
              color: kEmptyColor,
            );
            break;
        }
        return widget;
      },
    );
  }
}
