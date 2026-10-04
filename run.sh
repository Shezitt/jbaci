#!/bin/sh
# Lanzador de jBACI para Linux (equivalente a run.bat / runc.bat / runp.bat)
# Uso: ./run.sh [archivo.cm|archivo.pm]
DIR="$(dirname "$(readlink -f "$0")")"
[ -n "$1" ] && FILE="$(readlink -f "$1")"
cd "$DIR" || exit 1

case "$DIR$FILE" in
  *" "*) echo "Aviso: jBACI no soporta espacios en las rutas; la compilación puede fallar." >&2 ;;
esac

# jBACI lee config.cfg del directorio actual. Se crea a partir de la
# plantilla y se apuntan los compiladores a los wrappers de wine.
[ -f config.cfg ] || cp config.default.cfg config.cfg
sed -i '/^PASCAL_COMPILER=/d; /^C_COMPILER=/d' config.cfg
echo "PASCAL_COMPILER=$DIR/bin/bapas" >> config.cfg
echo "C_COMPILER=$DIR/bin/bacc" >> config.cfg
grep -q '^SOURCE_DIRECTORY=/' config.cfg || {
  sed -i '/^SOURCE_DIRECTORY=/d' config.cfg
  echo "SOURCE_DIRECTORY=$DIR/examples" >> config.cfg
}

exec java -jar jbaci.jar ${FILE:+"$FILE"}
