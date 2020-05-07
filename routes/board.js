let express = require('express');
let router = express.Router();
let mysql = require('mysql');

let dbconfig = {
    host: process.env.DB,
    user: 'admin',
    password: '12341234',
    port: '3306', 
    database: 'test',
    connectionLimit: 50
}

let connection = mysql.createConnection(dbconfig);

// Home
router.get('/', function(req, res){

    let query = 'select * from board';
    connection.query(query, (err, rows) => {
        res.send(rows);
    })

});

router.post('/add', function(req, res){
    let query = `
            INSERT INTO board(\`name\`, email, reg_date) 
            VALUES(
                '${req.body.name}',
                '${req.body.email}',
                now()
    )`;
    console.log(query);
    connection.query(query, (err, rows) => {
        res.send(rows);
    })
});

module.exports = router;