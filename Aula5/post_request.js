const axios = require ('axios');

for(var i= 1; i<= 10; i++){
axios.post('http://localhost:3000/instrumentos', {
    "id": "X" + i,
    "#text": "Castanholas"
}).then(resp => {
    console.log(resp.data);
}).catch(error => {
    console.log('Erro: ' + error);
});
}