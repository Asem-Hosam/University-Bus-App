import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.btnWidth,
    required this.btnText,
    this.bgColor = const Color.fromARGB(255, 0, 0, 0),
    this.txtColor = const Color.fromARGB(255, 255, 255, 255),
    required this.btnHeight,
    this.isLoading = false,
  });

  final void Function() onPressed;
  final double btnWidth;
  final double btnHeight;
  final String btnText;
  final Color bgColor;
  final Color txtColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 0,
      ),
      child: SizedBox(
        width: double.infinity,
        height: btnHeight,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(txtColor),
            backgroundColor: MaterialStateProperty.all(bgColor),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            elevation: MaterialStateProperty.all<double>(0), // Remove elevation

            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child: isLoading
              ? const SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(btnText),
        ),
      ),
    );
  }
}
