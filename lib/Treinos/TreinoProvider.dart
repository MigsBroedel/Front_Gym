import 'package:flutter/foundation.dart';
import 'package:gym/Treinos/ExercicioObj.dart';
import 'dart:convert';
import 'dart:core';
import 'package:gym/Treinos/TreinoObj.dart';

class TreinoProvider with ChangeNotifier {

  List<dynamic> ListExercises = [];

  List<Map<String, dynamic>> ListWorkouts = [];


  void AddEx (Map<String, dynamic> obj) {
    ListExercises.add(obj);
    print("list exercises: ${ListExercises}");
    notifyListeners();
  }



  void RmEx (ExercicioObj obj) {
    int index = ListExercises.indexWhere((element) => element == obj);
    ListExercises.removeAt(index);
    print("Lista: ${ListExercises}");
    notifyListeners();
  }


}
