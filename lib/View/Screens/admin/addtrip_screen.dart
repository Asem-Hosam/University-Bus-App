import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sinaapp/Core/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:sinaapp/View/Widgets/custom_2appbar.dart';
import 'package:sinaapp/View/Widgets/custom_button.dart';
import 'package:sinaapp/View/Widgets/custom_modelsheet.dart';
import 'package:sinaapp/View/Widgets/cutom_selection.dart';
import 'package:sinaapp/View/Widgets/show_buttom.dart';
import 'package:sinaapp/View/Widgets/text_field.dart';
import 'package:uicons/uicons.dart';

// ignore: must_be_immutable
class AddTripScreen extends StatelessWidget {
  AddTripScreen({super.key});

  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ListView(
          controller: _scrollController,
          padding: const EdgeInsets.only(top: 90, bottom: 0),
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: BlocConsumer<DashboardCubit, DashboardState>(
                listener: (context, state) {
                  if (state is DashboardAddTripSuccess) {
                    isLoading = false;
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomModelSheet(
                              height: 350,
                              cancelBtn: true,
                              sheetItems: [
                                Text("data"),
                              ]);
                        });
                  } else if (state is DashboardAddTripLoading) {
                    isLoading = true;
                  } else if (state is DashboardAddTripFailure) {
                    isLoading = false;
                  }
                },
                builder: (context, state) {
                  final controller = BlocProvider.of<DashboardCubit>(context);
                  return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CutomSelection(
                            autovalidateMode: controller.autovalidateMode,
                            contRoller: controller.departLocation,
                            hintText: "Select The Field",
                            valiDator: (val) => controller.emptyValidator(
                                val, 'Depart location'),
                            onSaved: (val) {
                              controller.departLocation.text = val!;
                            },
                            onTap: () {
                              buildModalSheet(
                                returnTypeList: true,
                                context: context,
                                items: controller.placesFrom,
                                textController: controller.departLocation,
                                iconData: UIcons.regularRounded.map_marker,
                                height: 350,
                              );
                            },
                            labelText: 'Depart Location',
                            prefix: Icon(
                              UIcons.regularRounded.navigation,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          //------------------------------------------------------------------ Cs
                          CutomSelection(
                            autovalidateMode: controller.autovalidateMode,
                            hintText: "Select The Field",
                            onSaved: (val) {
                              controller.arrivalLocation.text = val!;
                            },
                            valiDator: (val) => controller.emptyValidator(
                                val, 'Arrival location'),
                            onTap: () {
                              buildModalSheet(
                                returnTypeList: true,
                                context: context,
                                items: controller.placesFrom,
                                textController: controller.arrivalLocation,
                                iconData: UIcons.regularRounded.map_marker,
                                height: 350,
                              );
                            },
                            contRoller: controller.arrivalLocation,
                            labelText: 'Arrival Location',
                            prefix: Icon(
                              UIcons.regularRounded.home_location_alt,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          //------------------------------------------------------------------ Cs
                          CutomSelection(
                            autovalidateMode: controller.autovalidateMode,
                            hintText: "Select The Field",
                            onSaved: (val) {
                              controller.tripType.text = val!;
                            },
                            valiDator: (val) =>
                                controller.emptyValidator(val, 'Trip Type'),
                            onTap: () {
                              buildModalSheet(
                                returnTypeList: true,
                                context: context,
                                items: controller.tripTypes,
                                textController: controller.tripType,
                                iconData: UIcons.regularRounded.ticket,
                                height: 350,
                              );
                            },
                            contRoller: controller.tripType,
                            labelText: 'Trip Type',
                            prefix: Icon(
                              UIcons.regularRounded.ticket,
                              color: Colors.black,
                            ),
                          ),
                          //------------------------------------------------------------------ Cs
                          const SizedBox(
                            height: 15,
                          ),
                          //------------------------------------------------------------------ Cs
                          CutomSelection(
                            autovalidateMode: controller.autovalidateMode,
                            hintText: "Select The Field",
                            onSaved: (val) {
                              controller.tripDate.text = val!;
                            },
                            valiDator: (val) =>
                                controller.emptyValidator(val, 'Trip Date'),
                            onTap: () {
                              buildModalSheet(
                                  returnTypeTime: false,
                                  returnTypeList: false,
                                  context: context,
                                  textController: controller.tripDate,
                                  height: 370);
                            },
                            contRoller: controller.tripDate,
                            labelText: 'Trip Date',
                            prefix: Icon(
                              UIcons.regularRounded.calendar_lines,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          //------------------------------------------------------------------ Cs
                          Row(
                            children: [
                              Expanded(
                                child: CutomSelection(
                                  autovalidateMode: controller.autovalidateMode,
                                  hintText: "Select The Field",
                                  valiDator: (val) => controller.emptyValidator(
                                      val, 'Depart Time'),
                                  onSaved: (val) {
                                    controller.departTime.text = val!;
                                  },
                                  onTap: () {
                                    buildModalSheet(
                                      returnTypeTime: true,
                                      returnTypeList: false,
                                      context: context,
                                      textController: controller.departTime,
                                      height: 370,
                                    );
                                  },
                                  contRoller: controller.departTime,
                                  labelText: 'Depart Trip Time',
                                  prefix: Icon(
                                    UIcons.regularRounded.time_add,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: CutomSelection(
                                  autovalidateMode: controller.autovalidateMode,
                                  hintText: "Select The Field",
                                  valiDator: (val) => controller.emptyValidator(
                                      val, 'Arrival Time'),
                                  onSaved: (val) {
                                    controller.arrivalTime.text = val!;
                                  },
                                  labelText: 'Arrival Trip Time',
                                  onTap: () {
                                    buildModalSheet(
                                      returnTypeTime: true,
                                      returnTypeList: false,
                                      context: context,
                                      textController: controller.arrivalTime,
                                      height: 370,
                                    );
                                  },
                                  contRoller: controller.arrivalTime,
                                  prefix: Icon(
                                    UIcons.regularRounded.time_quarter_past,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          //------------------------------------------------------------------ Cs
                          CutomSelection(
                            autovalidateMode: controller.autovalidateMode,
                            hintText: "Select The Field",
                            valiDator: (val) =>
                                controller.emptyValidator(val, 'Bus Type'),
                            onSaved: (val) {
                              controller.busTypes.text = val!;
                            },
                            contRoller: controller.busTypes,
                            labelText: 'Bus Type',
                            onTap: () {
                              buildModalSheet(
                                returnTypeList: true,
                                context: context,
                                items: controller.busesTypes,
                                textController: controller.busTypes,
                                iconData: UIcons.regularRounded.bus,
                                height: 300,
                              );
                            },
                            prefix: Icon(
                              UIcons.regularRounded.bus,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomInput(
                            autovalidMode: controller.autovalidateMode,
                            contRoller: controller.tripPrice,
                            inputFormat: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            prefix: Icon(
                              UIcons.regularRounded.badge_dollar,
                              color: Colors.black,
                            ),
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: false,
                              decimal: false,
                            ),
                            fillColor: const Color.fromARGB(255, 228, 232, 238),
                            labelText: "Price",
                            hintText: "000.0",
                            fontSize: 17,
                            maxLenght: 20,
                            valiDator: (val) =>
                                controller.emptyValidator(val, 'Price'),
                            onSaved: (val) {
                              controller.tripPrice.text = val!;
                            },
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            isLoading: isLoading,
                            btnWidth: 0.8,
                            bgColor: const Color.fromARGB(255, 8, 15, 56),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                final departLocation =
                                    controller.departLocation.text;
                                final arrivalLocation =
                                    controller.arrivalLocation.text;
                                final tripType = controller.tripType.text;

                                final tripDate = controller.tripDate.text;
                                final departTime = controller.departTime.text;
                                final arrivalTime = controller.arrivalTime.text;
                                final pricePerSeat =
                                    double.tryParse(controller.tripPrice.text);
                                final busType = controller.busTypes.text;
                                if (pricePerSeat == null) {
                                  print(
                                      "Invalid price. Please enter a valid number.");
                                  return;
                                }

                                await controller.addTripToFirestore(
                                  formKey: formKey,
                                  departLocation: departLocation,
                                  arrivalLocation: arrivalLocation,
                                  tripType: tripType,
                                  tripDate:
                                      DateFormat("yyyy-MM-dd").parse(tripDate),
                                  departTime: DateFormat("hh:mm a")
                                      .parseStrict(departTime),
                                  arrivalTime: DateFormat("hh:mm a")
                                      .parseStrict(arrivalTime),
                                  pricePerSeat: pricePerSeat,
                                  busType: busType,
                                );
                              }
                            },
                            btnText: "Add Trip",
                            btnHeight: 55,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
        CustomSecoundAppBar(
          iconData: UIcons.regularRounded.apps_add,
          labelText: "Add Trip",
          subTxt: "Manage Uni Trips",
        )
      ]),
    );
  }
}
