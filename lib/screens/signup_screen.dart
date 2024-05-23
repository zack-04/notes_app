import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/components/custom_button.dart';
import 'package:notes_app/screens/signin_screen.dart';

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

  // void validateAndSave() async {
  //   isFormValid = _globalKey.currentState!.validate();
  //   if (isFormValid && (!_isCheckedBox1 || !_isCheckedBox2)) {
  //     SnackbarHelper.showErrorSnackbar(context, 'Please check the boxes to continue');
  //   } else {
  //     _globalKey.currentState!.save();
  //     //save values in ft
  //     try {
  //       await FirebaseService().saveUserDetails({
  //       'firstName':_firstName.text,
  //       'lastName':_lastName.text,
  //       'dob':_dob.text,
  //       'email':widget.email,
  //     });
  //     if (mounted) {
  //       Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) =>  SignUpScreen4(email: widget.email,),
  //       ),
  //     );
  //     }
  //     } catch (e) {
  //       if (mounted) {
  //         SnackbarHelper.showErrorSnackbar(context, e.toString());
  //       }
  //     }

  //   }
  // }

  // Future<void> _selectDate(BuildContext context) async {
  //   if (selectedDate == null) {
  //     final DateTime? pickedDate = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2101),
  //     );
  //     if (pickedDate != null) {
  //       setState(() {
  //         selectedDate = pickedDate;
  //         _dob.text = pickedDate.toLocal().toString().split(' ')[0];
  //       });
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
                              child: TextFormField(
                                controller: _firstName,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Field can't be empty";
                                  }
                                  return null;
                                },
                                cursorColor: Colors.white70,
                                style: TextStyle(color: Colors.white70),
                                decoration: InputDecoration(
                                  label: const Text(
                                    'First name',
                                  ),
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
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _lastName,
                                cursorColor: Colors.white70,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Field can't be empty";
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.white70),
                                decoration: InputDecoration(
                                  label: const Text(
                                    'Last name',
                                  ),
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
                            ),
                          ],
                        ),
                        SizedBox(height: 20.sp),
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
                          SizedBox(height: 20.sp,),
                        //password
                        TextFormField(
                          controller: _password,
                          obscureText: !showPassword,
                          cursorColor: Colors.white70,
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
                              borderSide: const BorderSide(
                                color: Colors.white70,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
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
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    onPressed: () {},
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
