# DISC-SEGINFO-projeto-trio
Repositório para desenvolvimento do projeto em trio da disciplina de Segurança da Informação.  

## Equipe

Florindo Rian Silva Carreteiro 
Igo Quintino Castro Prata 
João Paulo Santos Bembe 

## **link para repositórios back-end e front-end**

🔗 **Backend do PobreFlix:** [Acesse o repositório aqui](<https://github.com/Igoquintino/API_REST_POBREFLIX.git>)  
🔗 **Frontend do Pobreflix:** [Acesse o repositório aqui](<https://github.com/Igoquintino/FRONTEND_PobreFlix.git>)  


Relato de Atualização – Pobreflix 

1. Autenticação de Dispositivos com APIKEY 
Todo dispositivo que deseja acessar o Pobreflix deve realizar um registro inicial na plataforma, informando ao sistema o seu modelo (por exemplo: "Samsung S25 Ultra", "iPhone 16e" etc.). 
A API, ao receber o registro, gera e retorna para o dispositivo dois valores:  APIKEY, uma chave exclusiva de identificação e autorização do dispositivo, e  CriptoKey, uma chave secreta específica para o dispositivo, que será utilizada para criptografar as requisições enviadas ao servidor. 
Essa abordagem permite identificar, controlar e revogar o acesso de dispositivos. 

2. Middleware de Validação de APIKEY 
Foi implementado um middleware responsável pela validação da APIKEY em pontos críticos da aplicação: login, catálogo (catalog) e consumo de conteúdo (consumption). 
Esse middleware garante que apenas dispositivos previamente registrados e autorizados possam interagir com as rotas. 

3. Criptografia de Requisições (AES-256-GCM) 
Com o registro e distribuição da CriptoKey por dispositivo, foi possível implementar a criptografia das requisições enviadas ao servidor. 
Utilizando o algoritmo AES-256-GCM, cada requisição dos dispositivos é cifrada antes de ser transmitida. 
O AES-256-GCM garante a confidencialidade dos dados, integridade e autenticidade, graças ao mecanismo de autenticação embutido no algoritmo. 

4. Registro de Logs 
Para fortalecer a rastreabilidade, foi adicionado um módulo de registro de logs abrangendo as principais funcionalidades do sistema, incluindo: registro de dispositivos, geração e validação de APIKEY, fluxos de login, catálogo e consumo. 


