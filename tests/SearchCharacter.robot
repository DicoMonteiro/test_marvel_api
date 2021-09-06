*** Settings ***
Documentation       Suite de teste de consulta de personagens na API da Marvel.

Resource        ${EXECDIR}/resources/Base.robot


Suite Setup     Super Setup     ${EMAIL} 

*** Test Case ***
Deve buscar um personsagem pelo Id existente

    # Pegando a massa de dados do método criado no arquivo massas_dados.py
    &{personsagem}      Factory Logan

    ${logan}            POST New Character         ${personsagem}

    ${logan_id}         Set Variable               ${logan.json()}[_id]

    ${response}         GET Character By ID        ${logan_id}

    Status Should be        200     ${response}

    Should Be Equal         ${response.json()}[name]           ${personsagem}[name]
    Should Be Equal         ${response.json()}[aliases]        ${personsagem}[aliases]  
    Should Be Equal         ${response.json()}[age]            ${personsagem}[age]  
    Should Be Equal         ${response.json()}[team]           ${personsagem}[team]  
    Should Be Equal         ${response.json()}[active]         ${personsagem}[active]    


Não deve buscar um personsagem pelo Id inexistente

    # ${personsagem_id}      Set Variable             61361546ee284200167b2743           

    ${personsagem_id}        Get Unique Id

    ${response}            GET Character By ID        ${personsagem_id}

    Status Should be        404     ${response}



Deve buscar todos os personsagens

    # Pegando a massa de dados do método criado no arquivo massas_dados.py
    &{personsagem}      Factory Logan

    ${logan}            POST New Character         ${personsagem}

    ${response}         GET All Character

    Status Should be        200     ${response}
