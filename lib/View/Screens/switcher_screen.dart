import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaapp/Core/cubits/auth_cubit/auth_cubit.dart';
import 'package:sinaapp/View/Widgets/custom_navbar.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Stack(
            children: [
              BlocProvider.of<AuthCubit>(context).activeScreen.elementAt(
                  BlocProvider.of<AuthCubit>(context).activeScreenIndex),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomNavbar(
                    isAdmin: BlocProvider.of<AuthCubit>(context).isAdmin,
                    onTapChanged:
                        BlocProvider.of<AuthCubit>(context).onTabChange,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
