import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController departLocation = TextEditingController();
  TextEditingController arrivalLocation = TextEditingController();
  TextEditingController departDate = TextEditingController();

  List<String> placesFrom = [
    "Ismalia",
    "Port Said",
    "Cairo",
    "6 Octouber",
    "Zagazig",
  ];
}
