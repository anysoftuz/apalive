import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppImages {
  static const beck = 'assets/images/beck.png';
  static const facebook = 'assets/images/facebook.png';
  static const gerb = 'assets/images/gerb.png';
  static const instagram = 'assets/images/instagram.png';
  static const telegram = 'assets/images/telegram.png';
  static const twitter = 'assets/images/twitter.png';
  static const oneid = 'assets/images/oneid.png';
  static const book = 'assets/images/book.png';
  static const logo = 'assets/images/logo.png';
  static const odam = 'assets/images/odam.png';
}

extension ImgExt on String {
  Image imgAsset({double? width, double? height, BoxFit? fit, Color? color}) {
    return Image.asset(
      this,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }

  Image imgNetwork({double? width, double? height, BoxFit? fit}) {
    return Image.network(this, width: width, height: height, fit: fit);
  }

  Image imgFile({double? width, double? height, BoxFit? fit}) {
    return Image.file(File(this), width: width, height: height, fit: fit);
  }
}
