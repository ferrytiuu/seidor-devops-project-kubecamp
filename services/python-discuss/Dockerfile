# Github webhook testing 

# Etapa 1: Construir la aplicación
FROM mcr.microsoft.com/devcontainers/python:3.10-bullseye as build

# Instala Poetry
RUN pip install poetry

# Establecer el directorio de trabajo
WORKDIR /app

# Copia los archivos de la aplicación (incluyendo pyproject.toml y poetry.lock)
COPY . .

# Instala las dependencias de desarrollo y producción con Poetry
RUN poetry install

# Etapa 2: Crear la imagen de producción
FROM python:3.10-slim-bullseye as production

# Establecer el directorio de trabajo
WORKDIR /app

RUN pip install fastapi uvicorn pymongo python-dotenv pydantic typing requests 

# Copia la aplicación y las dependencias de la etapa de construcción
COPY --from=build /app /app

# CMD para ejecutar el script principal de Python (ajusta el comando según tus necesidades)
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8083"]