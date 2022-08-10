import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class Brand {
  /// main colors
  static Color darkRed = const Color(0xffB61E1E);
  static Color darkerRed = const Color(0xff9f1f1f);
  static Color lightRed = const Color(0xffF94646);
  static Color backgroundColor = const Color(0xffE5E5E5);

  /// [TextField] Valid related colors
  static Color validGreen = const Color(0xff21A02E);
  static Color customBlack = const Color(0xff2C2B36);
  static Color customDarkBlue = const Color(0xff4E4B61);
  static Color customGrey = const Color(0xffCCCCCC);

  static BoxShadow customShadow = BoxShadow(
    color: Colors.black.withOpacity(0.07),
    blurRadius: 12,
    spreadRadius: 2,
  );

  static LinearGradient customRedGradient = LinearGradient(
    colors: [darkRed, lightRed],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  //////// assets accessors
  static Image fullRedLogo =
      Image.asset('assets/logo/F1 Logo_red.png', fit: BoxFit.contain);
  static Image fullWhiteLogo =
      Image.asset('assets/logo/f1_logo_white.png', fit: BoxFit.contain);

  // snackBar svg icons
  static SvgPicture bubbles(
          {required Color color,
          required double height,
          required double width}) =>
      SvgPicture.asset(
        'assets/icons_svg/bubbles.svg',
        color: color,
        height: height,
        width: width,
      );

  static SvgPicture close(
          {required Color color,
          required double height,
          required double width}) =>
      SvgPicture.asset(
        'assets/icons_svg/close.svg',
        color: color,
        height: height,
        width: width,
      );

  static SvgPicture fail(
          {required Color color,
          required double height,
          required double width}) =>
      SvgPicture.asset(
        'assets/icons_svg/fail.svg',
        color: color,
        height: height,
        width: width,

      );

  // white logo parts
  static Image logoWhite1 = Image.asset(
    'assets/white_logo_parts/1st_part.png',
    fit: BoxFit.contain,
  );
  static Image logoWhite2 = Image.asset(
    'assets/white_logo_parts/2nd_part.png',
    fit: BoxFit.contain,
  );
  static Image logoWhite3 =
      Image.asset('assets/white_logo_parts/3rd_part.png', fit: BoxFit.contain);
  // user avatar
  static Image avatar= Image.asset('assets/icons/avatar.png',fit: BoxFit.cover, alignment: Alignment.topCenter,);

  // fonts
  static String h1Font = 'SF_Pro_Rounded';
  static String h2Font = 'SF_Pro_display_medium';
  static String h3Font = 'SF_Pro_display_regular';

  static List<Map<String,dynamic>> drivers=[
    {
      'name':'Max Verstappen',
      'company_name':'Red Bull Racing Honda',
      'rank':'1'
    },
    {
      'name':'Lewis Hamilton',
      'company_name':'Mercedes',
      'rank':'2'
    },
    {
      'name':'Valtteri Bottas',
      'company_name':'Mercedes',
      'rank':'3'
    },
    {
      'name':'Sergio Perez',
      'company_name':'Red Bull Racing Honda',
      'rank':'4'
    },
    {
      'name':'Carlos Sainz',
      'company_name':'Ferrari',
      'rank':'5'
    },
    {
      'name':'Lando Norris',
      'company_name':'Mclaren Mercedes',
      'rank':'6'
    },
    {
      'name':'Charles Leclerc',
      'company_name':'Ferrari',
      'rank':'7'
    },
    {
      'name':'Daniel Ricciardo',
      'company_name':'Mclaren Mercedes',
      'rank':'8'
    },
    {
      'name':'Pierre Gasly',
      'company_name':'Alphatauri Honda',
      'rank':'9'
    },
    {
      'name':'Fernando Alonso',
      'company_name':'Alpine Renault',
      'rank':'10'
    },
  ];

  static getDriverAvatar(String normalizedName){
    return Image.asset('assets/icons/players/$normalizedName.png',fit: BoxFit.cover);
  }

}

