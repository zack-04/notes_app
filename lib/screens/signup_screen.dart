import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/components/custom_button.dart';
import 'package:notes_app/components/custom_form_field.dart';
import 'package:notes_app/components/custom_password_field.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:notes_app/screens/signin_screen.dart';
import 'package:notes_app/utils/firebase_service.dart';
import 'package:notes_app/utils/snackbar_helper.dart';
import 'package:notes_app/utils/validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  bool isFormValid = false;
  bool showPassword = false;

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void handleSubmit() async {
    isFormValid = _globalKey.currentState!.validate();
    if (!isFormValid) {
      return;
    } else {
      _globalKey.currentState!.save();

      final response = await FirebaseService().createUser(
        _email.text,
        _password.text,
        _firstName.text,
        _lastName.text,
      );

      if (response['type'] == 'SUCCESS' && mounted) {
        //TODO:set user data in provider
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else if (response['type'] == 'ERROR') {
        if (mounted) {
          SnackbarHelper.showErrorSnackbar(
            context,
            response['message'],
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.sp, top: 30.sp, right: 30.sp),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  //text
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign up to QuickNotes",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                        height: 0.8.h,
                        color: Colors.white70,
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),
                  //form
                  Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        //first name and surname
                        Row(
                          children: [
                            Expanded(
                              child: CustomFormField(
                                controller: _firstName,
                                validator: Validator.validateName,
                                label: 'First name',
                                textInputType: TextInputType.name,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomFormField(
                                controller: _lastName,
                                validator: Validator.validateName,
                                label: 'Last name',
                                textInputType: TextInputType.name,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.sp),
                        CustomFormField(
                          controller: _email,
                          validator: Validator.validateEmail,
                          label: 'Email',
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        //password
                        CustomPasswordField(
                          controller: _password,
                          suffixIcon: GestureDetector(
                            onTap: () => setState(() {
                              showPassword = !showPassword;
                            }),
                            child: const Icon(
                              Icons.remove_red_eye,
                              color: Colors.white70,
                            ),
                          ), showPassword: showPassword,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    onPressed: handleSubmit,
                    text: 'Sign Up',
                    color: Colors.white70,
                    textColor: Colors.black,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?  ",
                        style:
                            TextStyle(color: Colors.white70, fontSize: 15.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SigninScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Signin',
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
            )
          ],
        ),
      ),
    );
  }
}
