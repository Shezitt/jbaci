# jBACI para Linux

[English](README.md) | **Español**

jBACI 1.4.5 listo para usar en Linux. Se usa para aprender programación concurrente: procesos, semáforos y monitores.

**jBACI** es un entorno de desarrollo y simulador creado por Moti Ben-Ari. Permite escribir programas concurrentes en **C--** (`.cm`) o **Pascal** (`.pm`), compilarlos y ejecutarlos paso a paso. Mientras se ejecutan, muestra los procesos, las variables globales y cómo se intercalan las instrucciones.

La distribución original es para Windows. Este repositorio agrega lo necesario para usarla en Linux.

## Cómo funciona en Linux

- `jbaci.jar` es una aplicación Java, así que corre tal cual.
- Los compiladores `bin/bacc.exe` (C--) y `bin/bapas.exe` (Pascal) son ejecutables de Windows. Se ejecutan con [Wine](https://www.winehq.org/) mediante los scripts `bin/bacc` y `bin/bapas`.
- `run.sh` abre jBACI y genera `config.cfg` con las rutas correctas de los compiladores.

## Requisitos

- Java (probado con OpenJDK 21)
- Wine con soporte para programas de 32 bits

En Debian o Ubuntu:

```sh
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install default-jre wine wine32:i386
```

## Uso

```sh
git clone https://github.com/Shezitt/jbaci.git
cd jbaci
./run.sh                      # abre jBACI
./run.sh examples/hello.pm    # abre un archivo directamente
```

Tus programas pueden estar en cualquier carpeta. Hay dos cosas a tener en cuenta:

- **Sin espacios en las rutas:** jBACI no maneja rutas con espacios, ni en la carpeta del programa ni en el nombre del archivo.
- **Los `#include` buscan en la misma carpeta:** por ejemplo, `#include "gdefs.cm"` busca el archivo en la carpeta del programa que lo incluye.

También puedes usar los compiladores desde la terminal:

```sh
bin/bacc  programa.cm   # genera programa.pco y programa.lst
bin/bapas programa.pm
```

## Contenido

| Ruta | Descripción |
|------|-------------|
| `jbaci.jar` | jBACI 1.4.5 (interfaz e intérprete) |
| `bin/bacc.exe`, `bin/bapas.exe` | Compiladores BACI originales para Windows |
| `bin/bacc`, `bin/bapas` | Scripts que ejecutan los compiladores con Wine |
| `run.sh` | Lanzador para Linux |
| `config.default.cfg` | Configuración inicial de jBACI |
| `examples/` | Programas de ejemplo en C-- y Pascal |
| `run.bat`, `runc.bat`, `runp.bat` | Lanzadores originales para Windows |

## Origen y créditos

- **jBACI**: © 2002-2004 Mordechai (Moti) Ben-Ari. Basado en BACI Debugger, © 1999 David Strite. El código fuente original está en [motib/jbaci](https://github.com/motib/jbaci).
- **BACI** (Ben-Ari Concurrent Interpreter) y sus compiladores `bacc` y `bapas`: Bill Bynum y Tracy Camp.
- La distribución original (`jbaci145.zip`) la entregaron en la materia *Taller de Sistemas Operativos*, Facultad de Ciencias y Tecnología, Universidad Mayor de San Simón (UMSS).

## Licencia

jBACI se distribuye bajo la [GNU General Public License, versión 2 o posterior](COPYING), según su autor. Los compiladores BACI pertenecen a sus autores y se incluyen tal como venían en la distribución original de jBACI.
