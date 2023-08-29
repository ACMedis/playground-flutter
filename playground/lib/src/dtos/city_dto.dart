// ignore_for_file: public_member_api_docs, sort_constructors_first
class CityDTO {
  final int id;
  final int codeErp;
  final String name;
  final String uf;
  final bool active;

  CityDTO({
    required this.id,
    required this.codeErp,
    required this.name,
    required this.uf,
    required this.active,
  });

  factory CityDTO.fromMap(dynamic json) {
    return switch (json) {
      {
        'id': int id,
        'codigoErp': int codeErp,
        'nome': String name,
        'estado': String uf,
        'ativo': bool active,
      } =>
        CityDTO(
          id: id,
          codeErp: codeErp,
          name: name,
          uf: uf,
          active: active,
        ),
      _ => throw ArgumentError('Invalid JSON'),
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'codeErp': codeErp,
      'name': name,
      'uf': uf,
      'active': active,
    };
  }
}
