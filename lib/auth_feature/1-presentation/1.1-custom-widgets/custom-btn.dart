import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final double deviceWidth;
  final VoidCallback onTapBtn;
  final String label;
  const CustomBtn({Key? key,required this.deviceWidth,required this.onTapBtn,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth*0.05),
      child: Column(
        children: [
          SizedBox(height: deviceWidth*0.2,),
          Divider(
            height: deviceWidth*0.02,
            color: Colors.blueGrey.withOpacity(0.7),
          ),
          SizedBox(height: deviceWidth*0.1,),
          GestureDetector(
            onTap: onTapBtn,
            child: Container(
              height: deviceWidth*0.15,
              width: deviceWidth*0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(deviceWidth*0.3),
                color: Colors.green,
                boxShadow:[
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.2),
                    blurRadius: 2.0,
                    spreadRadius: 0.2,
                  ),],
              ),
              child: Center(
                child: Text(label,style: TextStyle(
                  fontSize: deviceWidth*0.05,
                  color: Colors.white,
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}