import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/components/custom_button.dart';
import 'package:notes_app/components/custom_form_field.dart';
import 'package:notes_app/components/custom_password_field.dart';
import 'package:notes_app/screens/signup_screen.dart';
import 'package:notes_app/utils/validator.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  bool isFormValid = false;
  bool showPassword = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  // void handleSubmit() async {
  //   isFormValid = _globalKey.currentState!.validate();
  //   if (!isFormValid) {
  //     return;
  //   } else {
  //     _globalKey.currentState!.save();
  //     // FirebaseService firebaseService = FirebaseService();
  //     final response =
  //         await FirebaseService().createUser(_email.text, _password.text);

  //     if (response['type'] == 'SUCCESS' && mounted) {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (context) => SignUpScreen2(
  //             email: _email.text,
  //           ),
  //         ),
  //       );
  //     } else if (response['type'] == 'ERROR') {
  //       if (response['message'] == 'Email already in use') {
  //         final response2 =
  //             await FirebaseService().signInUser(_email.text, _password.text);
  //         if (response2['type'] == 'SUCCESS' && mounted) {
  //           Navigator.of(context).push(
  //             MaterialPageRoute(
  //               builder: (context) =>  SignUpScreen3(email: _email.text,),
  //             ),
  //           );
  //         } else if (response2['type'] == 'ERROR' && mounted) {

  //           SnackbarHelper.showErrorSnackbar(
  //             context,
  //             response2['message'],
  //           );
  //         }
  //       } else {
  //         if (mounted) {
  //           SnackbarHelper.showErrorSnackbar(
  //             context,
  //             response['message'],
  //           );
  //         }
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 30.sp, top: 30.sp, right: 30.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  //text
                  Center(
                    child: Text(
                      'Sign in to QuickNotes',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400,
                        height: 0.8.h,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  //form
                  SizedBox(
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          CustomFormField(
                            controller: _email,
                            validator: Validator.validateEmail,
                            label: 'Email',
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          const CustomPasswordField(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    text: 'Sign In',
                    color: Colors.white70,
                    textColor: Colors.black,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?  ",
                        style:
                            TextStyle(color: Colors.white70, fontSize: 15.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white70,
                            color: Colors.white70,
                            fontSize: 15.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
