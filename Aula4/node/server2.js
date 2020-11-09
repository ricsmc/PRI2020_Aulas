var http = require('http')
var meta = require('./mod1')

var servidor = http.createServer(function(req,res){
    res.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});
    res.write("Criada com node.js por " + meta.myName() + " em " + meta.myDateTime() + " de " + meta.instituicao)
    res.end();
});

servidor.listen(7777);

console.log('Servidor aberto na porta 7777..')