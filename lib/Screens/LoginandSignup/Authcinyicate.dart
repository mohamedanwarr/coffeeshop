// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool showtextfiled = false;


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _handlelogin(BuildContext context) async {
    final getmessage = Provider.of<LoginandSignup>(context,listen: false);

    if (!showtextfiled) {
    return getmessage.isLoginSelected(showtextfiled=true); //
    } else if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Myconstants.darkColor,
              secondRingColor: Myconstants.activeColor,
              size: 40,
            ),
          );
        },
      );
      try {
        final authentication =
            Provider.of<LoginandSignup>(context, listen: false);
       final user= await authentication.loginWithEmailAndPassword(
            _emailController.text, _passwordController.text);
        Navigator.pop(context);
        if(user!=null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainScreen()));
          SnacBar.showmessage('Successfully Login ', isuccess: true);
        }else{
          SnacBar.showmessage("no Found that account ", isuccess: false);
        }
      }   catch (e) {
        Navigator.pop(context);
        SnacBar.showmessage("no Found that account ", isuccess: false);
      }
    }
  }
  void _handelSignup(BuildContext context)async {
    final getmessage = Provider.of<LoginandSignup>(context,listen: false);

    if (!showtextfiled) {
      // Show text fields when the button is pressed
      getmessage.issignupSelected(showtextfiled=true);
    } else if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Myconstants.darkColor,
              secondRingColor: Myconstants.activeColor,
              size: 40,
            ),
          );
        },
      );
      try {
        final authentication =
            Provider.of<LoginandSignup>(context, listen: false);
        final user=await authentication.createsignupWithEmailAndPassword(
            _emailController.text, _passwordController.text);
        Navigator.pop(context);
        if(user!=null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainScreen()));
          SnacBar.showmessage('Successfully signup', isuccess: true);
        }else{
          SnacBar.showmessage(" The email address is already in use by another account.", isuccess: false,);
        }
      }catch (e) {
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomeTextfiled(
                            textlablee: 'Email',
                            textInput: TextInputType.emailAddress,
                            obscureText: false,
                            controller: _emailController,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                          ),
                          const SizedBox(height: 10),
                          CustomeTextfiled(
                            textlablee: 'Password',
                            textInput: const TextInputType.numberWithOptions(),
                            obscureText: true,
                            controller: _passwordController,
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
