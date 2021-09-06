*** Settings ***
Documentation       Suite de teste de cadastro de personagens na API da Marvel.

Resource        ${EXECDIR}/resources/Base.robot


Suite Setup     Super Setup     ${EMAIL} 

*** Test Case ***
Deve cadastrar um personagem

    # Pegando a massa de dados do método criado no arquivo massa_dados.py
    &{personsagem}      Factory Thanos

    ${response}         POST New Character         ${personsagem}

    Status Should be        200     ${response}


Não deve cadastrar com o mesmo nome
    [Tags]      test_conflict

    # Dado que o personagem já existe no sistema
    ${personsagem}      Factory Deadpool

    POST New Character         ${personsagem}

    # Quando solicito uma requisição POST para a rota characters
    ${response}         POST New Character         ${personsagem}

    # Então o código de retorno deve ser 409
    Status Should be        409     ${response}

    # E deve exibir uma mensagem de alerta
    Should Contain           ${response.json()}[error]         Character already exists :(
    Should Be Equal          ${response.json()}[error]         Character already exists :(
    # Log To Console          ${response.json()}[error]