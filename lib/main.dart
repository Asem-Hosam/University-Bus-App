import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaapp/Core/cubits/auth_cubit/auth_cubit.dart';
import 'package:sinaapp/Core/cubits/auth_cubit/authchecking/authcheking_cubit.dart';
import 'package:sinaapp/Core/cubits/cubit/search_cubit.dart';
import 'package:sinaapp/Core/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:sinaapp/View/Screens/admin/addtrip_screen.dart';
import 'package:sinaapp/View/Screens/admin/trips_screen.dart';
import 'package:sinaapp/View/Screens/auth/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sinaapp/View/Screens/auth/signup_screen.dart';
import 'package:sinaapp/View/Screens/auth/splash_screen.dart';
import 'package:sinaapp/View/Screens/editprofile_screen.dart';
import 'package:sinaapp/View/Screens/switcher_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => AuthchekingCubit()..initSarts()),
//         BlocProvider(create: (context) => AuthCubit()),
//         BlocProvider(create: (context) => DashboardCubit()),
//         BlocProvider(create: (context) => SearchCubit()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: const MainScreen(),
//         routes: {
//           "Sginup": (context) => SingupScreen(),
//           "Login": (context) => LoginScreen(),
//           "Splash": (context) => const SplashScreen(),
//           "ProfileEditScreen": (context) => const ProileEditScreen(),
//           "SwitchScreen": (context) => const SwitchScreen(),
//           "TripsScreen": (context) => const TripsScreen(),
//           "AddTripScreen": (context) => AddTripScreen(),
//         },
//       ),
//     ),
//   );
// }

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthchekingCubit()..initSarts()),
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => DashboardCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          home: const MainScreen(),
          routes: {
            "Sginup": (context) => SingupScreen(),
            "Login": (context) => LoginScreen(),
            "Splash": (context) => const SplashScreen(),
            "ProfileEditScreen": (context) => const ProileEditScreen(),
            "SwitchScreen": (context) => const SwitchScreen(),
            "TripsScreen": (context) => const TripsScreen(),
            "AddTripScreen": (context) => AddTripScreen(),
          },
        ),
      ),
    ),
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthchekingCubit, AuthchekingState>(
        builder: (context, state) {
          if (state is IsAuthenticated) {
            return const SwitchScreen();
          } else if (state is UnAuthenticated) {
            return LoginScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
