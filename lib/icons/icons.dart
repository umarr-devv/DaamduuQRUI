import 'dart:ui';

import 'package:flutter_svg/svg.dart';

// ignore_for_file: constant_identifier_names
enum CustomIcons {
  apple,
  bell,
  category,
  comment_info,
  contacts,
  croissant,
  cup_straw_swoosh,
  customers,
  dashboard,
  empty_set,
  establishment,
  face_sad_sweat,
  food,
  french_fries,
  glass_cheers,
  google,
  hamburger_soda,
  heart_fill,
  heart,
  house_fill,
  house,
  icon,
  instagram,
  interrogation,
  list,
  logo,
  mail,
  map_marker_fill,
  map_marker,
  menu_food,
  menu,
  mug_hot_alt,
  news,
  phone,
  place,
  qr,
  rating,
  restaurant,
  search,
  share,
  shield_check,
  shopping_basket_fill,
  shopping_basket,
  sign_in,
  som,
  statistic,
  telegram,
  time_past,
  trash_xmark,
  user_fill,
  user,
  whatsapp;

  String get assetName => '$name.svg';

  final iconsPath = 'assets/svg';

  SvgPicture call({double size = 24, Color? color}) {
    return SvgPicture.asset(
      '$iconsPath/$assetName',
      package: 'daamduu_qr_ui',
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }
}
