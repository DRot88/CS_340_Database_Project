var express = require('express');
var mysql = require('./dbcon.js');

var app = express();
var handlebars = require('express-handlebars').create({defaultLayout:'main'});

app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.set('port', process.argv[2]);

app.get('/',function(req,res,next){
  var context = {};
    mysql.pool.query('SELECT * FROM Employees', function(err, rows, fields){
      if(err) {
        next(err);
        console.log('Failure!');
        return;
      }
		  context.results = JSON.stringify(rows);
		  res.render('home',context);
      console.log('Success!');
		});
});


app.use('/employees', require('./employees.js'));
app.use('/departments', require('./departments.js'));
app.use('/jobs', require('./jobs.js'));
app.use('/sows', require('./sows.js'));

app.use(function(req,res){
  res.status(404);
  res.render('404');
});

app.use(function(err, req, res, next){
  console.error(err.stack);
  res.status(500);
  res.render('500');
});

app.listen(app.get('port'), function(){
  console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
});
