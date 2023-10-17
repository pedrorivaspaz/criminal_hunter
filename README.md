# Criminal Hunter API

API para identificar criminosos procurados pela INTERPOL e FBI

Projeto feito em rails com fins acadêmicos 

## Dependências

Docker instalado no host.

## Como configurar o projeto

- Verifica as dependências
- Instala variáveis de ambiente
- Build do container

```
$ ./configure.sh
```

#### Ajustes manuais

Para utlizar o Rubocop é necessário instalar a extensão do VSCode:

- [Rubocop for Visual Studio Code - revived](https://marketplace.visualstudio.com/items?itemName=LoranKloeze.ruby-rubocop-revived)

Adicionar a seguinte linha as configurações do VSCode no arquivo **settings.json**

> `ruby.rubocop.executePath": "./"`

*Caso precise adicionar para outras IDEs, faça os testes e adicione as informações de como executar neste README.*

#### Recomendações para IDE

##### **VSCode**

Adicionar as linhas abaixo à configuração do VSCode para que o código se ajuste automaticamente ao salvar o arquivo.

- "files.trimTrailingWhitespace": true,
- "files.trimFinalNewlines": true,
- "files.insertFinalNewline": true,

## Como subir o projeto

```
$ docker-compose up app
```

## Como executar os testes

```
$ docker-compose run --rm app rspec
```

## Tecnologias

- Rails
- Docker
