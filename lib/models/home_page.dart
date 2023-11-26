import 'package:flutter/material.dart';
import 'footer.dart';
import 'header.dart';
import 'transmissao_page.dart';
import 'cambio_page.dart';
import 'corrente_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> motoImages = [
    'https://daido.com.br/wp-content/uploads/2018/10/Meio-1.jpg',
    'https://www.motonline.com.br/noticia/wp-content/uploads/2014/01/O-cambio-da-motocicleta.jpg',
    'https://chiptronic.com.br/blog/wp-content/uploads/2017/04/lubrificar-a-corrente-da-moto.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mariomoto - Engrenagens para Motos'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Header(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Categorias de Engrenagens',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildCategoryItem(
                  'Transmissão',
                  'https://daido.com.br/wp-content/uploads/2018/10/Meio-1.jpg',
                  context,
                ),
                _buildCategoryItem(
                    'Câmbio',
                    'https://www.motonline.com.br/noticia/wp-content/uploads/2014/01/O-cambio-da-motocicleta.jpg',
                    context),
                _buildCategoryItem(
                    'Corrente',
                    'https://chiptronic.com.br/blog/wp-content/uploads/2017/04/lubrificar-a-corrente-da-moto.jpg',
                    context),
                // Adicione mais categorias conforme necessário
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
      String categoryName, String imagePath, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(categoryName),
        leading: categoryName == 'Transmissão'
            ? Image.network(
                imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
            : Image.asset(
                imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          if (categoryName == 'Transmissão') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransmissaoPage()),
            );
          } else if (categoryName == 'Câmbio') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CambioPage()),
            );
          } else if (categoryName == 'Corrente') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CorrentePage()),
            );
          }
        },
      ),
    );
  }
}
