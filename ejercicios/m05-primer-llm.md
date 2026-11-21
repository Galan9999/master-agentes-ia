# m05 · Primeras llamadas a un LLM

## Enunciado

Llamar a modelos de distintos proveedores desde Python con sus SDK, entender el objeto respuesta y medir
tokens y coste. Para ello, adaptar el notebook de la sesión en directo para que funcione en local, con las
claves en un `.env`.

## Qué se practica

- API frente a SDK: el mismo endpoint desde el SDK de OpenAI y desde el de Anthropic.
- OpenAI Responses frente a Chat Completions: `instructions`, `max_output_tokens` y `previous_response_id`.
- La estructura de la respuesta y `stop_reason`.
- Tokens y coste: `tiktoken`, endpoints de conteo y diferencia entre tokens de entrada y de salida.
- Parámetros de generación: `temperature` según el caso de uso; `stop` y `seed` solo existen en Chat
  Completions.
- Fallback entre proveedores con LiteLLM.
- Notebooks: el estado vive en la memoria del kernel (de ahí los `NameError` al ejecutar celdas sueltas).

## Ficheros

- `pyproject.toml`, `uv.lock`: SDK de OpenAI y Anthropic, `tiktoken`, `litellm`, `python-dotenv` y, como
  dependencia de desarrollo, `ipykernel`.
- `.env.example`: los nombres de las claves, sin valores.
- `notebooks/sesion-01-en-vivo.ipynb`: el notebook de la sesión, adaptado para ejecutarse en local.

## Cómo ejecutarlo

```bash
uv sync
cp .env.example .env   # y rellena las claves
```

Abre `notebooks/sesion-01-en-vivo.ipynb` en VS Code, elige el kernel de `.venv` y ejecuta las celdas en orden.

## Qué he aprendido

- El modelo no guarda estado: en una conversación, el historial se reenvía entero en cada turno, y por eso cada
  turno cuesta más que el anterior.
- El orden de las instrucciones pesa más que su formato.
- Un prompt de producción es un contrato: rol, audiencia y formato de salida explícitos.
- `stop` y `seed` fallaban en el notebook original porque la Responses API no los acepta; hay que usar Chat
  Completions.
