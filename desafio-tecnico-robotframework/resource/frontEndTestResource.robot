*** Settings ***
Library     SeleniumLibrary    # import da lib
Library     FakerLibrary    # import da lib
# Variáveis utilizadas


*** Variables ***
${URL}                  https://www.saucedemo.com/
${Browser}              firefox
${campoUsername}        xpath=//input[contains(@placeholder,'Username')]
${campoPassword}        xpath=//input[contains(@placeholder,'Password')]
${btnLogin}             id=login-button
${usernameValido}       standard_user
${usernameInvalido}     locked_out_user
${infoSenha}            secret_sauce
${msgLoginInvalido}     xpath=//h3[@data-test='error'][contains(.,'Epic sadface: Sorry, this user has been locked out.')]
${validarLogin}         xpath=//span[@class='title'][contains(.,'Products')]
${btnProduto}           xpath=/html/body/div/div/div/div[2]/div/div/div/div[1]/div[2]/div[2]/button
${addCarrinho}          xpath=//div[@class='inventory_details'][contains(.,'Sauce Labs Backpackcarry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.$29.99Add to cart')]
${consultaCarrinho}     xpath=//span[@class='shopping_cart_badge'][contains(.,'1')]
${validaProduto}        xpath=//div[@class='inventory_item_name'][contains(.,'Sauce Labs Backpack')]
${btnCheckout}          xpath=//button[@id='checkout']
${validaDados}          xpath=//span[@class='title'][contains(.,'Checkout: Your Information')]
${firstName}            xpath=//input[contains(@placeholder,'First Name')]
${infoName}             Juliana
${lastName}             xpath=//input[contains(@placeholder,'Last Name')]
${infoLast}             Silva
${postalCode}           xpath=//input[contains(@placeholder,'Zip/Postal Code')]
${infoCep}              06122040
${btnContinue}          xpath=//input[@id='continue']
${btnFinish}            xpath=//button[@name='finish']
${btnHome}              xpath=//button[@class='btn btn_primary btn_small'][contains(.,'Back Home')]

*** Keywords ***
# Executa essa keyword após a finalização de cada teste
End Session
    Capture Page Screenshot
    # Close Browser

# TC-01    Esse teste realiza o login com sucesso
Dado que eu esteja no site do Saucedemo
    Open Browser    url=${URL}    browser=${Browser}
    Set Window Size    1600    1900
    Maximize Browser Window

Quando digitar um usuario e uma senha
    Click Element                       ${campoUsername}
    Input Text                          ${campoUsername}    ${usernameValido}
    Click Element                       ${campoPassword}
    Input Text                          ${campoPassword}    ${infoSenha}
 
E clicar no botão login
    Click Element    ${btnLogin}

Então realizarei o login com sucesso
    Page Should Contain Element          ${validarLogin}

# TC-02    Realizar login com um usuario invalido
Quando digitar um usuario e uma senha invalida
    Click Element                        ${campoUsername}
    Input Text                           ${campoUsername}    ${usernameInvalido}
    Click Element                        ${campoPassword}
    Input Text                           ${campoPassword}    ${infoSenha}

Então devera aparecer a mensagem de login invalido
    Page Should Contain Element          ${msgLoginInvalido}

# TC-03 Esse teste adiciona um produto ao carrinho
Dado que eu esteja logada no site
    Open Browser    url=${URL}    browser=${Browser}
    Set Window Size    1600    1900
    Maximize Browser Window
    Click Element                        ${campoUsername}
    Input Text                           ${campoUsername}    ${usernameValido}
    Click Element                        ${campoPassword}
    Input Text                           ${campoPassword}    ${infoSenha}
    Click Element                        ${btnLogin}

Quando selecionar um produto
    Click Element       ${btnProduto}

Então o produto devera ser adicionado no carrinho
    Click Element                        ${consultaCarrinho}
    Page Should Contain Element          ${validaProduto}

# TC-04 Esse teste acessa o carrinho
Dado que eu acesse o carrinho no site do Saucedemo
    Click Element                        ${consultaCarrinho}
    Page Should Contain Element          ${validaProduto}

Quando clicar em checkout
    Click Element                        ${btnCheckout} 

Então devo ser direcionado para a tela de dados pessoais
    Page Should Contain Element          ${validaDados}

# TC-05 Esse teste realiza a compra do carrinho
Dado que as informações pessoais estão preenchidas
    Click Element                       ${firstName}
    Input Text                          ${firstName}     ${infoName}
    Click Element                       ${lastName}
    Input Text                          ${lastName}      ${infoLast}
    Click Element                       ${postalCode}
    Input Text                          ${postalCode}    ${infoCep}

Quando clico em continue
    Click Element                       ${btnContinue}

Então meu pedido foi concluido com sucesso
    Click Element                       ${btnFinish}
    Click Element                       ${btnHome}
