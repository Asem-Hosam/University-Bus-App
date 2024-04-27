import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaapp/Core/cubits/auth_cubit/auth_cubit.dart';
import 'package:sinaapp/Model/validition_model.dart';
import 'package:sinaapp/View/Widgets/custom_appbar.dart';
import 'package:sinaapp/View/Widgets/custom_button.dart';
import 'package:sinaapp/View/Widgets/custom_modelsheet.dart';
import 'package:sinaapp/View/Widgets/remind_button.dart';
import 'package:sinaapp/View/Widgets/text_field.dart';
import 'package:sinaapp/View/Screens/auth/forge_screen.dart';
import 'package:sinaapp/View/Screens/auth/signup_screen.dart';
import 'package:uicons/uicons.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final ValidtionModel loginModel = ValidtionModel();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        cutomClipper: false,
        widgetsItems: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 25,
                    top: 2,
                    left: 20,
                  ),
                  child: Icon(
                    UIcons.regularRounded.hand_holding_heart,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xffFFFEFE),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            isLoading = true;
          } else if (state is LoginSuccess) {
            BlocProvider.of<AuthCubit>(context).onTabChange(0);
            Navigator.pushReplacementNamed(context, "SwitchScreen");
            isLoading = false;
          } else if (state is LoginFailure) {
            isLoading = false;
            showBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return CustomModelSheet(sheetItems: [
                    SizedBox(
                      height: 150,
                      child: Center(child: Text(state.errorMessage)),
                    ),
                  ]);
                });
          }
        },
        builder: (ctx, state) => SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                      "Welcome Back,",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 66, 131),
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Life is a journey, not a destination. Let us help you navigate.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 188, 188, 189),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //-------------------------------------------------------
                            CustomInput(
                              autovalidMode: AutovalidateMode.onUserInteraction,
                              prefix: Icon(
                                UIcons.regularRounded.user,
                                size: 20,
                                color: const Color(0xffc4c6d4),
                              ),
                              labelText: "E-mail",
                              hintText: 'example@su.edu.eg',
                              fontSize: 16,
                              onSaved: (value) => {email = value!},
                              valiDator: loginModel.validateEmail,
                            ),

                            CustomInput(
                              autovalidMode: AutovalidateMode.onUserInteraction,
                              prefix: Icon(
                                UIcons.regularRounded.lock,
                                size: 20,
                                color: const Color(0xffc4c6d4),
                              ),
                              isSecure:
                                  BlocProvider.of<AuthCubit>(context).isSecure,
                              labelText: "Password",
                              fontSize: 16,
                              onSaved: (value) => {password = value!},
                              valiDator: loginModel.validateLoginPassword,
                              //-------------------------------------------------------
                              suffixIcon: IconButton(
                                icon:
                                    BlocProvider.of<AuthCubit>(context).isSecure
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
                            ),
                            RemindButton(
                              returnType: true,
                              mainMax: MainAxisAlignment.start,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetScreen()),
                                );
                              },
                              btnTxt: "Forget password?",
                              remindTxt: '',
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: CustomButton(
                      isLoading: isLoading,
                      onPressed: () => {
                        if (formKey.currentState!.validate())
                          {
                            formKey.currentState!.save(),
                            BlocProvider.of<AuthCubit>(context)
                                .signInWithEmailAndPassword(
                                    email: email, password: password)
                          },
                      },
                      btnWidth: 0.9,
                      btnText: "Login",
                      btnHeight: 50,
                      bgColor: const Color.fromARGB(255, 8, 15, 56),
                    ),
                  ),
                  Center(
                    child: RemindButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingupScreen()),
                        );
                      },
                      btnTxt: "Sign Up",
                      remindTxt: 'Dont have an account ?',
                      returnType: true,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UiUpdateCubit {}
