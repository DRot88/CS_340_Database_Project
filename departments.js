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

      return router;
}();