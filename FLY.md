# Deploying n8n to Fly.io

Este guia explica como fazer o deploy deste repositório de n8n no Fly.io.

## Pré-requisitos

1.  Ter o [Fly CLI](https://fly.io/docs/hands-on/install-cli/) instalado.
2.  Estar logado com `fly auth login`.

## Passo a Passo

### 1. Criar o App
Execute o comando abaixo e escolha um nome único para o seu app (ou aceite o sugerido):
```bash
fly launch
```
**Nota:** Quando perguntado se deseja fazer o deploy agora, responda `No`, pois precisamos configurar o volume e segredos primeiro.

### 2. Criar o Volume de Dados
O n8n precisa de um volume persistente para armazenar workflows, credenciais e banco de dados SQLite interno:
```bash
fly volumes create n8n_data --region gru --size 1
```
*(Ajuste a região e o tamanho em GB conforme necessário)*

### 3. Configurar Segredos (SMTP e outros)
Configure suas variáveis sensíveis como segredos no Fly.io:
```bash
fly secrets set \
  N8N_SMTP_USER="seu-email@gmail.com" \
  N8N_SMTP_PASS="sua-senha-app" \
  N8N_SMTP_SENDER="seu-email@gmail.com" \
  N8N_SMTP_HOST="smtp.gmail.com" \
  N8N_SMTP_PORT="465" \
  N8N_SMTP_SSL="true" \
  WEBHOOK_URL="https://seu-app-name.fly.dev/"
```
**Importante:** Substitua `seu-app-name` pelo nome do seu app no Fly.io.

### 4. Deploy
Agora você pode fazer o deploy:
```bash
fly deploy
```

## Notas Adicionais

-   **Memória:** O n8n é um pouco pesado. O `fly.toml` está configurado com 1GB de RAM, que é o mínimo recomendado para evitar crashes de "Out Of Memory".
-   **Webhook URL:** Lembre-se de que se você mudar o nome do app, precisará atualizar a variável `WEBHOOK_URL` nos segredos.
-   **Local Files:** A pasta `/files` (mapeada no Docker Compose local) não está configurada para persistência no Fly.io por padrão neste setup. Se precisar dela, considere criar outro volume.
