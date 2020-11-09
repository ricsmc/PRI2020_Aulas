/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar TPC4;

@memmbers {
           Hashtable<String, Integer> produtos = new Hashtable<String, Integer>();
           int total = 0;
}

fatura: (produto)+ (faturas)+
      ;

faturas: FATURA cabecalho corpo {System.out.println("Total de linha: " + $corpo.total);}
       ;

corpo returns [int total]: (movimentos)* {total += $movimentos.total}
         ;

cabecalho: NUM_FAT id_forn id_cli
     ;

id_forn: NOME NIF MORADA NIB
       ;

id_cli: NOME NIF MORADA
      ;

movimentos returns [int total]: REF quant=QUANT {total = quant.int; produtos.replace(}
          ;

produto : PRODUTO DESC PRECO QUANT {produtos.put(PRODUTO, QUANT);}
       ;

PRODUTO: 'produto';
DESC: [a-zA-Z 0-9]+;
PRECO: [1-9][0-9]*'�';
FATURA: 'fatura';
NUM_FAT: [0-9]+;
NOME: [a-zA-Z]+;
NIF: [0-9]{9};
MORADA: [a-zA-Z 0-9]+;
NIB: [0-9]{21};
REF: [a-zA-Z0-9]+;
QUANT: [1-9][0-9]*;
WS: ('\r'?'\n'|'\t'|' ') -> skip;