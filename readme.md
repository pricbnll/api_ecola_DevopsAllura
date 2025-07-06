# Imersão DevOps - Alura Google Cloud

Este projeto é uma API desenvolvida com FastAPI para gerenciar alunos, cursos e matrículas em uma instituição de ensino.

## Pré-requisitos

- [Python 3.10 ou superior instalado](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)
- [Docker](https://www.docker.com/get-started/)

## Passos para subir o projeto

1. **Faça o download do repositório:**
   [Clique aqui para realizar o download](https://github.com/guilhermeonrails/imersao-devops/archive/refs/heads/main.zip)

2. **Crie um ambiente virtual:**
   ```sh
   python3 -m venv ./venv
   ```

3. **Ative o ambiente virtual:**
   - No Linux/Mac:
     ```sh
     source venv/bin/activate
     ```
   - No Windows:
     ```sh
     venv\Scripts\activate
     ```

4. **Instale as dependências:**
   ```sh
   pip install -r requirements.txt
   ```

5. **Execute a aplicação:**
   ```sh
   uvicorn app:app --reload
   ```

6. **Acesse a documentação interativa:**

   Abra o navegador e acesse:  
   [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

   Aqui você pode testar todos os endpoints da API de forma interativa.

## Passos para subir o projeto com Docker Compose (Recomendado)

O `docker compose` simplifica o gerenciamento de containers, incluindo a persistência de dados.
Com a configuração abaixo, o banco de dados (`escola.db`) será salvo em um volume Docker, garantindo que os dados não sejam perdidos ao reiniciar o container.

1. **Execute o Docker Compose:**
<!-- Agora nao preciso usar os comando 2,3,4,5 e somente este comando sempre -->
   A partir da raiz do projeto, execute:
   ```sh
   docker compose up --build
   ```
   O comando `--build` garante que a imagem será reconstruída se houver alterações no `Dockerfile` ou no código. Para parar a aplicação, pressione `Ctrl+C`.

2. **Acesse a documentação interativa:**
   Abra o navegador e acesse: http://127.0.0.1:8000/docs

---

## Passos para subir o projeto com Docker

Se preferir não usar o `docker-compose`, você pode gerenciar o container manualmente.

1. **Construa a imagem Docker:**
   A partir da raiz do projeto, execute o comando:
   ```sh
   docker build -t api-allura-devops .
   ```

2. **Execute o container:**
   ```sh
   docker run --name api-allura-devops -p 8000:8000 api-allura-devops
   ```

3. **Acesse a documentação interativa:**
   Abra o navegador e acesse: [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

---

## Estrutura do Projeto

- `app.py`: Arquivo principal da aplicação FastAPI.
- `models.py`: Modelos do banco de dados (SQLAlchemy).
- `schemas.py`: Schemas de validação (Pydantic).
- `database.py`: Configuração do banco de dados SQLite.
- `routers/`: Diretório com os arquivos de rotas (alunos, cursos, matrículas).
- `requirements.txt`: Lista de dependências do projeto.

---

- O banco de dados SQLite será criado automaticamente como `escola.db` na primeira execução.
- Para reiniciar o banco, basta apagar o arquivo `escola.db` (isso apagará todos os dados).

---

## Autenticando no Google Cloud

   ```
   gcloud auth login
   gcloud config set project PROJECT_ID
   gcloud run deploy --port=8000
   
   ```

   ## Teste a api-allura-devops pela url da Google Cloud

   [link da Api](https://api-allura-devops-429672550229.southamerica-east1.run.app/docs#/)
