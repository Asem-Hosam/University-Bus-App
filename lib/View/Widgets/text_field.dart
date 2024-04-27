import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.isSecure = false,
    this.readOly = false,
    this.contRoller,
    required this.labelText,
    this.hintText = '',
    required this.fontSize,
    this.suffixIcon,
    this.prefix,
    this.keyboardType,
    this.maxLenght,
    this.inputFormat,
    this.onSaved,
    required this.valiDator,
    this.autovalidMode,
    this.onTap,
    this.fillColor = const Color.fromARGB(255, 240, 241, 245),
  });

  final TextEditingController? contRoller;
  final String labelText;
  final String hintText;
  final bool isSecure;
  final double fontSize;
  final Color fillColor;
  final Widget? suffixIcon;
  final Widget? prefix;
  final int? maxLenght;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidMode;
  final bool? readOly;

  //functions
  final void Function(String?)? onSaved;
  final String? Function(String?)? valiDator;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Color.fromARGB(255, 138, 144, 168),
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
          ),
        ),
        TextFormField(
          autovalidateMode: autovalidMode,
          keyboardType: keyboardType,
          obscureText: isSecure,
          maxLength: maxLenght,
          controller: contRoller,
          inputFormatters: inputFormat,
          onSaved: onSaved,
          onTap: onTap,
          textAlignVertical: TextAlignVertical.center,
          autocorrect: false,
          validator: valiDator,
          style: TextStyle(
            fontSize: fontSize,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: const EdgeInsets.all(15),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
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
            counterText: '',
            prefixIcon: prefix,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: fillColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromARGB(255, 8, 15, 56),
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xffc4c6d4),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
          ),
        ),
      ],
    );
  }
}



// Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color(0xfffEEDD4),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   width: double.infinity,
//                   height: 35,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Icon(
//                         UIcons.boldRounded.exclamation,
//                         size: 14,
//                         color: const Color(0xffC03146),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5),
//                         child: Text(
//                           loginModel.errorrTextVal,
//                           style: const TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             color: Color(0xffC03146),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),