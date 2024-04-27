import 'package:flutter/material.dart';

class CutomSelection extends StatelessWidget {
  const CutomSelection({
    super.key,
    this.onSaved,
    this.valiDator,
    this.onTap,
    this.contRoller,
    this.prefix,
    required this.labelText,
    this.hintText,
    this.autovalidateMode,
  });

  final TextEditingController? contRoller;
  final Widget? prefix;
  final String labelText;
  final String? hintText;
  final AutovalidateMode? autovalidateMode;

  //functions
  final void Function(String?)? onSaved;
  final String? Function(String?)? valiDator;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 4,
            bottom: 2,
          ),
          child: Text(
            labelText,
            style: const TextStyle(
              color: Color.fromARGB(255, 138, 144, 168),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
            ),
          ),
        ),
        TextFormField(
          autovalidateMode: autovalidateMode,
          controller: contRoller,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: "Poppins",
          ),
          readOnly: true,
          onTap: onTap,
          validator: valiDator,
          onSaved: onSaved,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 116, 120, 136),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
            contentPadding: const EdgeInsets.all(16),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffC03146),
                  width: 2,
                )),
            errorStyle: const TextStyle(
              backgroundColor: Color(0xfffff2f3),
              color: Color(0xffC03146),
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 159, 170, 187),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                ),
                child: prefix),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            fillColor: const Color.fromARGB(255, 228, 232, 238),
          ),
        ),
      ],
    );
  }
}
