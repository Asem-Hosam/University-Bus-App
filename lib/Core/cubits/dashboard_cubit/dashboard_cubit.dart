import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  // TextEditingControllers for your fields
  TextEditingController tripDate = TextEditingController();
  TextEditingController departLocation = TextEditingController();
  TextEditingController arrivalLocation = TextEditingController();
  TextEditingController tripType = TextEditingController();
  TextEditingController departTime = TextEditingController();
  TextEditingController arrivalTime = TextEditingController();
  TextEditingController busTypes = TextEditingController();
  TextEditingController tripPrice = TextEditingController();

  CollectionReference trips = FirebaseFirestore.instance.collection('trips');

  // Example list data
  List<String> placesFrom = ["Ismalia", "Port Said", "Cairo"];
  List<String> busesTypes = [
    "Small Bus - (15)",
    "Med Bus - (32)",
    "Big Bus - (50)"
  ];
  List<String> tripTypes = ["Round Trip", "One Way"];

  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  // Function to generate a serial number
  String generateSerialNumber() {
    final random = Random();
    return List.generate(14, (_) => random.nextInt(10)).join();
  }

  // Empty validator
  String? emptyValidator(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  // Function to calculate trip duration
  String calculateTripDuration(DateTime departTime, DateTime arrivalTime) {
    Duration duration = arrivalTime.difference(departTime);

    if (duration.isNegative) {
      duration += Duration(hours: 24);
    }

    int hours = duration.inHours;
    int minutes = duration.inMinutes % 60;

    return "$hours:$minutes";
  }

  // Function to add trip data to Firestore
  Future<void> addTripToFirestore({
    required String departLocation,
    required String arrivalLocation,
    required String tripType,
    required DateTime tripDate,
    required DateTime departTime,
    required DateTime arrivalTime,
    required double pricePerSeat,
    required String busType,
    required GlobalKey<FormState> formKey,
  }) async {
    emit(DashboardAddTripLoading());

    int totalSeats;
    switch (busType) {
      case 'Small Bus - (15)':
        totalSeats = 15;
        break;
      case 'Med Bus - (32)':
        totalSeats = 32;
        break;
      case 'Big Bus - (50)':
        totalSeats = 50;
        break;
      default:
        throw Exception('Invalid bus type');
    }

    try {
      // Store dates and times in a consistent format
      await trips.add({
        'serialNumber': generateSerialNumber(),
        'departLocation': departLocation,
        'arrivalLocation': arrivalLocation,
        'tripType': tripType,
        'tripDate': tripDate, // As DateTime object
        'departTime': departTime, // As DateTime object
        'arrivalTime': arrivalTime, // As DateTime object
        'durationTime': calculateTripDuration(departTime, arrivalTime),
        'pricePerSeat': pricePerSeat,
        'busType': busType,
        'totalSeats': totalSeats,
        'availableSeats': totalSeats,
      }).then((value) {
        print("trip Adedd $value");
        autovalidateMode = AutovalidateMode.disabled;
      });
      emit(DashboardAddTripSuccess());
      resetFormState(formKey);
    } catch (e) {
      emit(DashboardAddTripFailure());
      print('Error adding trip to Firestore: $e');
    }
  }

  void resetFormState(GlobalKey<FormState> formKey) {
    if (formKey.currentState != null) {
      formKey.currentState!.reset();
      tripDate.clear();
      departLocation.clear();
      arrivalLocation.clear();
      tripType.clear();
      departTime.clear();
      arrivalTime.clear();
      tripPrice.clear();
      busTypes.clear();
    }
  }
}
