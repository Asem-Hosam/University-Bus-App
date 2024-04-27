import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinaapp/Core/cubits/cubit/search_cubit.dart';
import 'package:sinaapp/View/Widgets/appbar_custom.dart';
import 'package:sinaapp/View/Widgets/custom_button.dart';
import 'package:sinaapp/View/Widgets/cutom_selection.dart';
import 'package:sinaapp/View/Widgets/show_buttom.dart';
import 'package:uicons/uicons.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _startPlace = TextEditingController();

  void _updateSelectedCountry(String country) {
    setState(() {
      _startPlace.text = country;
    });
  }

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          const CustomSPappBar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 224, 220, 220),
                        width: 1.0,
                      ),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DefaultTabController(
                        length: 2,
                        animationDuration: const Duration(seconds: 1),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 6,
                              ),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 219, 227, 238),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13)),
                              ),
                              child: TabBar(
                                  onTap: (value) {
                                    setState(() {
                                      currentPageIndex = value;
                                    });
                                    print(currentPageIndex);
                                  },
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: const Color.fromARGB(255, 8, 15, 56),
                                  ),
                                  tabs: [
                                    Tab(
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Icon(
                                                UIcons
                                                    .regularRounded.paper_plane,
                                                size: 20,
                                              ),
                                            ),
                                            const Text("One Way")
                                          ]),
                                    ),
                                    Tab(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Icon(
                                                UIcons.regularRounded
                                                    .arrows_repeat,
                                                size: 20,
                                              ),
                                            ),
                                            const Text("Round Tirp")
                                          ]),
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 330,
                              child: BlocBuilder<SearchCubit, SearchState>(
                                builder: (context, state) {
                                  final controller =
                                      BlocProvider.of<SearchCubit>(context);
                                  return TabBarView(
                                    physics: const ScrollPhysics(),
                                    children: [
                                      Form(
                                          child: Column(
                                        children: [
                                          CutomSelection(
                                            onTap: () {
                                              buildModalSheet(
                                                iconData: UIcons
                                                    .regularRounded.navigation,
                                                context: context,
                                                items: controller.placesFrom,
                                                textController:
                                                    controller.departLocation,
                                                returnTypeList: true,
                                              );
                                            },
                                            contRoller:
                                                controller.departLocation,
                                            labelText: 'From',
                                            prefix: Icon(
                                              UIcons.regularRounded.navigation,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          CutomSelection(
                                            contRoller:
                                                controller.arrivalLocation,
                                            onTap: () {
                                              buildModalSheet(
                                                iconData: UIcons
                                                    .regularRounded.navigation,
                                                context: context,
                                                items: controller.placesFrom,
                                                textController:
                                                    controller.arrivalLocation,
                                                returnTypeList: true,
                                              );
                                            },
                                            labelText: 'To',
                                            prefix: Icon(
                                              UIcons.regularRounded
                                                  .home_location_alt,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 14,
                                          ),
                                          CutomSelection(
                                            contRoller: controller.departDate,
                                            onTap: () {
                                              buildModalSheet(
                                                height: 370,
                                                returnTypeList: false,
                                                returnTypeTime: false,
                                                iconData: UIcons
                                                    .regularRounded.navigation,
                                                context: context,
                                                textController:
                                                    controller.departDate,
                                              );
                                            },
                                            labelText: 'Departure Date',
                                            prefix: Icon(
                                              UIcons.regularRounded
                                                  .calendar_lines,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          CustomButton(
                                            btnWidth: 0.9,
                                            bgColor: const Color.fromARGB(
                                                255, 8, 15, 56),
                                            onPressed: () => {},
                                            btnText: "Search Ticket",
                                            btnHeight: 53,
                                          ),
                                        ],
                                      )),
                                      Form(
                                          child: Column(
                                        children: [
                                          CutomSelection(
                                            onTap: () {
                                              buildModalSheet(
                                                context: context,
                                                textController:
                                                    controller.arrivalLocation,
                                                returnTypeList: true,
                                                items: controller.placesFrom,
                                              );
                                            },
                                            contRoller:
                                                controller.arrivalLocation,
                                            labelText: 'From',
                                            prefix: Icon(
                                              UIcons.regularRounded.navigation,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          CutomSelection(
                                            labelText: 'To',
                                            prefix: Icon(
                                              UIcons.regularRounded
                                                  .home_location_alt,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 14,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CutomSelection(
                                                  labelText: 'Departure Date',
                                                  prefix: Icon(
                                                    UIcons.regularRounded
                                                        .calendar_lines,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Expanded(
                                                child: CutomSelection(
                                                  labelText: 'Return Date',
                                                  prefix: Icon(
                                                    UIcons.regularRounded
                                                        .calendar_lines,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          CustomButton(
                                            btnWidth: 0.9,
                                            bgColor: const Color.fromARGB(
                                                255, 8, 15, 56),
                                            onPressed: () => {},
                                            btnText: "Search Ticket",
                                            btnHeight: 53,
                                          ),
                                        ],
                                      ))
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
