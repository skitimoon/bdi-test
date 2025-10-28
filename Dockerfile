# Use a Python image with uv pre-installed
FROM ghcr.io/astral-sh/uv:python3.13-trixie-slim

WORKDIR /app

ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy

COPY . /app

RUN uv sync --locked --no-dev

CMD ["uv", "run", "app/hello.py"]
