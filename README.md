# Desafio Técnico - Cientista de Dados Júnior

## Desenvolvido por: Fernanda Paula Rocha

## Descrição

Ao abordar os requisitos específicos do desafio, destaquei não apenas minhas habilidades técnicas, mas também minha iniciativa e curiosidade ao realizar análises adicionais. Esse processo envolveu a exploração de insights extras e a busca por compreensões mais profundas sobre o conjunto de dados em questão. Este desafio técnico refere-se à vaga de Cientista de Dados Júnior no Escritório Municipal de Dados do Rio de Janeiro. O objetivo é avaliar minhas competências em manipulação, consulta e análise de dados, bem como minha habilidade em visualização, utilizando ferramentas como SQL e Python.

## Objetivo
O objetivo deste desafio é realizar análises exploratórias em conjuntos de dados públicos disponíveis no BigQuery, responder a perguntas específicas sobre esses dados utilizando SQL e Python, e criar visualizações informativas e visualmente atraentes.


## Conjunto de Dados
Os conjuntos de dados que serão utilizados neste desafio são:

Chamados do 1746: Dados relacionados a chamados de serviços públicos na cidade do Rio de Janeiro. O caminho da tabela é : ``datario.administracao_servicos_publicos.chamado_1746``

Bairros do Rio de Janeiro: Dados sobre os bairros da cidade do Rio de Janeiro - RJ. O caminho da tabela é: ``atario.dados_mestres.bairro``

Ocupação Hoteleira em Grandes Eventos no Rio: Dados contendo o período de duração de alguns grandes eventos que ocorreram no Rio de Janeiro em 2022 e 2023 e a taxa de ocupação hoteleira da cidade nesses períodos. O caminho da tabela é: ``datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos``


Para acessar as consultas, siga as etapas abaixo:

## 1- Análise SQL - Google Cloud Platform (GCP)

1. Acesse o [GCP Console](https://console.cloud.google.com/) e realize o login ou crie uma nova conta.
2. Escolha um projeto existente ou crie um novo no GCP.
3. No menu lateral, vá para o *BigQuery* e adicione o projeto **datario** à barra Explorer.
4. Acesse o arquivo [analise_sql.sql](https://github.com/rocha-fernanda/emd-desafio-junior-data-scientist/blob/main/analise_sql.sql) para obter as consultas SQL e execute no *BigQuery*.

Para obter mais detalhes, consulte o tutorial: [Como acessar dados no BigQuery](https://docs.dados.rio/tutoriais/como-acessar-dados/#como-criar-uma-conta-na-gcp)

## 2- Análise Python - Jupyter Notebook

1. Acesse o [Google Colab](https://colab.research.google.com/?hl=pt_BR).
2. Faça login e importe o arquivo [analise_python.ipynb](https://github.com/rocha-fernanda/emd-desafio-junior-data-scientist/blob/main/analise_python.ipynb)` deste repositório.
3. Execute as células para visualizar as análises em Python.
4. Instale a biblioteca `basedosdados` utilizando o comando ``pip install basedosdados`` e configure-a com o ID do seu projeto GCP.
5. Execute as células no notebook [analise_python.ipynb](https://github.com/rocha-fernanda/emd-desafio-junior-data-scientist/blob/main/analise_python.ipynb) para visualizar as análises em Python.
6. 

## 3- Visualização Python - Jupyter Notebook
Claro, aqui está a inclusão referente à visualização em Python:

## 3- Visualização Python - Jupyter Notebook

1. Para visualizar os resultados foram usadas as bibliotecas internas do Python, como `matplotlib` e `seaborn`.
2. Essas bibliotecas foram escolhidas devido à sua robustez e flexibilidade para criar visualizações claras e informativas a partir dos dados analisados.

Lembrando que a escolha dessas bibliotecas é respaldada pela sua ampla aceitação na comunidade de ciência de dados, oferecendo recursos abrangentes para a criação de gráficos e visualizações impactantes.


---
Para mais informações: [Fernanda Paula Rocha](https://www.linkedin.com/in/fernanda-paula-rocha-20687122a/) 
