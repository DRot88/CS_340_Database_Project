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

    /* Add to SOW */

    /* Adds information regarding SOW, redirects to the sow page after adding */

   router.post('/', function(req, res){
        console.log(req.body);
        var sql = "INSERT INTO Scope_of_Works (sow_id, job_id_fk, emp_id_fk, fee) VALUES (?,?,?,?)";
        var inserts = [req.body.SOW_ID, req.body.SOWJobID, req.body.SOWempID, req.body.fee];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/sows');
            }
        });
    });    

      return router;
}();