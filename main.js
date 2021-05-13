const Produtos = 
[
    { "codProduto": 1234,
      "descricao": "Computador Dell Inspiron XS 12000 8Gb RAM 1 TB HD Intel i5 4g NVidia 1080",
      "preco": 3500.00,
      "qtdEstoque": 14,
      "disponivel": "sim",
      "emDestaque": "não",
      "departamento" : {
      "idDepto": 800,
      "nomeDepto":"Informatica e acessórios"

     }
    },

    {  "codProduto": 2345,
        "descricao": "Computador Lenovo  8Gb RAM 1 TB HD Intel i3 4g NVidia 1060",
        "preco": 2500.00,
        "qtdEstoque": 975,
        "disponivel": "sim",
        "emDestaque": "sim",
        "departamento" : {
        "idDepto": 800,
        "nomeDepto":"Informatica e acessórios"
     }
    },

    {  "codProduto": 4021,
        "descricao": "Computador Dual core 1 TB HD  8Gb de ram  ",
        "preco": 1500.00,
        "qtdEstoque": 320,
        "disponivel": "não",
        "emDestaque": "sim",
        "departamento" : {
        "idDepto": 800,
        "nomeDepto":"Informatica e acessórios"
     }
    },
 
]

//Quantidade total de itens em estoque (somatória das quantidades de todos os produtos)

function ProdutoTotalEstoque(){

  const totalEstoque = Produtos.reduce((sum , Produto)=>{
      return sum + Produto.qtdEstoque;
  },0)

  console.log(totalEstoque);

}

//Quantidade total de itens em destaque (somatória das quantidades dos itens marcados como "emDestaque : sim")

function DestaqueTotal(){

    var count = 0
    const TotalDestaque = Produtos.reduce((destaque,sum)=>{
        
        if(sum.emDestaque == 'sim'){
            count++
        }
        return destaque + sum.emDestaque;
    },0)


    console.log(`O total em Destaque são :  ${count} `);

}

//Quantidade total de itens disponíveis (similar ao anterior)

function DisponivelTotal(){

    var count = 0;
    const TotalDestaque = Produtos.reduce((disponivel,sum)=>{
        
        if(sum.disponivel == 'sim'){
            count++;
        }
        return disponivel + sum.disponivel;
    },0)


    console.log(`O total Disponivel são :  ${count} `);

}

//Valor total do inventário da empresa (somatória dos valores individuais multiplicado pela quantidade em estoque)

function TotalInvendtario(){

   
    const totalPreco = Produtos.reduce((sum , Produto)=>{
        
        return sum += Produto.preco * Produto.qtdEstoque;
    },0)
   
    console.log(totalPreco);

}


//Somatória de itens por departamento (você deverá retornar um objeto contendo o nome do departamento e o total de itens nele)

function SomaItensDeparatamento(idDepto) {
    const ProdutoD = new Map()
    for (let product of Produtos) {
        ProdutoD.set(product.departamento.nomeDepto, product.qtdEstoque)
    }
    console.log(ProdutoD)

}

//Valor do ticket médio dos produtos da empresa (basicamente o valor total do inventário dividido pelo número de itens)

function ValorMedioTicket() {
    let calc = 0;
    let totalTic = 0;
    let result = 0;
    for(let i = 0; i < Produtos.length; i++){
        calc = calc + Produtos[i].preco * Produtos[i].qtdEstoque;
        totalTic = totalTic + Produtos[i].qtdEstoque;
        result = calc / totalTic;
    }

    console.log(`Valor do ticket Médio: ${result}`);
}

//Ticket médio por departamento (similar ao item anterior, porém retornando uma lista de objetos que contenha o nome do departamento e o seu ticket médio)

function TicketMedioDepartamento(idDepto) {
    let calc = 0;
    let totalTic = 0;
    let resulTic = 0;
    let nameDep = '';
    for(let i = 0; i < Produtos.length; i++){
        if(idDepto === Produtos[i].departamento.idDepto){
            nameDep = Produtos[i].departamento.nomeDepto;
            calc = calc + Produtos[i].preco * Produtos[i].qtdEstoque;
            totalTic = totalTic + Produtos[i].qtdEstoque;
            resulTic = calc / totalTic;
        }
    }
    
    console.log({nameDep, resulTic});
}


//Departamento mais valioso (qual o departamento que tem a maior somatória dos valores dos itens)

function DepartamentoMaisValioso(){
    let calc  = 0
    let nameDep = ''
    for(let i = 0; i < Produtos.length; i++){
        calc =  calc += Produtos[i].preco
        nameDep =  Produtos[i].departamento.nomeDepto;

    }

    console.log(`Departamento mais valioso :${calc} , ${nameDep}`)
}

//Produto mais caro da loja (bem como seu departamento)

function ProdutoMaisCaro(){

    let result = Produtos[1].preco;
    let NomeDep = '';
    let NomePro = '';
    for(let i = 0 ; i < Produtos.length;i++){
        if(result < Produtos[i].preco){
            result = Produtos[i].preco;
            NomeDep = Produtos[i].departamento.nomeDepto;
            NomePro = Produtos[i].descricao;
        }
    }

    console.log(`O produto mais caro é : ${NomePro} . Seu departamento :${NomeDep}`);
}

//Produto mais barato da loja (bem como seu departamento)

function ProdutoMaisBarato(){

    let result = Produtos[0].preco;
    let NomeDep = '';
    let NomePro = '';
    for(let i = 0 ; i < Produtos.length;i++){
        if(result > Produtos[i].preco){
            result = Produtos[i].preco;
            NomeDep = Produtos[i].departamento.nomeDepto;
            NomePro = Produtos[i].descricao;
        }
    }

    console.log(`O produto mais barato é : ${NomePro} , Departamento do produto :${NomeDep}`);
}


