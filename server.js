// server.js

const express = require('express');
const bodyParser = require('body-parser');
const UserController = require('/back-end/Controller/UserController.js');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Use o controlador de usuário como uma rota no servidor
app.use('/usuarios', UserController);

const PORT = 3000; // Defina a porta do seu servidor
app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});
