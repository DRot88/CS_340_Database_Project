module.exports = function(){
    var express = require('express');
    var router = express.Router();
    var mysql = require('./dbcon.js');    

    function getDepartments(res, mysql, context){
        mysql.pool.query("SELECT dept_id, name FROM Departments", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.department = results;
            res.render('departments', context);
        });
    }

    /*Display all departments.*/

    router.get('/', function(req, res){
        var context = {};
        getDepartments(res, mysql, context);
    }); 

    /* Add Department */

    /* Adds a Department, redirects to the Deparments page after adding */

   router.post('/', function(req, res){
        // console.log(req.body.name);
        var sql = "INSERT INTO Departments (name) VALUES (?)";
        var inserts = [req.body.name];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/departments');
            }
        });
    });

      return router;
}();