# Frontend com Robot Framework

## Descrição
Desafio Técnico utilizando Robot Framework - automação Frontend.

## Instruções
1. Baixe e instale o Python: [https://www.python.org/downloads/];

2. Clone o repositório: `git@github.com:bpmello/desafiotecnico-drconsulta.git` (SSH) or `[git clone https://github.com/](https://github.com/bpmello/desafiotecnico-drconsulta.git)` (HTTPS) no editor ou IDE de sua preferência;

3. No diretório raiz do projeto rode os comandos `pip install robotframework` e pip install --upgrade robotframework-seleniumlibrary` para instalação do framework e suas respectivas libraries;

4. Baixe o arquivo geckodriver no site `https://firefox-source-docs.mozilla.org/testing/geckodriver/index.html` e recomendo que coloque na pasta scripts (para uso de outro navegador, utilize o seu respectivo arquivo de drive), dentro do local onde foi instalado o Python para execução dos testes no navegador Firefox, caso ocorra algum erro na execução dos testes frontend, confira se a versão do arquivo é compatível com a versão de seu navegador;

5. Para execução dos testes, nas respectivas pastas do mesmo, rode os comandos abaixo:

-> robot -d Results .\desafio-tecnico-robotframework\tests\frontEndTest.robot   : Para execução de todos os cenários de testes
-> robot -d Results -i [TAG] .\desafio-tecnico-robotframework\tests\frontEndTest.robot  : Para execução de uma TAG específica


## Estrutura de diretórios
```
/
├─ desafio-tecnico-robotframework/          # Raiz do projeto onde se encontram os demais diretórios e testes
├─ ├─resource/                              # Diretório onde ficam os arquivos de resource do robotframework
├─ ├─test/                                  # Scripts de testes
├──────────────├─Results/                   # Diretório onde ficam armazenados as evidências e log de execução dos testes
└─ gitigonre                                # Arquivo utilizado para ignorar 'commits' no git
└─ README.md                                # Esse arquivo
```
