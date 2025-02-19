### Descrição do Projeto

A aplicação será uma lista de usuários, com funcionalidade de detalhes do usuário e refresh manual dos dados.✅

A aplicação deve:

Listar usuários com nome, e-mail e avatar. ✅

Exibir detalhes do usuário ao clicar em um item da lista. ✅

Atualizar os dados ao puxar para baixo (pull-to-refresh). ✅

### Instruções

Estruture o código nas camadas especificadas e organize as pastas conforme a Clean Architecture. ✅

Utilize testes unitários para a camada Domain, testando os métodos do repositório. ✅

Documente o código e explique brevemente cada camada no README do projeto. ✅

Inclua comentários explicando as principais decisões arquiteturais. ✅

mvvm está sendo a arquitetura mais recomendada pelos criadores do flutter, em conjunto com uma domain bem organizada e respeitando as camadas propostas, não vamos ter problema com manutenção nem escalabilidade da aplicação ✅

### Critérios de Avaliação

Estrutura do código e divisão em camadas.✅

Uso correto do padrão Repository. ✅

Uso do Dio e GetX. ✅

Organização dos pacotes e clareza do código. ✅

Cobertura de testes unitários na camada Domain. ✅

Documentação e explicação das escolhas. ✅

### Observação

Pelos conceitos pregados pela **Clean Architecture**, a **interface do repositório** deveria estar localizada na camada **Domain**, mas sua **implementação** ficaria na camada **Data**, para respeitar a **responsabilidade** de cada camada e daí sim os testes ficarem da repository ficar na camada de data. De qualquer forma, os testes foram feitos na camada **Data** para **repository**.



### Arquitetura

A arquitetura utilizada no projeto segue a abordagem **MVVM (Model-View-ViewModel)**, que foi altamente recomendada para projetos Flutter pela propria desenvolvedora, pois promove a separação clara de responsabilidades entre as camadas UI e a regra de negócio facilitando a manutenção e escalabilidade da aplicação.

#### Camadas:
- **Model**: Esta camada é responsável pela lógica de transformação dos dados.

- **View**: A camada de interface com o usuário, responsável pela exibição dos dados. Ela interage com o **ViewModel** para obter as informações necessárias e apresentar ao usuário.

- **ViewModel**: Gerencia a lógica de negócios e comunicação entre a **View** e o **Model**. Ele serve como intermediário entre as camadas de interface e dados, proporcionando uma estrutura mais organizada para gerenciar estados.

- **Domain**: Contém as regras de negócios e lógica de dados mais "cores" da aplicação, além de ser responsável pela interação com o **Repository**. As camadas superiores (View e ViewModel) se comunicam com o Domain para obter dados e realizar ações.

- **Repository**: A camada de repositório é responsável pela obtenção dos dados, seja da API ou de um banco local, e pela **abstração** da fonte de dados.

#### Clean Architecture

A **Clean Architecture** foi aplicada para garantir uma manutenibilidade mais adequada para uma aplicaçã escalavel e também a boa divisão da responsabilidade para cada camada.

A separação clara entre **Domain**, **Repository** e **Data** (para comunicação com APIs) também garante que o código esteja organizado, com um repositório centralizado que facilita futuras manutenções e atualizações.

#### Uso do GetX

Como pedido o uso do GetX para gerenciamento de estado, fazendo assim a utilização da camada ViewModel para a intermediação da Model e da View

#### Uso do Dio

O **Dio** foi utilizado para realizar as requisições HTTP à API.

#### Uso do Mockito

O **Mockito** foi utilizado para realizar os testes unitários, mockando as classes necessárias.
