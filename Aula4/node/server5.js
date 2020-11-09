var http = require('http')
var fs = require('fs');

var servidor = http.createServer(function(req,res){
   fs.readFile('poema.html', function(err, data){
       if(err){
           console.log('ERRO na leitura do ficheiro: ' + err)
           res.writeHead(200,{'Content-Type':'text/html; charset=utf-8'})
           res.write("<p>Ficheiro inexistente.</p>")
           res.end()
       }
       else{
        res.writeHead(200,{'Content-Type':'text/html; charset=utf-8'})
        res.write(data)
        res.end()
       }
       
       
   })
});

servidor.listen(7777);

console.log('Servidor aberto na porta 7777..')