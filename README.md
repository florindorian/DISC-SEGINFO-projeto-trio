# DISC-SEGINFO-projeto-trio
Repositório para desenvolvimento do projeto em trio da disciplina de Segurança da Informação.  

## Equipe

+ Florindo Rian Silva Carreteiro 
+ Igo Quintino Castro Prata 
+ João Paulo Santos Bembe 

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


## Atualizações da Documentação de ECN e DVP

Este repositório contém as versões mais recentes e o histórico de alterações da documentação referente aos **ECN (Especificação de Cenário de Uso)** e **DVP (Documento de Visão do Projeto)**. O objetivo é garantir o acesso a informações precisas e atualizadas sobre as modificações nos planos de validação do software, assegurando entregas corretas conforme especificado.

---

### Últimas Atualizações

**27/05/2025 — Implementação das Regras de Negócio em Ambos os Documentos**

- **ECN:**
  - Atualizado documento explicativo de cenários de uso com a inclusão das regras de negócio descritas no DVP.  
    Exemplo de atualização:

    ```
    (1.2) Fazer Logout

    Como Usuário comum ou ADM  
    Eu posso fazer logout  

    Pré-condição:  
    Estar logado  

    Ocorre então:  
    - No menu superior, clicar em “Minha conta”  
    - Clicar em “Sair”  
    - A sessão do usuário deve ser encerrada [RN-AU-005]  
    - O usuário é redirecionado para a tela de boas-vindas do site  

    Contudo:  
    - Se houver erro ao encerrar a sessão no backend, o sistema exibirá uma mensagem de erro  
    - Se o usuário tentar acessar páginas restritas após o logout, será redirecionado para a tela de login  
    ```
- **DVP:**
  - Revisado item **5. Necessidades e Funcionalidades**:  
    Foram removidos itens que se caracterizavam mais como tarefas do que funcionalidades, como:
    - Alerta de invasão
    - Sessões de usuários
    - Segurança contra scripts maliciosos
    - Verificação "não sou um robô"
    - Notificações de erro
    - Senhas difíceis
    - Encriptação de credenciais
    - Validação de e-mail
    - Layout responsivo

    Esses elementos estão implicitamente relacionados a outras funcionalidades já descritas.

  - Inclusão do item **6. Regras de Negócio**:  
    As regras foram definidas e associadas aos cenários descritos no documento de ECN.

---

### O que você encontrará neste repositório:

- **Pasta `Docs/`:**
  - Documentos (PDFs) com DVP, ECN, diagrama de caso de uso, diagrama de sequencia .

---


