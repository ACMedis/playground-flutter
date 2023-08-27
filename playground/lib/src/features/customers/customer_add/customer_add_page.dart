import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:playground_app/src/core/ui/helpers/form_helper.dart';
import 'package:playground_app/src/core/ui/helpers/messages.dart';
import 'package:playground_app/src/core/ui/widgets/playground_button.dart';
import 'package:playground_app/src/features/customers/customer_add/customer_add_state.dart';
import 'package:playground_app/src/features/customers/customer_add/customer_add_store.dart';

class CustomerAddPage extends StatefulWidget {
  const CustomerAddPage({super.key});

  @override
  State<CustomerAddPage> createState() => _CustomerAddPageState();
}

class _CustomerAddPageState extends State<CustomerAddPage> {
  final formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _cpfEC = TextEditingController();
  final _addressEC = TextEditingController();
  final _addressNumberEC = TextEditingController();
  final _neighborhoodEC = TextEditingController();
  final _cepEC = TextEditingController();
  final _emailEC = TextEditingController();
  late ReactionDisposer _reactionDisposer;
  final store = Modular.get<CustomerAddStore>();

  @override
  void initState() {
    super.initState();
    _emailEC.text = 'acmedis@gmail.com';
    _addressEC.text = 'RUA ABCD';
    _addressNumberEC.text = '123';
    _cepEC.text = '85806490';
    _neighborhoodEC.text = 'CENTRO';

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _reactionDisposer = reaction((_) => store.state, (state) {
        if (state is CustomerAddErrorState) {
          Messages.showError(state.errorMessage!, context);
        }
        if (state is CustomerAddSavedState) {
          Messages.showSuccess('Cliente salvo com sucesso!', context);
        }
      });
    });
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _cpfEC.dispose();
    _addressEC.dispose();
    _addressNumberEC.dispose();
    _neighborhoodEC.dispose();
    _cepEC.dispose();
    _emailEC.dispose();
    _reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final store = Modular.get<CustomerAddStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo cliente'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameEC,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(label: Text('Nome')),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _cpfEC,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(label: Text('CPF')),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _addressEC,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(label: Text('Endereço')),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _addressNumberEC,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(label: Text('Número')),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _neighborhoodEC,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(label: Text('Bairro')),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _cepEC,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(label: Text('CEP')),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailEC,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(label: Text('E-mail')),
                ),
                const SizedBox(height: 12),
                PlaygroundButton(
                  label: 'SALVAR',
                  onPressed: () {
                    switch (formKey.currentState?.validate()) {
                      case (null || false):
                        Messages.showError('Formulário inválido', context);
                        break;
                      case true:
                        store.register(
                          name: _nameEC.text,
                          cpf: _cpfEC.text,
                          address: _addressEC.text,
                          addressNumber: _addressNumberEC.text,
                          neighborhood: _neighborhoodEC.text,
                          email: _emailEC.text,
                          cep: _cepEC.text,
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
