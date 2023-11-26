import 'package:flutter/material.dart';

class Usuario {
  String nome;
  String email;
  String senha;

  Usuario({
    required this.nome,
    required this.email,
    required this.senha,
  });
}

class PaginaAdministrador extends StatefulWidget {
  @override
  _PaginaAdministradorState createState() => _PaginaAdministradorState();
}

class _PaginaAdministradorState extends State<PaginaAdministrador> {
  List<Usuario> usuarios = [
    Usuario(nome: 'João', email: 'joao@example.com', senha: 'senha123'),
    Usuario(nome: 'Maria', email: 'maria@example.com', senha: 'senha456'),
    // Adicione mais usuários conforme necessário
  ];

  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  int selectedIndex = -1;

  void editarUsuario() {
    if (selectedIndex != -1) {
      setState(() {
        usuarios[selectedIndex].nome = nomeController.text;
        usuarios[selectedIndex].email = emailController.text;
        usuarios[selectedIndex].senha = senhaController.text;
        selectedIndex = -1;
      });
      _limparCampos();
    }
  }

  void excluirUsuario(int index) {
    setState(() {
      usuarios.removeAt(index);
      selectedIndex = -1;
    });
  }

  void _limparCampos() {
    nomeController.clear();
    emailController.clear();
    senhaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página do Administrador'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Adicionar Usuário'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: nomeController,
                            decoration: InputDecoration(
                              labelText: 'Nome do Usuário',
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: senhaController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _limparCampos();
                          },
                          child: Text('Cancelar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              usuarios.add(
                                Usuario(
                                  nome: nomeController.text,
                                  email: emailController.text,
                                  senha: senhaController.text,
                                ),
                              );
                              Navigator.of(context).pop();
                              _limparCampos();
                            });
                          },
                          child: Text('Salvar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Adicionar Usuário'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(usuarios[index].nome),
                    subtitle: Text(usuarios[index].email),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              selectedIndex = index;
                              nomeController.text = usuarios[index].nome;
                              emailController.text = usuarios[index].email;
                              senhaController.text = usuarios[index].senha;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => excluirUsuario(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: editarUsuario,
              child: Text('Salvar Alterações'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaginaAdministrador(),
  ));
}
