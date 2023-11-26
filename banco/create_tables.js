const mysql = require('mysql2');

// Configuração da conexão com o banco de dados
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // Sua senha do banco de dados
  database: 'mariomotos',
});

// Conectar ao banco de dados
connection.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err);
    return;
  }
  console.log('Conexão bem-sucedida ao banco de dados!');

  // Query para criar uma tabela (exemplo)
  const createTableQuery = `
    CREATE TABLE IF NOT EXISTS users (
      id INT AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(50) NOT NULL,
      email VARCHAR(100) NOT NULL,
      senha VARCHAR(100) NOT NULL
      
    )
  `;

  // Executar a query para criar a tabela
  connection.query(createTableQuery, (err, results) => {
    if (err) {
      console.error('Erro ao criar a tabela:', err);
      return;
    }
    console.log('Tabela criada com sucesso!');
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
