## 1) 1 consulta contemplando contagem ou totalização
SELECT COUNT(*) AS TOTAL FROM PRODUTOS;

## 2) 1 consulta contemplando a junção entre 2 tabelas
SELECT PRODUTOS.NOME,PRODUTOS.PRECO,DEPARTAMENTOS.NOME_DEPARTAEMNTO ,DEPARTAMENTOS.ID_DEPARTAMENTO FROM PRODUTOS INNER JOIN DEPARTAMENTOS ON PRODUTOS.ID = DEPARTAMENTOS.ID_DEPARTAMENTO;

## 3) 1 consulta contemplando a junção entre 3 tabelas
SELECT CLIENTES.NOME,ENDERECOS.CIDADE,PEDIDOS.VALORPEDIDO FROM CLIENTES JOIN ENDERECOS JOIN PEDIDOS ON CLIENTES.ID_CLIENTES = PEDIDOS.PEDIDOSCLIENTES AND CLIENTES.ID_CLIENTES = ENDERECOS.ENDERECOCLIENTE;

## 4) 1 consulta contemplando a junção entre 2 tabelas + uma operação de totalização e agrupamento
SELECT COUNT(*) AS TOTAL_PRODUTO,DEPARTAMENTOS.NOME_DEPARTAEMNTO FROM PRODUTOS INNER JOIN DEPARTAMENTOS ON PRODUTOS.IDDEPARTAMENTO = DEPARTAMENTOS.ID_DEPARTAMENTO group by PRODUTOS.IDDEPARTAMENTO;

## 5) 1 consulta contemplando a junção entre 3 ou mais tabelas + uma operação de totalização e agrupamento
SELECT COUNT(*) AS TOTAL_CIDADE,CLIENTES.NOME,ENDERECOS.CIDADE,PEDIDOS.VALORPEDIDO FROM CLIENTES JOIN ENDERECOS JOIN PEDIDOS ON CLIENTES.ID_CLIENTES = PEDIDOS.PEDIDOSCLIENTES AND CLIENTES.ID_CLIENTES = ENDERECOS.ENDERECOCLIENTE group by ENDERECOS.CIDADE;

