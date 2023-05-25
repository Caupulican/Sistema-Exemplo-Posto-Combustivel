# Sistema Exemplo Posto Combustivel
 Sistema de exemplo para controle de posto de combustível tratando-se apenas de um MVP (Minimum Viable Product).
 
 Feito em Delphi 10.4 x32, utilizando Firebird como banco de dados e Fortes Report como gerador de relatórios.



## Como testar
- Instale a dependência no Delphi
- Crie o banco de dados usando o arquivo presente em Model\Database\Database.sql. Edite o arquivo para definir a localização da dll x32 do Firebird e aonde será criado o banco de dados. Por padrão será criado em C:\DB.
- Ao compilar o projeto será criada uma pasta bin, nesta pasta crie um arquivo ini "DFP.ini" com uma seção "Config", caminho do banco em "DBPath", usuário do banco "DBuser" e senha do banco "DBPass".


## Funcionalidades

- Controla os abastecimentos feitos durante cada dia, identificando a bomba utilizada, a quantidade de litros e o valor abastecido
- Calcula um imposto sobre o valor abastecido (Fixo em 15% no exemplo)
- Relatório de abastecimentos com filtagem de período e agrupamento por Data, Tanque e Bomba utilizada. 



## Dependências
-  [Fortes Report Ce](https://github.com/fortesinformatica/fortesreport-ce)
## Arquitetura e Design aplicados
- MVC 
- SOLID 
- Abstract Factory
- Fluent Interfaces
- ORM para abstrair a camada de banco e manipular os objetos
- Unit Tests
- RTTI
- Generics
- Helpers
- Custom Exceptions
- Interfaces
- OOP
- Clean Code
