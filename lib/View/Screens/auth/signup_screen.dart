// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaapp/Core/cubits/auth_cubit/auth_cubit.dart';
import 'package:sinaapp/Model/validition_model.dart';
import 'package:sinaapp/View/Widgets/custom_appbar.dart';
import 'package:sinaapp/View/Widgets/custom_button.dart';
import 'package:sinaapp/View/Widgets/remind_button.dart';
import 'package:sinaapp/View/Widgets/text_field.dart';
import 'package:uicons/uicons.dart';

class SingupScreen extends StatelessWidget {
  SingupScreen({super.key});

  final ValidtionModel signUpModel = ValidtionModel();
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String phoneNumber = "";
  String userName = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    EdgeInsets viewInsets = mediaQuery.viewInsets;
    bool isKeyboardOpen = viewInsets.bottom > 0;

    return Scaffold(
      // appBar: CustomAppBar(
      //   cutomClipper: false,
      //   widgetsItems: [
      //     SafeArea(
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.only(
      //               right: 20,
      //             ),
      //             child: IconButton(
      //               onPressed: () => {
      //                 Navigator.pop(context),
      //               },
      //               icon: Icon(
      //                 UIcons.regularStraight.arrow_small_left,
      //                 color: const Color.fromARGB(255, 0, 0, 0),
      //                 size: 28,
      //               ),
      //             ),
      //           ),
      //           const Text(
      //             "Login",
      //             style: TextStyle(
      //               color: Color.fromARGB(255, 0, 0, 0),
      //               fontSize: 19,
      //               fontWeight: FontWeight.w500,
      //               fontFamily: "Poppins",
      //             ),
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SginupLoading) {
            isLoading = true;
          } else if (state is SginupSucces) {
            // BlocProvider.of<AuthCubit>(context).onTabChange(0);
            Navigator.pushNamed(context, "SwitchScreen");
          } else if (state is SginupFailure) {
            isLoading = false;
            showBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 250,
                    child: Center(child: Text(state.errorMessage)),
                  );
                });
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sinai University",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const Text(
                        "Hey there,",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color.fromARGB(255, 30, 66, 131),
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                // ------------------------------------------ Inputs ----------------------------
                                CustomInput(
                                  autovalidMode:
                                      AutovalidateMode.onUserInteraction,
                                  prefix: Icon(
                                    UIcons.regularRounded.star_octogram,
                                    size: 20,
                                    color: const Color(0xffc4c6d4),
                                  ),
                                  labelText: "Username",
                                  hintText: 'Name',
                                  fontSize: 16,
                                  onSaved: (val) {
                                    userName = val!;
                                  },
                                  valiDator: signUpModel.validateUsername,
                                ),
                                CustomInput(
                                  autovalidMode:
                                      AutovalidateMode.onUserInteraction,
                                  prefix: Icon(
                                    UIcons.regularRounded.user,
                                    size: 20,
                                    color: const Color(0xffc4c6d4),
                                  ),
                                  labelText: "E-mail",
                                  hintText: 'example@su.edu.eg',
                                  fontSize: 16,
                                  onSaved: (val) {
                                    email = val!;
                                  },
                                  valiDator: signUpModel.validateEmail,
                                ),
                                CustomInput(
                                  autovalidMode:
                                      AutovalidateMode.onUserInteraction,
                                  prefix: Icon(
                                    UIcons.regularRounded.phone_call,
                                    size: 20,
                                    color: const Color(0xffc4c6d4),
                                  ),
                                  labelText: "Phone Number",
                                  keyboardType: TextInputType.number,
                                  maxLenght: 10,
                                  inputFormat: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  hintText: '0123456789',
                                  fontSize: 16,
                                  onSaved: (val) {
                                    phoneNumber = val!;
                                  },
                                  valiDator: signUpModel.validatePhoneNumber,
                                ),
                                CustomInput(
                                  autovalidMode:
                                      AutovalidateMode.onUserInteraction,
                                  prefix: Icon(
                                    UIcons.regularRounded.lock,
                                    size: 20,
                                    color: const Color(0xffc4c6d4),
                                  ),
                                  isSecure: BlocProvider.of<AuthCubit>(context)
                                      .isSecure,
                                  maxLenght: 32,
                                  labelText: "Password",
                                  fontSize: 16,
                                  suffixIcon: IconButton(
                                    icon: BlocProvider.of<AuthCubit>(context)
                                            .isSecure
                                        ? Icon(
                                            UIcons.regularRounded.eye_crossed,
                                            size: 20,
                                            color: const Color.fromARGB(
                                                255, 8, 15, 56),
                                          )
                                        : Icon(
                                            UIcons.regularRounded.eye,
                                            size: 20,
                                            color: const Color.fromARGB(
                                                255, 8, 15, 56),
                                          ),
                                    onPressed: () {
                                      BlocProvider.of<AuthCubit>(context)
                                          .isPaswordSecure();
                                    },
                                  ),
                                  onSaved: (val) {
                                    password = val!;
                                  },
                                  valiDator: signUpModel.validatePassword,
                                ),

                                // ------------------------------------------ Inputs ----------------------------
                              ],
                            )),
                      ),
                      isKeyboardOpen
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: RemindButton(
                                onPressed: () => {},
                                remindTxt:
                                    "By signing up, you agree to our Terms & Conditions & Privacy Policy",
                                btnTxt: "Learn More",
                                returnType: false,
                              ),
                            ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: CustomButton(
                          isLoading: isLoading,
                          onPressed: () => {
                            if (formKey.currentState!.validate())
                              {
                                formKey.currentState!.save(),
                                BlocProvider.of<AuthCubit>(context)
                                    .createAccountWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                  mobile: phoneNumber,
                                  username: userName,
                                )
                              }
                          },
                          btnWidth: 0.9,
                          btnText: "Sign Up",
                          btnHeight: 50,
                          bgColor: const Color.fromARGB(255, 8, 15, 56),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
