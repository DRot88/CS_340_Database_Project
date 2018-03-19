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

    /* Add Job */

    /* Adds a job, redirects to the Jobs page after adding */

   router.post('/', function(req, res){
        console.log(req.body);
        var sql = "INSERT INTO Jobs (name, oop) VALUES (?,?)";
        var inserts = [req.body.name, req.body.oop];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/jobs');
            }
        });
    });

      return router;
}();