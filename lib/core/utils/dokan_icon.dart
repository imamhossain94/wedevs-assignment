import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DokanIcon {
  static const String _basePath = 'assets/svg';

  static const String cart = '$_basePath/ic_cart.svg';
  static const String envelop = '$_basePath/ic_envelop.svg';
  static const String eyeSlash = '$_basePath/ic_eye_slash.svg';
  static const String facebook = '$_basePath/ic_facebook.svg';
  static const String google = '$_basePath/ic_google.svg';
  static const String grid = '$_basePath/ic_grid.svg';
  static const String heart = '$_basePath/ic_heart.svg';
  static const String home = '$_basePath/ic_home.svg';
  static const String listBullet = '$_basePath/ic_list_bullet.svg';
  static const String lock = '$_basePath/ic_lock.svg';
  static const String notificationBell = '$_basePath/ic_notification_bell.svg';
  static const String search = '$_basePath/ic_search.svg';
  static const String setting = '$_basePath/ic_setting.svg';
  static const String user = '$_basePath/ic_user.svg';

  static SvgPicture icon(String iconName, {double size = 24, Color color = Colors.black}) {
    return SvgPicture.asset(
      iconName,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
