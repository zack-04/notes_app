import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email can't be empty";
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.white70),
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label: const Text('Email'),
                              labelStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white70,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          TextFormField(
                            controller: _password,
                            obscureText: !showPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field can't be empty";
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.white70),
                            decoration: InputDecoration(
                              label: const Text('Password'),
                              labelStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white70,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white70,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () => setState(() {
                                  showPassword = !showPassword;
                                }),
                                child: const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          height: 1.1.h,
                        ),
                        children: const [
                          TextSpan(
                            text: "Don't have an account?  ",
                          ),
                          TextSpan(
                            text: 'Signup',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                            // Add onTap callback for handling tap event
                          ),
                          
                        ],
                      ),
                    ),
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
