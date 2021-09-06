### Detalhes do Projeto ###

Projeto criado para testar API Rest da Marvel, utilizando o framework Robot Framework e python, na semana da automação feita pelo QANinja.

### Pre-requisitos ###

[x] - Python 3 instalado;
[x] - Node instalado;
[x] - Java instalado;
[x] - Git instalado;
[x] - Allure instalado (Se desejar visualizar os relatórios via Allure - npm install allure-commandline -g);
[x] - Instalar o Editor de sua escolha (foi utilizado o VSCode e suas extensões instaladas de robot framework e python)


### Collection da API ###

collection_api/Insomnia_Marvel.json

### Clone do projeto ###

Baixando o projeto e instalando as dependências:

[x] - git clone 
[x] - pip install -r requirements.txt

### Comando de execução ###

robot -d ./logs tests/

### Gerando relatorio Allure ###

robot --listener allure_robotframework tests/ 

### Subir o servidor de relatório do Allure ###

allure serve output/allure/