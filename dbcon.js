var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_rotenbed',
  password        : '6978',
  database        : 'cs340_rotenbed'
});

module.exports.pool = pool;
