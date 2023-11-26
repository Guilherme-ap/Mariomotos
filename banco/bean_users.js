const mysql = require('mysql2');

// Configuração da conexão com o banco de dados
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // Sua senha do banco de dados
  database: 'mariomotos',
});

// Dados a serem inseridos na tabela
const usersData = [
  { nome: 'admin', email: 'admin@admin.com', senha: 'admin' },
  { nome: 'flavio', email: 'flavio@mariomotos.com', senha: 'clebernota10' },
 
];

// Conectar ao banco de dados
connection.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err);
    return;
  }
  console.log('Conexão bem-sucedida ao banco de dados!');

  // Query para inserir dados na tabela
  const insertQuery = 'INSERT INTO users (nome, email, senha) VALUES ?';

  // Executar a query para inserir os dados na tabela
  connection.query(insertQuery, [usersData.map(user => [user.nome, user.email, user.senha])], (err, results) => {
    if (err) {
      console.error('Erro ao inserir dados na tabela:', err);
      return;
    }
    console.log('Dados inseridos com sucesso na tabela!');
  });

  // Fechar a conexão após a operação
  connection.end((err) => {
    if (err) {
      console.error('Erro ao fechar a conexão:', err);
      return;
    }
    console.log('Conexão fechada com sucesso!');
  });
});
