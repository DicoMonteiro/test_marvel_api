*** Settings ***
Documentation       Suite de organização das bibliotecas e keyword comuns a todas features

Library     RequestsLibrary
Library     ${EXECDIR}/resources/factories/massas_dados.py
Library     Helpers.py
Resource    routes/Characters.robot



*** Variable ***
${BASE_URI}          http://marvel.qaninja.academy
# Passar o seu email para gerar seu id
${EMAIL}             teste_qaninja@test.com

*** Keywords ***
Super Setup
    [Arguments]         ${email}
    
    Set Client Key      ${email}
    Back To The Past


Set Client Key
    [Arguments]         ${email}

    &{usuario}          Create Dictionary       email=${email}

    ${response}         POST
    ...                 ${BASE_URI}/accounts
    ...                 json=${usuario}

    ${client_key}       Set Variable            ${response.json()}[client_key]
    &{HEADERS}          Create Dictionary       client_key=${client_key}

    Set Suite Variable          ${HEADERS}


Back To The Past

    DELETE          ${BASE_URI}/delorean         headers=${HEADERS}