# n8n

Este projeto utiliza n8n em Docker.

## Configuração do Ambiente (.env)

O arquivo `.env` não é versionado por razões de segurança. Para configurar seu ambiente:

1.  Copie o arquivo `.env.example` para um novo arquivo chamado `.env`:
    ```powershell
    cp .env.example .env
    ```
2.  Abra o arquivo `.env` e preencha as variáveis necessárias, como as credenciais de SMTP:
    *   `N8N_SMTP_USER`: Seu e-mail (ex: seu.email@gmail.com)
    *   `N8N_SMTP_PASS`: Sua senha de aplicativo ou senha do e-mail.
    *   `N8N_SMTP_SENDER`: O e-mail que aparecerá como remetente.

## Comandos Úteis

-   `.\restart-n8n.ps1`: Reinicia o container n8n.
-   `.\stop-n8n.ps1`: Para o container n8n.
-   `.\update-n8n.ps1`: Atualiza a imagem do n8n.
