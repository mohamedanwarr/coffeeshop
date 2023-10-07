// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../Componant/CustomeButton.dart';
import '../../Componant/CustomeTextfiled.dart';
import '../../Componant/customebackground.dart';

import '../../MainScreen.dart';
import '../../Providers/LoginandSignuproviders.dart';
import '../../Utilies/snackbar.dart';
import '../../constants/Constants.dart';
import '../Foregetpass/Foregetpass.dart';

class loginandsignup extends StatefulWidget {
  const loginandsignup({Key? key}) : super(key: key);

  @override
  State<loginandsignup> createState() => _loginandsignupState();
}

class _loginandsignupState extends State<loginandsignup> {
  final TextEditingController _emailControllerlogin = TextEditingController();
  final TextEditingController _passwordControllerlogin =
      TextEditingController();
  final TextEditingController _emailControllersignup = TextEditingController();
  final TextEditingController _passwordControllersignup =
      TextEditingController();
  final _formKeylogin = GlobalKey<FormState>();
  final _formKeysignup = GlobalKey<FormState>();

  bool showtextfiled = false;

  @override
  void dispose() {
    super.dispose();
    _emailControllerlogin.dispose();
    _passwordControllerlogin.dispose();
    _emailControllersignup.dispose();
    _passwordControllersignup.dispose();
  }

  void _handlelogin(BuildContext context) async {
    final getmessage = Provider.of<LoginandSignup>(context, listen: false);
    getmessage.isLoginSelected();

    // Reset the color and text of the other button
    getmessage.issignupSelected();

    if(_formKeylogin.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return FutureBuilder(
              future: Future.delayed(const Duration(seconds: 8)),
              builder: (ctx, timer) {
                return Center(
                    child: LottieBuilder.asset(
                  'Assets/Images/animation_lmyrijnt.json',
                  width: 100,
                  height: 100,
                )
                    // LoadingAnimationWidget.discreteCircle(
                    //   color: Myconstants.darkColor,
                    //   secondRingColor: Myconstants.activeColor,
                    //   size: 40,
                    // ),
                    );
              });
        },
      );
      try {
        final authentication =
            Provider.of<LoginandSignup>(context, listen: false);
        final user = await authentication.loginWithEmailAndPassword(
            _emailControllerlogin.text, _passwordControllerlogin.text);

        if (user != null) {
          Future.delayed(const Duration(seconds: 8), () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MainScreen()));
            SnacBar.showmessage('Successfully Login ', isuccess: true);
          });
        } else {
          SnacBar.showmessage("no Found that account ", isuccess: false);
        }
      } catch (e) {
        Navigator.pop(context);
        SnacBar.showmessage("$e", isuccess: false);
      }
    }

  }

  void _handelSignup(BuildContext context) async {
    final getmessage = Provider.of<LoginandSignup>(context, listen: false);
    getmessage.issignupSelected();

    // Reset the color and text of the other button
    getmessage.isLoginSelected();

    if ( _formKeysignup.currentState!.validate()){
      showDialog(
        context: context,
        builder: (context) {
          return FutureBuilder(
              future: Future.delayed(const Duration(seconds: 8)),
              builder: (ctx, timer) {
                return Center(
                    child: LottieBuilder.asset(
                  'Assets/Images/animation_lmyrijnt.json',
                  width: 100,
                  height: 100,
                ));
              });
        },
      );
      try {
        final authentication =
            Provider.of<LoginandSignup>(context, listen: false);
        final user = await authentication.createsignupWithEmailAndPassword(
            _emailControllersignup.text, _passwordControllersignup.text);

        if (user != null) {
          Future.delayed(const Duration(seconds: 8), () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MainScreen()));
            SnacBar.showmessage('Successfully signup', isuccess: true);
          });
        } else {
          SnacBar.showmessage(
            " The email address is already in use by another account.",
            isuccess: false,
          );
        }
      } catch (e) {
        Navigator.pop(context);
        SnacBar.showmessage("$e", isuccess: false);
      }


    }
  }

  @override
  Widget build(BuildContext context) {
    final getmessage = Provider.of<LoginandSignup>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            customebackground(
              width: width,
              height: height,
            ),
            Positioned(
                top: 310,
                left: 29,
                child: Text(
                  getmessage.title,
                  style: TextStyle(
                      color: Myconstants.darkColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      height: 0),
                )),
            Visibility(
                visible: showtextfiled,
                child: Positioned(
                    left: 20,
                    right: 20,
                    top: 410,
                    child: getmessage.islogin==false
                        ? Form(
                            key: _formKeylogin,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomeTextfiledlogin(
                                  textlablee: 'Enter your email',
                                  textInput: TextInputType.emailAddress,
                                  obscureText: false,
                                  controller: _emailControllerlogin,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.email(),
                                  ]),
                                ),
                                const SizedBox(height: 10),
                                CustomeTextfiledlogin(
                                  textlablee: "Enter Your Password",
                                  textInput:
                                      const TextInputType.numberWithOptions(),
                                  obscureText: true,
                                  controller: _passwordControllerlogin,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.numeric(),
                                    FormBuilderValidators.integer(),
                                    FormBuilderValidators.min(6),
                                  ]),
                                ),
                              ],
                            ),
                          )
                        : Form(
                            key: _formKeysignup,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomeTextfiledlogin(
                                  textlablee: 'Email',
                                  textInput: TextInputType.emailAddress,
                                  obscureText: false,
                                  controller: _emailControllersignup,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.email(),
                                  ]),
                                ),
                                const SizedBox(height: 10),
                                CustomeTextfiledlogin(
                                  textlablee: "Password",
                                  textInput:
                                      const TextInputType.numberWithOptions(),
                                  obscureText: true,
                                  controller: _passwordControllersignup,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.numeric(),
                                    FormBuilderValidators.integer(),
                                    FormBuilderValidators.min(6),
                                  ]),
                                ),
                              ],
                            ),
                          ))),
            Positioned(
              top: 620,
              left: 40,
              right: 40,
              child: GestureDetector(
                onTap: () {

                  showtextfiled=true;
                  _handlelogin(context);
                },
                child: CustomeButton(
                  width: width,
                  height: height * 0.06,
                  textbutton: 'Loign',
                  colorButton: getmessage.islogin
                      ? Myconstants.activeColor
                      : Myconstants.darkColor,
                  colortextButton: getmessage.islogin
                      ? Myconstants.darkColor
                      : Myconstants.activeColor,
                ),
              ),
            ),
            Positioned(
              top: 684,
              left: 40,
              right: 40,
              child: GestureDetector(
                onTap: () {
                  showtextfiled=true;
                  _handelSignup(context);
                },
                child: CustomeButton(
                  width: width,
                  height: height * 0.06,
                  textbutton: 'Create an account',
                  colorButton: getmessage.islogin
                      ? Myconstants.darkColor
                      : Myconstants.activeColor,
                  colortextButton: getmessage.islogin
                      ? Myconstants.activeColor
                      : Myconstants.darkColor,
                ),
              ),
            ),
            Positioned(
                right: 90,
                left: 90,
                bottom: 10,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Foregetpass()));
                  },
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(
                        color: Myconstants.darkColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 0),
                  ),
                ))
          ],
        ));
  }
}
