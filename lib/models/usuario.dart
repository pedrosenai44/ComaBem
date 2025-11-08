class Usuario {
  final int? id;
  final String nome;
  final String login;
  final String senha;

  Usuario({this.id, required this.nome, required this.login, required this.senha});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'login': login,
      'senha': senha,
    };
  }
}
