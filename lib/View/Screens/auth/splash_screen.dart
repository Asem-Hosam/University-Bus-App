import 'package:flutter/material.dart';
import 'package:sinaapp/View/Widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _containerWidth = 300;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _containerWidth = 500;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 15, 56),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    width: _containerWidth,
                    duration: const Duration(seconds: 4),
                    child: Image.asset(
                      'Assets/images/BusImage.png',
                    ),
                  ),
                  const Text(
                    "Sini University",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const Text(
                    "Bus App",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 19,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 25,
                    ),
                    child: Text(
                      "University Bus Transport app is designed to Help students in saving time by enabling them to effortlessly book tickets and conveniently check bus schedules.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 190, 190, 190),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      softWrap: true,
                      strutStyle: StrutStyle(
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: CustomButton(
                  onPressed: () => {
                    Navigator.pushReplacementNamed(context, "Login"),
                  },
                  bgColor: Colors.white,
                  txtColor: Colors.black,
                  btnWidth: 0.8,
                  btnText: "Get Started",
                  btnHeight: 48,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
