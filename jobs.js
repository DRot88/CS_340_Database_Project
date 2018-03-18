module.exports = function(){
    var express = require('express');
    var router = express.Router();
    var mysql = require('./dbcon.js');    

    function getJobs(res, mysql, context){
        mysql.pool.query("SELECT job_id, name, oop FROM Jobs", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.job = results;
            res.render('jobs', context);
        });
    }

    /*Display all jobs.*/

    router.get('/', function(req, res){
        var context = {};
        getJobs(res, mysql, context);
    });  

      return router;
}();