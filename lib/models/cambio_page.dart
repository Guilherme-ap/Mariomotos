import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class CambioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Câmbio de Motos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildContent(),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Câmbio de Motos',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'O câmbio de uma motocicleta é responsável por alterar as marchas para otimizar a velocidade e a eficiência do motor em diferentes situações de condução.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Principais características do câmbio:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        _buildListItem('Troca de marchas'),
        _buildListItem('Embreagem'),
        _buildListItem('Relação de marchas'),
        SizedBox(height: 16),
        Text(
          'Manutenção do câmbio:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        _buildListItem('Troca de óleo regular'),
        _buildListItem('Ajuste da embreagem'),
        _buildListItem('Inspeção de engrenagens'),
      ],
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_forward,
            size: 16,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
