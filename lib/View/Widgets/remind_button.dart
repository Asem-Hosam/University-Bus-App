import 'package:flutter/material.dart';

class RemindButton extends StatelessWidget {
  const RemindButton({
    super.key,
    this.mainMax = MainAxisAlignment.center,
    required this.onPressed,
    required this.remindTxt,
    required this.btnTxt,
    required this.returnType,
  });
  final void Function() onPressed;
  final String remindTxt;
  final String btnTxt;
  final MainAxisAlignment mainMax;
  final bool returnType;
  @override
  Widget build(BuildContext context) {
    return returnType
        ? Row(
            mainAxisAlignment: mainMax,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(remindTxt,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 108, 107, 112),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                  )),
              TextButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                child: Text(
                  btnTxt,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 8, 15, 56),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: mainMax,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(remindTxt,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 108, 107, 112),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    height: 1.2,
                  )),
              GestureDetector(
                  onTap: onPressed,
                  child: Column(
                    children: [
                      Text(
                        btnTxt,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 8, 15, 56),
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ))
            ],
          );
  }
}
