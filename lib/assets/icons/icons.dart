import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const archive = 'assets/svg/archive.svg';
  static const beck = 'assets/svg/beck.svg';
  static const bell = 'assets/svg/bell.svg';
  static const bookOpen = 'assets/svg/book-open.svg';
  static const book = 'assets/svg/book.svg';
  static const diploma = 'assets/svg/diploma.svg';
  static const filter = 'assets/svg/filter.svg';
  static const globalEducation = 'assets/svg/global-education.svg';
  static const graduationScroll = 'assets/svg/graduation-scroll.svg';
  static const home = 'assets/svg/home.svg';
  static const knowledge = 'assets/svg/knowledge.svg';
  static const mail = 'assets/svg/mail.svg';
  static const message = 'assets/svg/message.svg';
  static const mortarboardBottom = 'assets/svg/mortarboard_bottom.svg';
  static const mortarboard = 'assets/svg/mortarboard.svg';
  static const phone = 'assets/svg/phone.svg';
  static const search = 'assets/svg/search.svg';
  static const server = 'assets/svg/server.svg';
  static const teaching = 'assets/svg/teaching.svg';
  static const userGroup = 'assets/svg/user-group.svg';
  static const verifiedTick = 'assets/svg/verified_tick.svg';
  static const video = 'assets/svg/video.svg';
  static const oneid = 'assets/svg/oneid.svg';
  static const meetsEmpty = 'assets/svg/meets_empty.svg';
  static const bookedit = 'assets/svg/book-edit.svg';
  static const book1 = 'assets/svg/book1.svg';
  static const books = 'assets/svg/books.svg';
  static const calendarCheck = 'assets/svg/calendar-check.svg';
  static const excel = 'assets/svg/excel.svg';
  static const facebook = 'assets/svg/facebook.svg';
  static const lincedin = 'assets/svg/lincedin.svg';
  static const instagram = 'assets/svg/instagram.svg';
  static const logo = 'assets/svg/logo.svg';
  static const messageChat = 'assets/svg/message-chat-square.svg';
  static const arrowUpRight = 'assets/svg/arrow-up-right.svg';
  static const inbox = 'assets/svg/inbox.svg';
}

extension SvgExt on String {
  SvgPicture svg({Color? color, double? width, double? height}) {
    return SvgPicture.asset(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }

   SvgPicture svgNetwork({Color? color, double? width, double? height}) {
    return SvgPicture.network(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }
}

