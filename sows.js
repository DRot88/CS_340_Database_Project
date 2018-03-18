module.exports = function(){
    var express = require('express');
    var router = express.Router();
    var mysql = require('./dbcon.js');    

    function getSows(res, mysql, context){
        mysql.pool.query("SELECT sow_id, job_id_fk, emp_id_fk, fee FROM Scope_of_Works", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.sow = results;
            res.render('sows', context);
        });
    }

    /*Display all jobs.*/

    router.get('/', function(req, res){
        var context = {};
        getSows(res, mysql, context);
    });  

      return router;
}();