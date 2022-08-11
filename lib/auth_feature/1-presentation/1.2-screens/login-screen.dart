


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terrific_venture_assessment/auth_feature/1-presentation/1.1-custom-widgets/custom-btn.dart';
import 'package:terrific_venture_assessment/auth_feature/1-presentation/1.1-custom-widgets/custom-logo.dart';
import 'package:terrific_venture_assessment/auth_feature/1-presentation/1.3-logic-component/auth-viewModel.dart';
import 'package:terrific_venture_assessment/company_profile_feature/1-presentation/1-2-screens/company-profile-screen.dart';

import '../1.1-custom-widgets/custom-login-form.dart';
import '../1.1-custom-widgets/custom_snack_bar.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ScrollController _scrollController;

  @override
  initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.menu,
              color: Colors.black,
              size: deviceWidth * 0.04,
            ),
            backgroundColor: Colors.white,
            title: Text(
              'Login Page',
              style: TextStyle(
                fontSize: deviceWidth * 0.04,
                color: Colors.black,
              ),
            ),
            elevation: 0.5,
            centerTitle: true,
          ),
          body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onVerticalDragUpdate: (details) {
              _scrollController.animateTo(-details.delta.dy * 30,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.all(deviceWidth*0.02),
                controller: _scrollController,
                physics: const NeverScrollableScrollPhysics(),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: deviceWidth*0.1,),
                      LogoWidget(deviceWidth: deviceWidth),
                      SizedBox(height: deviceWidth*0.2,),
                      const CustomLoginForm(),
                      CustomBtn(deviceWidth: deviceWidth,onTapBtn: ()async{
                        var result = await context.read<AuthViewModel>().login();
                        result.fold(
                          (l) {    
                            ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(deviceWidth: deviceWidth,context: context,errorMessage: l.errorMessage!,)
                          );},
                          (r) {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const CompanyProfileScreen()));
                          },
                        );
                      },label: 'Login'),
                    ],

                  ),
                ),
              ),
            ),
          ),
        ));
  }
}



