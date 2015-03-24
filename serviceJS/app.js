var express = require('express')
var app = express()
var mongodb = require('mongolab-provider').init('pinbuydb', 'o5wMMdzdsFiwqsD6Pd-gh2-rCRmUnk4N');
var jwt = require('jsonwebtoken');

app.set('json spaces', 2);

app.get('/api/user/:user/:key', function(req, res) {
  
	mongodb.documents('user', {where:{username:req.params.user,password:req.params.key}}, function(err,data){


		var auth={};

		var token = jwt.sign(data[0], 'shhhhh');

		if(req.params.user===data[0].username){
			auth.nameExist=true;
		}else{
			auth.nameExist=false;
		}

		if(req.params.key===data[0].password){
			auth.passValid=true;
			auth.token = token;
		}else{
			auth.passValid=false;
		}	

		res.send(auth);

	});


});





app.listen(4000);
console.log("App listening on port 4000");


