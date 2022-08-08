import 'package:flutter/material.dart';

import '../../../core/shared/widgets/custom-text-field.dart';

class CustomProfileForm extends StatefulWidget {
  const CustomProfileForm({Key? key}) : super(key: key);

  @override
  State<CustomProfileForm> createState() => _CustomProfileFormState();
}

class _CustomProfileFormState extends State<CustomProfileForm> {
  late TextEditingController _companyController;
  late TextEditingController _ownerController;
  late TextEditingController _primaryPhoneController;
  late TextEditingController _secPhoneController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late FocusNode _companyNode;
  late FocusNode _ownerNode;
  late FocusNode _primaryPhoneNode;
  late FocusNode _secPhoneNode;
  late FocusNode _emailNode;
  late FocusNode _addressNode;


  @override
  initState() {
    _companyController = TextEditingController();
    _ownerController = TextEditingController();
    _primaryPhoneController = TextEditingController();
    _secPhoneController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _companyNode = FocusNode();
    _ownerNode = FocusNode();
    _primaryPhoneNode = FocusNode();
    _secPhoneNode = FocusNode();
    _emailNode = FocusNode();
    _addressNode = FocusNode();

    super.initState();
  }

  @override
  dispose() {
    _companyController.dispose();
    _ownerController.dispose();
    _primaryPhoneController.dispose();
    _secPhoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _companyNode.dispose();
    _ownerNode.dispose();
    _primaryPhoneNode.dispose();
    _secPhoneNode.dispose();
    _emailNode.dispose();
    _addressNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth= MediaQuery.of(context).size.width;
    return Column(children: [

      CustomTextField(
        controller: _companyController,
        borderColor: Colors.white,
        hintText: 'company name',
        validateField: () {},
        focusNode:_companyNode,
      ),
      SizedBox(height:deviceWidth*0.1,),
      CustomTextField(
        controller: _ownerController,
        borderColor: Colors.white,
        hintText: 'owner name',
        validateField: () {},
        focusNode:_ownerNode,
      ),
      SizedBox(height:deviceWidth*0.1,),

      CustomTextField(
        controller: _primaryPhoneController,
        borderColor: Colors.white,
        hintText: 'primary phone',
        validateField: () {},
        focusNode:_primaryPhoneNode,
      ),
      SizedBox(height:deviceWidth*0.1,),

      CustomTextField(
        controller: _secPhoneController,
        borderColor: Colors.white,
        hintText: 'secondary phone',
        validateField: () {},
        focusNode:_secPhoneNode,
      ),
      SizedBox(height:deviceWidth*0.1,),

      CustomTextField(
        controller: _emailController,
        borderColor: Colors.white,
        hintText: 'email',
        validateField: () {},
        focusNode:_emailNode,
      ),
      SizedBox(height:deviceWidth*0.1,),

      CustomTextField(
        controller: _addressController,
        borderColor: Colors.white,
        hintText: 'address',
        validateField: () {},
        focusNode:_addressNode,
      ),
      SizedBox(height:deviceWidth*0.2,),

    ],);
  }
}
