*** Settings ***
Resource         ../resource/frontEndTestResource.robot  #importe dos resources do projeto
#Test Setup       Start Session  #hooks
Test Teardown    End Session   #hooks

*** Test Cases *** 
Realizar login com sucesso
    [Documentation]                                         Esse teste realiza o login com sucesso 
    [Tags]                                                  TC-01 
    Dado que eu esteja no site do Saucedemo
    Quando digitar um usuario e uma senha
    E clicar no botão login
    Então realizarei o login com sucesso

Realizar login com um usuario invalido
    [Documentation]                                         Esse teste realiza um login invalido
    [Tags]                                                  TC-02 
    Dado que eu esteja no site do Saucedemo
    Quando digitar um usuario e uma senha invalida
    E clicar no botão login
    Então devera aparecer a mensagem de login invalido

Selecionar um produto
    [Documentation]                                         Esse teste adiciona um produto ao carrinho
    [Tags]                                                  TC-03 
    Dado que eu esteja logada no site
    Quando selecionar um produto
    Então o produto devera ser adicionado no carrinho

Acessar o carrinho
    [Documentation]                                         Esse teste acessa o carrinho
    [Tags]                                                  TC-04 
    Dado que eu acesse o carrinho no site do Saucedemo
    Quando clicar em checkout
    Então devo ser direcionado para a tela de dados pessoais

Finalizar compra 
    [Documentation]                                         Esse teste realiza a compra do carrinho
    [Tags]                                                  TC-05 
    Dado que as informações pessoais estão preenchidas
    Quando clico em continue
    Então meu pedido foi concluido com sucesso
    
