/*

https://github.com/petersirka/node-mongolab
https://github.com/auth0/node-jsonwebtoken
http://code.tutsplus.com/es/tutorials/token-based-authentication-with-angularjs-nodejs--cms-22543

*/

var express = require('express')
var app = express()
var mongodb = require('mongolab-provider').init('pinbuydb', 'o5wMMdzdsFiwqsD6Pd-gh2-rCRmUnk4N');
var jwt = require('jsonwebtoken');

function ensureAuthorized(req, res, next) {
	var bearerToken;
    var bearerHeader = req.headers["authorization"];
    if (typeof bearerHeader !== 'undefined') {
        var bearer = bearerHeader.split(" ");
        bearerToken = bearer[1];
        req.token = bearerToken;
        next();
    } else {
        res.send(403);
    }
}

var errorResponseText='Error in server';

app.use(function(req, res, next) {
	res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type, Authorization');
    next();
});

app.set('json spaces', 2);

app.get('/api/auth/:user/:key', function(req, res) {

	var params = {
		where:{
			username:req.params.user,
			password:req.params.key
		}
	};
  
	mongodb.documents('user', params, function(err,data){

		

			var auth={};

			if(data[0]){
				var token = jwt.sign(data[0], 'shhhhh');
				if(req.params.user === data[0].username && req.params.key === data[0].password){
					auth.token = token;
					res.send(auth);
				}else{
					res.status(401);
					res.send(errorResponseText);
				}
			}else{
				res.status(403);
				res.send(errorResponseText);						
			}

		
	});


});

app.get('/api/me/:id', function(req, res) {

	mongodb.findId('user', req.params.id, function(err,user){

		delete user.password;
		delete user.username;

		res.send(user);

	});

});






app.listen(4000);
console.log("App listening on port 4000");


