// Importações
const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

// Configuração do Express e do bodyParser
const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Configuração da conexão com o banco de dados
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // Sua senha do banco de dados
  database: 'mariomotos',
});

// Rota para cadastrar um novo usuário
app.post('/usuarios', (req, res) => {
  const { nome, email, senha } = req.body;
  const insertQuery = 'INSERT INTO users (nome, email, senha) VALUES (?, ?, ?)';
  connection.query(insertQuery, [nome, email, senha], (err, results) => {
    if (err) {
      console.error('Erro ao inserir dados na tabela:', err);
      res.status(500).send('Erro ao registrar usuário');
      return;
    }
    res.status(200).send('Usuário registrado com sucesso!');
  });
});

// Rota para obter todos os usuários
app.get('/usuarios', (req, res) => {
  connection.query('SELECT * FROM users', (err, results) => {
    if (err) {
      console.error('Erro ao buscar usuários:', err);
      res.status(500).send('Erro ao buscar usuários');
      return;
    }
    res.status(200).json(results);
  });
});

// Rota para atualizar um usuário existente
app.put('/usuarios/:id', (req, res) => {
  const { id } = req.params;
  const { nome, email, senha } = req.body;
  const updateQuery = 'UPDATE users SET nome=?, email=?, senha=? WHERE id=?';
  connection.query(updateQuery, [nome, email, senha, id], (err, results) => {
    if (err) {
      console.error('Erro ao atualizar usuário:', err);
      res.status(500).send('Erro ao atualizar usuário');
      return;
    }
    res.status(200).send('Usuário atualizado com sucesso!');
  });
});

// Rota para excluir um usuário
app.delete('/usuarios/:id', (req, res) => {
  const { id } = req.params;
  const deleteQuery = 'DELETE FROM users WHERE id=?';
  connection.query(deleteQuery, [id], (err, results) => {
    if (err) {
      console.error('Erro ao excluir usuário:', err);
      res.status(500).send('Erro ao excluir usuário');
      return;
    }
    res.status(200).send('Usuário excluído com sucesso!');
  });
});

// Iniciar o servidor na porta desejada
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});

module.exports = app;
