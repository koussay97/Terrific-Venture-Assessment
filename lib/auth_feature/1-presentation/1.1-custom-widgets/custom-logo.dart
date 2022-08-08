import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double deviceWidth;
  const LogoWidget({Key? key,required this.deviceWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceWidth*0.3,
      width: deviceWidth*0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(deviceWidth*0.3),
        boxShadow:const [
          BoxShadow(
            color: Color.fromRGBO(233, 233, 233, 0.5019607843137255),
            blurRadius: 2.0,
            spreadRadius: 0.7,
          ),],
      ),
      child: Icon(Icons.supervised_user_circle,color: Colors.green, size: deviceWidth*0.3,),
    );
  }
}