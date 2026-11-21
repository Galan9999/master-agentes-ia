# m04 · Entorno de trabajo

## Enunciado

Dejar preparado el entorno sobre el que crecerá el proyecto del máster: Python gestionado con `uv`, Docker
instalado y comprobado, y una API mínima con FastAPI que responda a un endpoint de salud.

## Qué se practica

- Proyecto Python con `uv`: `pyproject.toml`, `uv.lock`, `.venv` y `.python-version`.
- Dependencias normales frente a las de desarrollo (`[dependency-groups]`) y los extras (`fastapi[standard]`).
- FastAPI: decoradores de ruta, devolver un `dict` que se serializa a JSON y la documentación automática en
  `/docs` y `/openapi.json`.
- Docker: diferencia entre imagen y contenedor, y `docker ps -a`.

## Ficheros

- `pyproject.toml`, `uv.lock`, `.python-version`: el proyecto y sus dependencias (FastAPI y ruff).
- `main.py`: la app con `GET /health`.

## Cómo ejecutarlo

```bash
uv sync
uv run fastapi dev main.py
curl http://127.0.0.1:8000/health   # {"status":"ok"}
```

La documentación interactiva queda en http://127.0.0.1:8000/docs.

## Qué he aprendido

- `uv` hace el papel de npm + nvm: el lock fija las versiones y `.python-version` fija el intérprete.
- Una función de ruta tiene que hacer `return`. Si solo hace `print`, la respuesta es `null`.
- Con `fastapi dev` no hace falta el bloque `if __name__ == "__main__"`: el servidor importa la app.
- Queda pendiente para otro ejercicio: Dockerfile, puertos, volúmenes y `docker compose` con esta API.
