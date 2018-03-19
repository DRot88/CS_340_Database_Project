module.exports = function(){
    var express = require('express');
    var router = express.Router();
    var mysql = require('./dbcon.js');

    function getEmployees(res, mysql, context){
        mysql.pool.query("SELECT id, first_name, last_name, title, dept_id_fk, salary, hourly_rate FROM Employees", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.employees = results;
            res.render('employees', context);
        });
    }

    /*Display all people.*/

    router.get('/', function(req, res){
        var context = {};
        getEmployees(res, mysql, context);
    });

    // /* Display one person for the specific purpose of updating people */

    // router.get('/:id', function(req, res){
    //     callbackCount = 0;
    //     var context = {};
    //     context.jsscripts = ["selectedplanet.js", "updateperson.js"];
    //     var mysql = req.app.get('mysql');
    //     getPerson(res, mysql, context, req.params.id, complete);
    //     getPlanets(res, mysql, context, complete);
    //     function complete(){
    //         callbackCount++;
    //         if(callbackCount >= 2){
    //             res.render('update-person', context);
    //         }

    //     }
    // });

    /* Add Employee */

    /* Adds an Employee, redirects to the Employees page after adding */

   router.post('/', function(req, res){
        console.log(req.body);
        var sql = "INSERT INTO Employees (first_name, last_name, title, salary, hourly_rate, dept_id_fk) VALUES (?,?,?,?,?,?)";
        var inserts = [req.body.fname, req.body.lname, req.body.title, req.body.salary, req.body.hourlyRate, req.body.department];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/employees');
            }
        });
    });

    //  The URI that update data is sent to in order to update a person 

    // router.put('/:id', function(req, res){
    //     var mysql = req.app.get('mysql');
    //     var sql = "UPDATE bsg_people SET fname=?, lname=?, homeworld=?, age=? WHERE id=?";
    //     var inserts = [req.body.fname, req.body.lname, req.body.homeworld, req.body.age, req.params.id];
    //     sql = mysql.pool.query(sql,inserts,function(error, results, fields){
    //         if(error){
    //             res.write(JSON.stringify(error));
    //             res.end();
    //         }else{
    //             res.status(200);
    //             res.end();
    //         }
    //     });
    // });

    // /* Route to delete a person, simply returns a 202 upon success. Ajax will handle this. */

    // router.delete('/:id', function(req, res){
    //     var mysql = req.app.get('mysql');
    //     var sql = "DELETE FROM bsg_people WHERE id = ?";
    //     var inserts = [req.params.id];
    //     sql = mysql.pool.query(sql, inserts, function(error, results, fields){
    //         if(error){
    //             res.write(JSON.stringify(error));
    //             res.status(400);
    //             res.end();
    //         }else{
    //             res.status(202).end();
    //         }
    //     })
    // })

    return router;
}();
