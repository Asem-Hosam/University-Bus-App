import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker(
      {super.key, this.onSubmit, required this.returnTypeTime});

  final dynamic Function(dynamic)? onSubmit;
  final bool returnTypeTime;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        !returnTypeTime
            ? BottomPicker.date(
                buttonWidth: 300,
                buttonContent: const Text(
                  "Select",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                  ),
                ),
                buttonPadding: 15,
                buttonStyle: const BoxDecoration(
                  color: Color.fromARGB(255, 8, 15, 56),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                displayCloseIcon: false,
                displaySubmitButton: true,
                backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                dateOrder: DatePickerDateOrder.ymd,
                minDateTime: DateTime(2000),
                initialDateTime: DateTime.now(),
                pickerTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                onSubmit: onSubmit,
                bottomPickerTheme: BottomPickerTheme.plumPlate,
              )
            : BottomPicker.time(
                buttonWidth: 300,
                buttonContent: const Text(
                  "Select",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                  ),
                ),
                buttonPadding: 15,
                buttonStyle: const BoxDecoration(
                  color: Color.fromARGB(255, 8, 15, 56),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                displayCloseIcon: false,
                displaySubmitButton: true,
                backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                pickerTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                initialTime: Time.now(),
                onSubmit: onSubmit,
                bottomPickerTheme: BottomPickerTheme.plumPlate,
              ),
      ],
    );
  }
}
