# Use an official Python runtime as a parent image
FROM python:3.12.11-alpine3.22
# FROM python:3.10-slim 
# Consistência: Alinha a imagem Docker com a versão 3.10 recomendada no readme.md, aumentando a previsibilidade.
# Compatibilidade: A variante slim (baseada em Debian) oferece maior compatibilidade com pacotes Python que dependem de compilação, sendo uma escolha mais robusta que a alpine para a maioria dos casos de uso, conforme discutimos.
# FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
# This is done first to leverage Docker's layer caching.
# If requirements.txt doesn't change, this layer won't be rebuilt.
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's code to the working directory
COPY . .

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run app.py when the container launches
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]