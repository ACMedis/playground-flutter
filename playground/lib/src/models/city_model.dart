// ignore_for_file: public_member_api_docs, sort_constructors_first
class CityModel {
  final int id;
  final int codeErp;
  final String name;
  final String uf;

  CityModel({
    required this.id,
    required this.codeErp,
    required this.name,
    required this.uf,
  });

  factory CityModel.fromMap(dynamic json) {
    return switch (json) {
      {
        'id': int id,
        'codigoErp': int codeErp,
        'nome': String name,
        'estado': String uf,
      } =>
        CityModel(
          id: id,
          codeErp: codeErp,
          name: name,
          uf: uf,
        ),
      _ => throw ArgumentError('Invalid JSON'),
    };
  }
}
