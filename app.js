const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const ejs = require('ejs')
const app = express();
const bodyparser = require('body-parser');

// middleware
app.set('view engine', 'ejs');
app.use(express.static(__dirname+'/public'));
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({extended:false}));

// routes
const boardRouter = require('./routes/board');
const healthRouter = require('./routes/health');
app.use('/board', boardRouter);
app.use('/health', healthRouter);

const port = 4000;
app.listen(port, () => console.log(`start with port: ${port}`));
