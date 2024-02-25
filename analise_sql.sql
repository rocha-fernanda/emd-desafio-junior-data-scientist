-- Desafio da Prefeitura do Rio de Janeiro 

-- Autor: Fernanda Paula Rocha 

-- Apresentei soluções para as questões do processo e incluí mais algumas para explorar melhor o dataset. Este é o desafio técnico para a vaga de Cientista de Dados Júnior no Escritório Municipal de Dados do Rio de Janeiro. Tem como  objetivo avaliar minhas habilidades em manipulação, consulta e análise de dados, assim como visualização usando ferramentas como BigQuery e Python.

--------------------------------------------------------------------------

-- (Questão 1) Quantos chamados foram abertos no dia 01/04/2023?

SELECT COUNT(*) AS total_chamados_abertos
FROM `datario.administracao_servicos_publicos.chamado_1746` 
WHERE DATE(data_inicio) = '2023-04-01';

-- RESPOSTA: 73

--------------------------------------------------------------------------


-- (Questão 2) Qual o tipo de chamado que teve mais reclamações no dia 01/04/2023?

SELECT tipo, COUNT(*) AS total_reclamacoes
FROM `datario.administracao_servicos_publicos.chamado_1746`
WHERE DATE(data_inicio) = '2023-04-01'
GROUP BY tipo
ORDER BY total_reclamacoes DESC
LIMIT 1;


-- RESPOSTA: 24 poluição sonora

--------------------------------------------------------------------------

-- (Questão 3) Quais os nomes dos 3 bairros que mais tiveram chamados abertos nesse dia?

SELECT b.nome, COUNT(*) AS total_chamados_abertos
FROM `datario.administracao_servicos_publicos.chamado_1746` AS c
JOIN `datario.dados_mestres.bairro` AS b ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
GROUP BY b.nome
ORDER BY total_chamados_abertos DESC
LIMIT 3;


-- RESPOSTA: Engenho de Dentro (8); Campo Grande (6) e Leblon (6)

-- (Questão 3.1) Quais os tipos de chamados para cada bairro nesse dia? 


SELECT b.nome AS nome_bairro, c.tipo, COUNT(*) AS total_chamados
FROM `datario.administracao_servicos_publicos.chamado_1746` AS c
JOIN `datario.dados_mestres.bairro` AS b ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
GROUP BY b.nome, c.tipo
ORDER BY b.nome, total_chamados DESC;

-- RESPOSTA: 

-- 0                    Bangu  Ocupação de área pública               1
-- 1                    Bangu                  Semáforo               1
-- 2          Barra da Tijuca  Estacionamento Irregular               3
-- 3          Barra da Tijuca           Poluição sonora               2
-- 4                 Botafogo           Poluição sonora               1
-- 5             Campo Grande  Estacionamento Irregular               1
-- 6             Campo Grande        Iluminação Pública               1
-- 7             Campo Grande                   Limpeza               1
-- 8             Campo Grande            Manejo Arbóreo               1
-- 9             Campo Grande  Ocupação de área pública               1
-- 10            Campo Grande           Poluição sonora               1
-- 11               Cascadura          Remoção Gratuita               1
-- 12                  Catete           Poluição sonora               1
-- 13              Cavalcanti              Pavimentação               1
-- 14                  Centro                    Feiras               1
-- 15               Encantado        Iluminação Pública               1
-- 16       Engenho da Rainha         Comlurb - Vetores               2
-- 17       Engenho da Rainha     Drenagem e Saneamento               1
-- 18       Engenho da Rainha     Fiscalização de obras               2
-- 19       Engenho de Dentro  Estacionamento Irregular               2
-- 20       Engenho de Dentro           Poluição sonora               1
-- 21       Engenho de Dentro         Postura Municipal               4
-- 22       Engenho de Dentro          Remoção Gratuita               1
-- 23                Flamengo          Remoção Gratuita               1
-- 24               Guadalupe                   Limpeza               1
-- 25               Guaratiba  Estacionamento Irregular               1
-- 26                 Ipanema           Poluição sonora               2
-- 27                   Irajá        Iluminação Pública               1
-- 28                   Irajá            Manejo Arbóreo               1
-- 29               Itanhangá  Programa Cegonha Carioca               1
-- 30             Jacarepaguá        Iluminação Pública               2
-- 31                    Lapa           Poluição sonora               2
-- 32             Laranjeiras           Poluição sonora               1
-- 33                  Leblon  Estacionamento Irregular               1
-- 34                  Leblon           Poluição sonora               5
-- 35                  Olaria           Poluição sonora               1
-- 36               Paciência        Iluminação Pública               1
-- 37               Paciência           Poluição sonora               1
-- 38               Pechincha                   Limpeza               1
-- 39                   Penha           Poluição sonora               1
-- 40                Realengo                   Limpeza               1
-- 41  Ricardo de Albuquerque           Poluição sonora               1
-- 42            Santa Teresa        Comércio ambulante               1
-- 43            Santa Teresa  Ocupação de área pública               1
-- 44            Santa Teresa           Poluição sonora               1
-- 45                   Saúde  Estacionamento Irregular               1
-- 46     Senador Vasconcelos           Poluição sonora               1
-- 47                  Tanque              Pavimentação               1
-- 48                 Taquara        Iluminação Pública               1
-- 49                  Tijuca        Iluminação Pública               1
-- 50                  Tijuca                   Limpeza               1
-- 51                  Tijuca              Pavimentação               1
-- 52             Vila Isabel          Remoção Gratuita               1
-- 53           Vila da Penha           Poluição sonora               1
-- 54           Vila da Penha          Remoção Gratuita               1
-- 55            Vista Alegre           Poluição sonora               1



-- (Questão 3.2) Qual o tipo de chamado mais frequente para cada bairro nesse dia?

SELECT b.nome AS nome_bairro, c.tipo, COUNT(*) AS total_chamados
FROM `datario.administracao_servicos_publicos.chamado_1746` AS c
JOIN `datario.dados_mestres.bairro` AS b ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
GROUP BY b.nome, c.tipo
ORDER BY b.nome, total_chamados DESC;



-- RESPOSTA: 

--                   nome                      tipo                       total_chamados
--         Bangu                     Ocupação de área pública                   1
--         Bangu                               Semáforo                         1
--         Barra da Tijuca            Estacionamento Irregular                  3
--         Botafogo                         Poluição sonora                     1
--         Campo Grande              Estacionamento Irregular                   1
--         Campo Grande              Iluminação Pública                         1
--         Campo Grande                        Limpeza                          1
--         Campo Grande                 Manejo Arbóreo                          1
--         Campo Grande              Ocupação de área pública                   1
--         Campo Grande                    Poluição sonora                      1
--         Cascadura                          Remoção Gratuita                  1
--         Catete                              Poluição sonora                  1
--         Cavalcanti                           Pavimentação                    1
--         Centro                                 Feiras                        1
--         Encantado                     Iluminação Pública                     1
--         Engenho da Rainha               Comlurb - Vetores                    2
--         Engenho da Rainha            Fiscalização de obras                   2
--         Engenho de Dentro            Postura Municipal                       4
--         Flamengo                            Remoção Gratuita                 1
--         Guadalupe                                 Limpeza                    1
--         Guaratiba                  Estacionamento Irregular                  1
--         Ipanema                              Poluição sonora                 2
--         Irajá                           Iluminação Pública                   1
--         Irajá                                  Manejo Arbóreo                1
--         Itanhangá                  Programa Cegonha Carioca                  1
--         Jacarepaguá                Iluminação Pública                        2
--         Lapa                                 Poluição sonora                 2
--         Laranjeiras                         Poluição sonora                  1
--         Leblon                               Poluição sonora                 5
--         Olaria                               Poluição sonora                 1
--         Paciência                         Iluminação Pública                 1
--         Paciência                            Poluição sonora                 1
--         Pechincha                                 Limpeza                    1
--         Penha                                 Poluição sonora                1
--         Realengo                                  Limpeza                    1
--         Ricardo de Albuquerque           Poluição sonora                     1
--         Santa Teresa                    Comércio ambulante                   1
--         Santa Teresa                Ocupação de área pública                 1
--         Santa Teresa                       Poluição sonora                   1
--         Saúde                             Estacionamento Irregular           1
--         Senador Vasconcelos         Poluição sonora                          1
--         Tanque                                Pavimentação                   1
--         Taquara                           Iluminação Pública                 1
--         Tijuca                            Iluminação Pública                 1
--         Tijuca                                   Limpeza                     1
--         Tijuca                               Pavimentação                    1
--         Vila Isabel                        Remoção Gratuita                  1
--         Vila da Penha                    Poluição sonora                     1
--         Vila da Penha                   Remoção Gratuita                     1
--         Vista Alegre                      Poluição sonora                    1



--------------------------------------------------------------------------

-- (Questão 4) Qual o nome da subprefeitura com mais chamados abertos nesse dia?

SELECT b.subprefeitura, COUNT(*) AS total_chamados
FROM `datario.administracao_servicos_publicos.chamado_1746` AS c
JOIN `datario.dados_mestres.bairro` AS b ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01' 
GROUP BY b.subprefeitura
ORDER BY total_chamados DESC
LIMIT 1;


-- RESPOSTA: Zona Norte com 25 chamados!


-- (Questão 4.1) Quais os tipos de chamados para cada subprefeitura nesse dia?

SELECT b.subprefeitura, c.tipo, COUNT(*) AS total_chamados
FROM `datario.administracao_servicos_publicos.chamado_1746` AS c
JOIN `datario.dados_mestres.bairro` AS b ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
GROUP BY b.subprefeitura, c.tipo
ORDER BY b.subprefeitura, total_chamados DESC;


-- RESPOSTA: 
-- Barra da Tijuca', 'Estacionamento Irregular', 3
-- Barra da Tijuca', 'Poluição sonora', 2
-- Barra da Tijuca', 'Programa Cegonha Carioca', 1
-- Centro', 'Comércio ambulante', 1
-- Centro', 'Estacionamento Irregular', 1
-- Centro', 'Feiras', 1
-- Centro', 'Ocupação de área pública', 1
-- Centro', 'Poluição sonora', 3
-- Grande Bangu', 'Limpeza', 1
-- Grande Bangu', 'Ocupação de área pública', 1
-- Grande Bangu', 'Semáforo', 1
-- Grande Tijuca', 'Iluminação Pública', 1
-- Grande Tijuca', 'Limpeza', 1
-- Grande Tijuca', 'Pavimentação', 1
-- Grande Tijuca', 'Remoção Gratuita', 1
-- Jacarepaguá', 'Iluminação Pública', 3
-- Jacarepaguá', 'Limpeza', 1
 -- Jacarepaguá', 'Pavimentação', 1
-- Zona Norte', 'Comlurb - Vetores', 2
-- Zona Norte', 'Drenagem e Saneamento', 1
-- Zona Norte', 'Estacionamento Irregular', 2
-- Zona Norte', 'Fiscalização de obras', 2
-- Zona Norte', 'Iluminação Pública', 2
-- Zona Norte', 'Limpeza', 1
-- Zona Norte', 'Manejo Arbóreo', 1
-- Zona Norte', 'Pavimentação', 1
-- Zona Norte', 'Poluição sonora', 6
-- Zona Norte', 'Postura Municipal', 4
-- Zona Norte', 'Remoção Gratuita', 3),
-- Zona Oeste', 'Estacionamento Irregular', 2
-- Zona Oeste', 'Iluminação Pública', 2
-- Zona Oeste', 'Limpeza', 1
-- Zona Oeste', 'Manejo Arbóreo', 1
-- Zona Oeste', 'Ocupação de área pública', 1
-- Zona Oeste', 'Poluição sonora', 3
-- Zona Sul', 'Estacionamento Irregular', 1
-- Zona Sul', 'Poluição sonora', 10
-- Zona Sul', 'Remoção Gratuita', 1

-- (Questão 4.2)  Qual o chamado mais frequente nesse dia para cada subprefeitura?

WITH chamados AS (
  SELECT 
    b.subprefeitura, 
    c.tipo, 
    COUNT(*) AS total_chamados,
    ROW_NUMBER() OVER(PARTITION BY b.subprefeitura ORDER BY COUNT(*) DESC) as rn
  FROM 
    `datario.administracao_servicos_publicos.chamado_1746` AS c
  JOIN 
    `datario.dados_mestres.bairro` AS b 
  ON 
    c.id_bairro = b.id_bairro
  WHERE 
    DATE(c.data_inicio) = '2023-04-01'
  GROUP BY 
    b.subprefeitura, c.tipo
)
SELECT 
  subprefeitura, 
  tipo, 
  total_chamados
FROM 
  chamados
WHERE 
  rn = 1
ORDER BY 
  subprefeitura;




-- RESULTADO: 

-- subprefeitura        tipo                       total_chamados
-- Barra da Tijuca      Estacionamento Irregular     3
-- Centro               Poluição sonora              3
-- Grande Bangu         Limpeza                      1
-- Grande Bangu         Ocupação de área pública      1
-- Grande Bangu         Semáforo                     1
-- Grande Tijuca        Iluminação Pública           1
-- Grande Tijuca        Limpeza                      1
-- Grande Tijuca        Pavimentação                 1
-- Grande Tijuca        Remoção Gratuita              1
-- Jacarepaguá          Iluminação Pública           3
-- Zona Norte           Poluição sonora               6
-- Zona Oeste           Poluição sonora               3
-- Zona Sul             Poluição sonora               10


--------------------------------------------------------------------------

-- (Questão 5) Existe algum chamado aberto nesse dia que não foi associado a um bairro ou subprefeitura na tabela de bairros? Se sim, por que isso acontece?

SELECT c.tipo, c.subtipo
FROM `datario.administracao_servicos_publicos.chamado_1746` AS c
LEFT JOIN `datario.dados_mestres.bairro` AS b ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01' AND (b.nome IS NULL OR b.subprefeitura IS NULL);


-- RESPOSTA: Ônibus | Verificação de ar condicionado inoperante no ônibus


-- A reclamação sobre o ar condicionado em um ônibus, aberta no dia específico, não está associada a uma subprefeitura ou bairro, devido à mobilidade dos ônibus, que não estão rigidamente vinculados a uma localização fixa. A mobilidade dos ônibus dificulta a categorização geográfica.

--------------------------------------------------------------------------


-- (Questão 6) Quantos chamados com o subtipo "Perturbação do sossego" foram abertos desde 01/01/2022 até 31/12/2023 (incluindo extremidades)?


SELECT COUNT(*) AS total_chamados
FROM `datario.administracao_servicos_publicos.chamado_1746`
WHERE subtipo = 'Perturbação do sossego'
  AND data_inicio BETWEEN '2022-01-01' AND '2023-12-31' 
LIMIT 1;


-- RESPOSTA: 42408 chamados

-- (Questão 6.1) Quais são os 15 bairros que apresentam a maior quantidade desse tipo de chamado durante este período?

SELECT 
  b.nome, 
  COUNT(*) AS total_chamados
FROM 
  `datario.administracao_servicos_publicos.chamado_1746` AS c
JOIN 
  `datario.dados_mestres.bairro` AS b 
ON 
  c.id_bairro = b.id_bairro
WHERE 
  c.subtipo = 'Perturbação do sossego'
  AND DATE(c.data_inicio) BETWEEN '2022-01-01' AND '2023-12-31'
GROUP BY 
  b.nome
ORDER BY 
  total_chamados DESC
LIMIT 
  15;


-- RESPOSTA: 
-- nome             total_chamados_perturbacao_sossego
-- Copacabana                     2791
-- Botafogo                       2135
-- Tijuca                         2042
-- Barra da Tijuca                1865
-- Campo Grande                   1682
-- Centro                         1568
-- Todos os Santos                1405
-- Vila Isabel                    1269
-- Recreio dos Bandeirantes       1251
-- Leblon                         1165
-- Santa Teresa                   1010
-- Ipanema                        879
-- Taquara                        746
-- Catete                         626


-- (Questão 6.2) Qual a subprefeitura com mais chamados desse tipo nesse intervalo de tempo? 

SELECT 
  b.subprefeitura, 
  COUNT(*) AS total_chamados
FROM 
  `datario.administracao_servicos_publicos.chamado_1746` AS c
JOIN 
  `datario.dados_mestres.bairro` AS b 
ON 
  c.id_bairro = b.id_bairro
WHERE 
  c.subtipo = 'Perturbação do sossego'
  AND DATE(c.data_inicio) BETWEEN '2022-01-01' AND '2023-12-31'
GROUP BY 
  b.subprefeitura
ORDER BY 
  total_chamados DESC
LIMIT 
  1;

-- RESPOSTA: Zona Norte com 10447



--------------------------------------------------------------------------


-- (Questão 7) Selecione os chamados com esse subtipo que foram abertos durante os eventos contidos na tabela de eventos (Reveillon, Carnaval e Rock in Rio).

SELECT 
    COUNT(*) AS total_chamados
FROM 
    `datario.administracao_servicos_publicos.chamado_1746` AS chamado
LEFT JOIN 
    `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` AS evento
  ON DATE(chamado.data_inicio) BETWEEN DATE(evento.data_inicial) AND DATE(evento.data_final)
WHERE 
    chamado.subtipo = 'Perturbação do sossego'
  AND evento.evento IN ('Carnaval', 'Reveillon', 'Rock in Rio');


-- RESPOSTA: 1212 


--------------------------------------------------------------------------

-- (Questão 8) Quantos chamados desse subtipo foram abertos em cada evento?

SELECT 
    evento.evento AS evento_nome, COUNT(*) AS total_chamados
FROM 
    `datario.administracao_servicos_publicos.chamado_1746` AS chamado
LEFT JOIN 
    `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` AS evento
  ON DATE(chamado.data_inicio) BETWEEN DATE(evento.data_inicial) AND DATE(evento.data_final)
WHERE 
    chamado.subtipo = 'Perturbação do sossego'
  AND evento.evento IN ('Carnaval', 'Reveillon', 'Rock in Rio')
GROUP BY 
    evento_nome
ORDER BY 
    total_chamados DESC;



-- RESPOSTA: Rock in Rio com 834, Carnaval com 241 e Reveillon 137.


-- (Questão 8.1) Em qual período de tempo ocorre a maior quantidade de chamados desse tipo durante cada evento, considerando dois intervalos: das 18h às 6h e das 6h às 18h?

SELECT 
  evento.evento AS evento_nome,
  CASE 
    WHEN EXTRACT(HOUR FROM chamado.data_inicio) BETWEEN 6 AND 17 THEN '6h às 18h'
    ELSE '18h às 6h'
  END AS intervalo_horas,
  COUNT(*) AS total_chamados
FROM 
  `datario.administracao_servicos_publicos.chamado_1746` AS chamado
LEFT JOIN 
  `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` AS evento
ON DATE(chamado.data_inicio) BETWEEN DATE(evento.data_inicial) AND DATE(evento.data_final)
WHERE 
  chamado.subtipo = 'Perturbação do sossego'
  AND evento.evento IN ('Carnaval', 'Reveillon', 'Rock in Rio')
GROUP BY 
  evento_nome, intervalo_horas
ORDER BY 
  total_chamados DESC;


-- RESPOSTA: 

-- evento				intervalo_horas      total_chamados
-- Rock in Rio	            18h às 6h	            578	
-- Rock in Rio	            6h às 18h	            256	
-- Carnaval             	18h às 6h	            142	
-- Carnaval             	6h às 18h	            99	
-- Reveillon            	18h às 6h	            86	
-- Reveillon            	6h às 18h	            51	


--------------------------------------------------------------------------

-- (Questão 9) Qual evento teve a maior média diária de chamados abertos desse subtipo?

WITH TotaisPorEvento AS (
    SELECT 
        evento.evento AS evento_nome, 
        COUNT(*) AS total_chamados,
        COUNT(DISTINCT DATE(chamado.data_inicio)) AS total_dias
    FROM 
        `datario.administracao_servicos_publicos.chamado_1746` AS chamado
    LEFT JOIN 
        `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` AS evento
    ON DATE(chamado.data_inicio) BETWEEN DATE(evento.data_inicial) AND DATE(evento.data_final)
    WHERE 
        chamado.subtipo = 'Perturbação do sossego'
        AND evento.evento IN ('Carnaval', 'Reveillon', 'Rock in Rio')
    GROUP BY 
        evento_nome
)

SELECT 
    evento_nome,
    ROUND(total_chamados / total_dias, 2) AS media_diaria_chamados
FROM 
    TotaisPorEvento
ORDER BY 
    media_diaria_chamados DESC;


-- RESPOSTA: Rock in Rio com 119.14, Carnaval com 60.25 e Reveillon 45.67.

--------------------------------------------------------------------------

-- (Questão 10) Compare as médias diárias de chamados abertos desse subtipo durante os eventos específicos (Reveillon, Carnaval e Rock in Rio) e a média diária de chamados abertos desse subtipo considerando todo o período de 01/01/2022 até 31/12/2023.

WITH TotaisPorEvento AS (
    SELECT 
        evento.evento AS evento_nome, 
        COUNT(*) AS total_chamados,
        COUNT(DISTINCT DATE(chamado.data_inicio)) AS total_dias
    FROM 
        `datario.administracao_servicos_publicos.chamado_1746` AS chamado
    LEFT JOIN 
        `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` AS evento
    ON DATE(chamado.data_inicio) BETWEEN DATE(evento.data_inicial) AND DATE(evento.data_final)
    WHERE 
        chamado.subtipo = 'Perturbação do sossego'
        AND evento.evento IN ('Carnaval', 'Reveillon', 'Rock in Rio')
    GROUP BY 
        evento_nome
)

SELECT 
    evento_nome,
    ROUND(total_chamados / total_dias, 2) AS media_diaria_chamados
FROM 
    TotaisPorEvento

UNION ALL

SELECT
    'Média diária' AS evento_nome,
    ROUND(COUNT(*) / (DATE_DIFF(DATE '2023-12-31', DATE '2022-01-01', DAY) + 1), 2) AS media_diaria_chamados
FROM
    `datario.administracao_servicos_publicos.chamado_1746` AS chamado
WHERE
    chamado.subtipo = 'Perturbação do sossego'
    AND DATE(chamado.data_inicio) BETWEEN '2022-01-01' AND '2023-12-31'
ORDER BY 
    media_diaria_chamados DESC;




-- RESPOSTA: 58.09
--------------------------------------------------------------------------


