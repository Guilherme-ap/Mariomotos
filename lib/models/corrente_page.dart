import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class CorrentePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corrente de Motos'),
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
          'Corrente de Motos',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'A corrente de uma motocicleta faz parte do sistema de transmissão final, transferindo a potência do câmbio para a roda traseira.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Principais características da corrente:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        _buildListItem('Lubrificação'),
        _buildListItem('Tensão correta'),
        _buildListItem('Desgaste'),
        SizedBox(height: 16),
        Text(
          'Manutenção da corrente:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        _buildListItem('Limpeza regular'),
        _buildListItem('Ajuste da tensão'),
        _buildListItem('Substituição quando desgastada'),
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
