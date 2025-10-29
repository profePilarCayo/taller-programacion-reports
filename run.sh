#!/usr/bin/env bash
set -e

# Descargar el JAR ( -f = fail si HTTP error, -L = seguir redirects )
curl -fL https://reposense.org/RepoSense.jar -o RepoSense.jar

# Verificación rápida (debería ser ~60-70 MB, no 9 KB)
ls -lh RepoSense.jar

# Ejecutar RepoSense con tu CSV y salida en /docs para GitHub Pages
java -jar RepoSense.jar \
  --repos-file repo-config.csv \
  --since "01-01-2025" \
  --until "today" \
  --timezone -3 \
  --output docs
