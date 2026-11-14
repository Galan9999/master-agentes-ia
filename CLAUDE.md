# AI Engineering 2026/11 (LIDR) — guía para Claude

Repo de ejercicios del máster **AI Engineering 2026/11 (LIDR)**. Lo leen los mentores para corregir.

## Cómo se organiza

- **Un solo proyecto que crece.** Los ejercicios están relacionados: el código vive en la raíz del repo y cada
  ejercicio lo amplía.
- **Una rama por ejercicio**: `ejercicio/<modulo>-<slug>` sale de `main` y vuelve con un PR. El diff del PR es lo
  que se corrige.
- **Ficha de cada ejercicio** en `ejercicios/<modulo>-<slug>.md`: enunciado resumido, qué se practica, qué
  ficheros toca, cómo ejecutarlo y qué se ha aprendido.

## Entorno

- Python con `uv`, un solo proyecto en la raíz (`pyproject.toml`, `uv.lock`, `.python-version` 3.13,
  `requires-python = ">=3.11"`). `uv sync` lo deja todo listo. No uses el `python3` del sistema.
- Dependencias con `uv add` (de desarrollo con `uv add --dev`). Node, si hace falta, con pnpm.
- Formato: un hook `PostToolUse` (`.claude/hooks/format-python.sh`) pasa `ruff format` a cada `.py` que se edita.

## Reglas

- **El código de los ejercicios lo escribe el alumno**; Claude guía y revisa, salvo que se le pida la solución.
- **Commits atómicos en inglés** con Conventional Commits (`feat(m04): …`, `docs: …`), siguiendo la skill
  `agent-skills:git-workflow-and-versioning`. Commit, push, PR y merge solo con OK explícito.
- **Nada de secretos**: claves en `.env` (ignorado), con un `.env.example` sin valores. Datos de ejemplo, siempre
  inventados.
