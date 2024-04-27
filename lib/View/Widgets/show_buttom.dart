import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sinaapp/View/Widgets/custom_datepicker.dart';
import 'package:sinaapp/View/Widgets/custom_modelsheet.dart';
import 'package:sinaapp/View/Widgets/setting_custom.dart';

// Function to build a modal bottom sheet
void buildModalSheet({
  required BuildContext context,
  required TextEditingController textController,
  required bool returnTypeList,
  List<String>? items,
  IconData? iconData,
  double height = 350,
  bool? returnTypeTime,
}) {
  showModalBottomSheet(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(21.0),
        topRight: Radius.circular(21.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return CustomModelSheet(
        height: height,
        lineColor: const Color.fromARGB(116, 84, 100, 156),
        cancelBtn: true,
        sheetItems: [
          returnTypeList
              ? Expanded(
                  child: ListView(
                    children: items!.map((element) {
                      return CustomSetting(
                        iconData: iconData,
                        settingTxt: element,
                        onTap: () {
                          textController.text = element;
                          Navigator.pop(context);
                        },
                      );
                    }).toList(),
                  ),
                )
              : CustomDatePicker(
                  returnTypeTime: returnTypeTime!,
                  onSubmit: (val) {
                    if (returnTypeTime) {
                      final value = DateFormat("hh:mm a").format(val);
                      textController.text = value;
                    } else {
                      final value = DateFormat('yyy-MM-dd').format(val);
                      textController.text = value;
                    }
                  },
                ),
        ],
      );
    },
  );
}
