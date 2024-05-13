class ExameRecord {
  String id;
  String nomeExame;
  String horarioConsulta;
   double resultado;
  String? idImagem;

  ExameRecord({
    required this.id,
    required this.nomeExame,
    required this.horarioConsulta,
    required this.resultado,
     this.idImagem,
  });

  factory ExameRecord.fromJson(Map<String, dynamic> json) {
    return ExameRecord(
      nomeExame: json['nomeExame'],
      horarioConsulta: json['horario_consulta'],
      resultado: json['resultado'],
      idImagem: json['idImagem'],
      id: json['id']
    );
  }

  Map<String, dynamic> toJson() => {
        'nomeExame': nomeExame,
        'horario_consulta': horarioConsulta,
        'resultado': resultado,
        'idImagem': idImagem,
        'id': id
      };
}

