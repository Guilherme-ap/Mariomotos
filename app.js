
const express = require('express');
const bodyParser = require('body-parser');
const UserController = require('./Controller/UserController.js');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Use o controlador de usuário como uma rota no servidor
app.use('/usuarios', UserController);

