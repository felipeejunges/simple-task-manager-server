# Simple Task Manager Server
[![Docker CI](https://github.com/felipeejunges/simple-task-manager-server/actions/workflows/dockerci.yml/badge.svg?branch=master)](https://github.com/felipeejunges/simple-task-manager-server/actions/workflows/dockerci.yml?query=branch%3Amaster)

É a API de gerenciamento de tarefas simples do projeto [Simple Task Manager](https://github.com/felipeejunges/simple-task-manager-server)

## Tecnologias

- Ruby v3.2.1
- Ruby on Rails v7.0.8
- Postgress
- Docker
- Rspec
- FactoryBot
- Faker
- Simplecov
- GitActions for CI

## Instruções

Estas são as instruções que mostram como inicializar um projeto e usar o [docker](https://docs.docker.com/engine/install/ubuntu/)

- Rode o comando `docker-compose build` para configurar o docker e realizar a instalação das gems
- Rode o comando `docker-compose up` para iniciar o projeto
- Rode o comando `docker-compose exec server bash` para acessar o bash do container
- Rode os comandos `rake db:create`, `rake db:migrate`, `rake db:seed` para criar o banco, realizar as migrations e preencher o banco com os dados iniciais respectivamenteæ
- You can run tests, to do this, you have to be inside docker bash container with command `rspec`


## Testes Manuais

Você pode testar este projeto com seu testador de API preferido no endpoint `http://localhost:3000/tasks` ou utilizando o projeto web mencionado na descrição

## Coverage

https://imgur.com/a/342Kqp3

<sub><sup>Sorry about the merges not be squashed</sup></sub>