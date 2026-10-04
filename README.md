# jBACI for Linux

**English** | [Español](README.es.md)

jBACI 1.4.5, ready to use on Linux. It is used to learn concurrent programming: processes, semaphores and monitors.

**jBACI** is a development environment and simulator created by Moti Ben-Ari. You write concurrent programs in **C--** (`.cm`) or **Pascal** (`.pm`), compile them and run them step by step. While a program runs, jBACI shows the processes, the global variables and how the instructions interleave.

The original distribution is for Windows. This repository adds what is needed to use it on Linux.

## How it works on Linux

- `jbaci.jar` is a Java application, so it runs as is.
- The compilers `bin/bacc.exe` (C--) and `bin/bapas.exe` (Pascal) are Windows executables. They run under [Wine](https://www.winehq.org/) through the scripts `bin/bacc` and `bin/bapas`.
- `run.sh` starts jBACI and generates `config.cfg` with the correct compiler paths.

## Requirements

- Java (tested with OpenJDK 21)
- Wine with support for 32-bit programs

On Debian or Ubuntu:

```sh
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install default-jre wine wine32:i386
```

## Usage

```sh
git clone https://github.com/Shezitt/jbaci.git
cd jbaci
./run.sh                      # start jBACI
./run.sh examples/hello.pm    # open a file directly
```

Your programs can live in any folder. Keep two things in mind:

- **No spaces in paths:** jBACI does not handle paths with spaces, either in the program's folder or in the file name.
- **`#include` looks in the same folder:** for example, `#include "gdefs.cm"` looks for the file in the folder of the program that includes it.

You can also use the compilers from the terminal:

```sh
bin/bacc  program.cm   # produces program.pco and program.lst
bin/bapas program.pm
```

## Contents

| Path | Description |
|------|-------------|
| `jbaci.jar` | jBACI 1.4.5 (user interface and interpreter) |
| `bin/bacc.exe`, `bin/bapas.exe` | Original BACI compilers for Windows |
| `bin/bacc`, `bin/bapas` | Scripts that run the compilers under Wine |
| `run.sh` | Linux launcher |
| `config.default.cfg` | Initial jBACI configuration |
| `examples/` | Example programs in C-- and Pascal |
| `run.bat`, `runc.bat`, `runp.bat` | Original Windows launchers |

## Origin and credits

- **jBACI**: © 2002-2004 Mordechai (Moti) Ben-Ari. Based on BACI Debugger, © 1999 David Strite. The original source code is at [motib/jbaci](https://github.com/motib/jbaci).
- **BACI** (Ben-Ari Concurrent Interpreter) and its compilers `bacc` and `bapas`: Bill Bynum and Tracy Camp.
- The original distribution (`jbaci145.zip`) was provided in the *Taller de Sistemas Operativos* (Operating Systems Workshop) course, Facultad de Ciencias y Tecnología, Universidad Mayor de San Simón (UMSS), Bolivia.

## License

jBACI is distributed under the [GNU General Public License, version 2 or later](COPYING), as stated by its author. The BACI compilers belong to their authors and are included as they came in the original jBACI distribution.
