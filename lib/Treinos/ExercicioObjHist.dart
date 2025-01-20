

class ExercicioObjHist {
  final int id;
  final String userid;
  final int serie;
  final String nome;
  final int repeticoes;
  final int carga;

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "series": serie,
      "exercicioid": id,
      "repeticoes": repeticoes,
      "carga": carga,
      "userid": userid
    };
  }

  ExercicioObjHist({required this.id, required this.serie, required this.nome, this.carga = 0, this.repeticoes = 0, required this.userid});


}
