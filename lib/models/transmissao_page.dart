import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class TransmissaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transmissão de Motos'),
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
          'Transmissão de Motos',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'A transmissão de uma motocicleta é uma das partes mais importantes do sistema mecânico. Ela é responsável por transferir a potência do motor para a roda traseira da moto.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Principais componentes da transmissão:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        _buildListItem('Corrente de transmissão'),
        _buildListItem('Coroa'),
        _buildListItem('Pinhão'),
        SizedBox(height: 16),
        Text(
          'Manutenção da transmissão:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        _buildListItem('Lubrificação adequada'),
        _buildListItem('Verificação da tensão da corrente'),
        _buildListItem('Inspeção periódica dos componentes'),
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
