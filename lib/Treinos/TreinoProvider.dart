import 'package:flutter/foundation.dart';
import 'package:gym/Treinos/ExercicioObj.dart';
import 'package:gym/Treinos/ExercicioObjHist.dart';
import 'dart:convert';
import 'dart:core';
import 'package:gym/Treinos/TreinoObj.dart';

class TreinoProvider with ChangeNotifier {

  List<dynamic> ListExercises = [];

  List<dynamic> ListExercisesEdit = [];

  List<Map<String, dynamic>> ListWorkouts = [];

  List<Map<String, dynamic>> ListExercisesDid = [];


  void AddExDid (Map<String, dynamic> obj) {
    ListExercisesDid.add(obj);
    print("list exercises: ${ListExercisesDid}");
    notifyListeners();
  }

  void RmExDid (ExercicioObjHist obj) {
    int index = ListExercisesDid.indexWhere((element) => element == obj);
    if (index != -1) {
      // O item foi encontrado, pode remover
      ListExercisesDid.removeAt(index);
      print("Lista atualizada: $ListExercisesDid");
      notifyListeners();
    } else {
      // O item não foi encontrado
      print("Erro: O item não está na lista.");
    }
    notifyListeners();
  }

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

  void AddExEdit (Map<String, dynamic> obj) {
    ListExercisesEdit.add(obj);
    print("list exercises: ${ListExercisesEdit}");
    notifyListeners();
  }


  void RmExEdit (ExercicioObj obj) {
    int index = ListExercisesEdit.indexWhere((element) => element == obj);
    ListExercisesEdit.removeAt(index);
    print("Lista: ${ListExercisesEdit}");
    notifyListeners();
  }


}
