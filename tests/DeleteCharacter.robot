*** Settings ***
Documentation       Suite de teste de exclusão de personagens na API da Marvel.

Resource        ${EXECDIR}/resources/Base.robot


Suite Setup     Super Setup     ${EMAIL} 

*** Test Case ***
Deve excluir um personsagem pelo Id existente

    # Pegando a massa de dados do método criado no arquivo massas_dados.py
    &{personsagem}      Factory Tony Stark

    ${tony_stark}            POST New Character              ${personsagem}

    ${tony_stark_id}         Set Variable                    ${tony_stark.json()}[_id]

    ${response}              DELETE A Character By ID        ${tony_stark_id}

    Status Should be        204     ${response}

    ${response2}            GET Character By ID        ${tony_stark_id}

    Status Should be        404     ${response2}



Não deve excluir um personsagem pelo Id inexistente
   

    ${personsagem_id}        Get Unique Id

    ${response}              DELETE A Character By ID        ${personsagem_id}

    Status Should be        404     ${response}
