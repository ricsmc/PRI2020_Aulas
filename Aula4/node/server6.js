var http = require('http')
var fs = require('fs');

var servidor = http.createServer(function(req,res){
    if(req.url.match(/\/[1-9]$/)){
        var num = req.url.split("/")[1]
        fs.readFile('poema' + num + '.html', function(err, data){
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
    }
    else{
                console.log("ERRO: foi pedido um ficheiro inesperado!")
                res.writeHead(200,{'Content-Type':'text/html; charset=utf-8'})
                res.write("<p>Ficheiro inexistente.</p>")
                res.end()
    }
    
  
       
       
});

servidor.listen(7777);

console.log('Servidor aberto na porta 7777..')