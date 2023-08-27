// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomerModel {
  final String name;
  final String typeCustomer;
  final String email;
  final int idCity;
  final String address;
  final String addressNumber;
  final String neighborhood;
  final String cep;
  final String phone;
  final String cpf;
  final bool? simplesNacional;
  final bool? consumidorFinal;
  final String? situacao;

  CustomerModel({
    required this.name,
    required this.typeCustomer,
    required this.email,
    required this.idCity,
    required this.address,
    required this.addressNumber,
    required this.neighborhood,
    required this.cep,
    required this.phone,
    required this.cpf,
    this.simplesNacional = false,
    this.consumidorFinal = true,
    this.situacao = 'ATIVO',
  });

  List<Map<String, dynamic>> toMap() {
    return [
      <String, dynamic>{
        'nome': name,
        'tipoPessoa': typeCustomer,
        'clienteFisica': {
          'cpf': cpf,
          'rg': cpf,
        },
        'cidade': {'id': 32},
        'email': email,
        'endereco': {
          'logradouro': address,
          'bairro': neighborhood,
          'cep': cep,
          'numero': addressNumber,
        },
        'telefone': phone,
        'simplesNacional': simplesNacional,
        'consumidorFinal': consumidorFinal,
        'situacao': situacao,
      }
    ];
  }
}
