class Food {
  String nome;
  int calorias;
  int idAlimento;
  int idGrupo;

  Food({this.nome, this.calorias, this.idAlimento, this.idGrupo});

  Food.fromJson(Map json)
      : nome = json['nome'],
        calorias = json['calorias'],
        idAlimento = json['id_alimento'],
        idGrupo = json['id_grupo'];
}
