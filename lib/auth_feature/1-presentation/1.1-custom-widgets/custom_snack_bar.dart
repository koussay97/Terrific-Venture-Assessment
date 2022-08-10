import 'package:flutter/material.dart';

import '../../../core/brand/brand_guid.dart';


SnackBar customSnackBar(
    {required double deviceWidth,
    required String errorMessage,
    required BuildContext context}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    clipBehavior: Clip.none,
    elevation: 0,
    content: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          clipBehavior: Clip.none,
          padding: EdgeInsets.symmetric(
              vertical: deviceWidth * 0.05, horizontal: deviceWidth * 0.05),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(deviceWidth * 0.02)),
              gradient: Brand.customRedGradient),
          constraints: BoxConstraints(
            maxHeight: 0.25 * deviceWidth,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 0.13 * deviceWidth,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Oh 😟!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: deviceWidth * 0.037,
                        fontFamily: Brand.h1Font,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      maxLines: 2,
                      errorMessage,
                      style: TextStyle(
                        overflow: TextOverflow.fade,
                        color: Colors.white,
                        fontSize: deviceWidth * 0.038,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(deviceWidth * 0.02)),
            child: Brand.bubbles(
                color: Brand.darkRed,
                height: deviceWidth * 0.15,
                width: deviceWidth * 0.15),
          ),
        ),
        Positioned(
          top: -deviceWidth * 0.06,
          right: 0,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                },
                child: Brand.fail(
                    color: Brand.darkerRed,
                    height: deviceWidth * 0.1,
                    width: deviceWidth * 0.1),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                },
                child: Brand.close(
                    color: Brand.backgroundColor,
                    height: deviceWidth * 0.035,
                    width: deviceWidth * 0.035),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
