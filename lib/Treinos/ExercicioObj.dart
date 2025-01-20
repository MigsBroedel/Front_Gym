

class ExercicioObj {
  final num id;
  final int series;
  final String nome;

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "series": series,
      "id": id
    };
  }

  ExercicioObj({required this.id, this.series = 1, required this.nome});


}
