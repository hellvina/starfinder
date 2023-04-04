<div id="top"></div>

<br />
<div align="center">
  <h1 align="center">starfinder</h1>

  <h3 align="center">
    API Repositorios Github
    <br />
  </h3>

  [![Ruby][Ruby]][Ruby]
  [![Hanami][Hanami]][Hanami]
  [![Postgres][Postgres]][Postgres]
  [![ROM][ROM]][ROM]
</div>

## Sumário

- [Sobre o Projeto](#sobre-o-projeto)
- [Ambiente de desenvolvimento](#ambiente-de-desenvolvimento)
    - [Plugins e dependências](#plugins-e-dependência)
    - [Configuração](#configuração)
    - [Como executar os testes](#como-executar-os-testes)
- [Testando API](#testando-a-api)
    - [Listando Repositários](#listando-os-repoitório-do-github-username)



<!-- ABOUT -->
## Sobre o Projeto

É uma API para para ser consumida por um interface ou ferramenta que transfera dados de/para um servidor. Ex: Curl, Postman, Insomnia, etc.   Esta API consome a API REST do Github e tem como objetivo trazer uma lista de repositórios  públicos do usuário .



<p align="right">(<a href="#top">back to top</a>)</p>


## Ambiente de desenvolvimento

### Plugins e dependências

- [Ruby](https://www.ruby-lang.org/en/)
- [Hanami](https://hanamirb.org/)
- [Postgres](https://www.postgresql.org)
- [ROM](https://rom-rb.org/)

Você pode usar os seguintes gerenciadores para versionamento: [RVM](https://rvm.io/) ou [ASDF](https://asdf-vm.com).


<p align="right">(<a href="#top">back to top</a>)</p>


### Configuração

1.  Se você  está usando uma os Debian/Ubuntu based básica talvez precise instalar a biblioteca `base-devel` para instalar as dependências básicas para instalar o ruby e `libpq` e\ou `libpq-dev` que a gem [pg](https://github.com/ged/ruby-pg/) precisa como pré-requisito. Para Debian ou Ubuntu:
```sh
sudo apt install libpq-dev
```
3. Uma vez configurado e resolvido as dependências, rode `bundle install` para atualizar as gems do projeto.

4. Rode o comando `bundle exec hanami s` para iniciar o serviço


> **Warning**
> Este projeto usa a versao 2.0 do Hanami, é importante usar a versão igual ou acima de 3.0 do ruby


<p align="right">(<a href="#top">back to top</a>)</p>

### Como executar os testes

```sh
% rspec spec/{caminho-para-oarquivo}
```

## Testando a API

### GET: /repositorios

#### Listando os repoitório do github username


##### Parametros


> | name   |  type      | data type      | description                                          |
> |--------|------------|----------------|------------------------------------------------------|
> | `username` |  required  | string         | Your Github Username |
> | `page` |  optional  | integer         | Number of page for navigation |
> | `per_page` |  optional  | integer         | Number of results per page |


##### Respostas

> | http code     | content-type                      | response                                                            |
> |---------------|-----------------------------------|---------------------------------------------------------------------|
> | `201`         | `application/json`   | Json Object  |
> | `422`         | `application/json`   | Json Object  |
> | `500`         | `application/json`   | Json Object  |

##### Exemplo de cURL

```curl
curl -X GET -H "Content-Type: application/json" http://localhost:2300/repositories
```


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- How to make badge shields https://shields.io/ -->
[Ruby]: https://img.shields.io/badge/ruby-FF0000?style=for-the-badge&logo=ruby
[Postgres]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[Hanami]: https://img.shields.io/badge/Hanami-ec65a7?style=for-the-badge&logo=adafruit&logoColor=white
[ROM]: https://img.shields.io/badge/ROM-yellow?style=for-the-badge&logo=ruby