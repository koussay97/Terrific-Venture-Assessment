import 'package:flutter/material.dart';

import '../../../core/shared/widgets/custom-text-field.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({Key? key}) : super(key: key);

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  late TextEditingController _phoneNumberController;
  late TextEditingController _otpController;

  late FocusNode _phoneNumberNode;
  late FocusNode _otpNode;



  @override
  initState() {
    _phoneNumberController = TextEditingController();
    _otpController = TextEditingController();

    _phoneNumberNode = FocusNode();
    _otpNode = FocusNode();

    super.initState();
  }

  @override
  dispose() {
    _phoneNumberController.dispose();
    _otpController.dispose();
    _phoneNumberNode.dispose();
    _otpNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth= MediaQuery.of(context).size.width;
    return Column(children: [

      CustomTextField(
        controller: _phoneNumberController,
        borderColor: Colors.white,
        hintText: 'login number',
        validateField: () {},
        focusNode:_phoneNumberNode,
      ),
      SizedBox(height:deviceWidth*0.1,),
      CustomTextField(
        controller: _otpController,
        borderColor: Colors.white,
        hintText: 'otp',
        validateField: () {},
        focusNode:_otpNode,
      ),
      SizedBox(height:deviceWidth*0.1,),

    ],);
  }
}
