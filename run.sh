#!/usr/bin/env bash
set -e

# 1) Descarga del jar (deja esto tal cual)
REPOSENSE_VERSION="latest"
curl -L -o RepoSense.jar "https://reposense.org/RepoSense.jar"

# 2) Archivos de configuración (usa tus CSV)
REPOS_FILE="repo-config.csv"           # <- el que ya editaste
AUTHOR_CONFIG="author-config.csv"      # <- opcional (podés dejarlo vacío si no lo usás)
GROUP_CONFIG="group-config.csv"        # <- opcional

# 3) Salida donde GitHub Pages publicará el reporte
OUTPUT_DIR="docs"                      # <- importante para Pages

# 4) Parámetros útiles (ajustá si querés)
SINCE="01-01-2025"                     # o "since 4 months ago"
UNTIL="today"
TIMEZONE="-3"                          # Argentina

# 5) Ejecución (usa solo lo que tengas)
java -jar RepoSense.jar \
  --repos-file "${REPOS_FILE}" \
  --author-config-file "${AUTHOR_CONFIG}" \
  --group-config-file "${GROUP_CONFIG}" \
  --since "${SINCE}" --until "${UNTIL}" \
  --timezone "${TIMEZONE}" \
  --output "${OUTPUT_DIR}"

