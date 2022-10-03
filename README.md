RABS Tools
=========

Inside this repository we develop the core tools of the RABS modelling
language.

## Language Manual


## **Installing Dependencies**

Running the RABS compiler requires Java (version 11 or greater) and Erlang (version 23 or greater) installed. Java can be downloaded, e.g., from https://adoptopenjdk.net. Erlang is available at https://www.erlang.org/downloads (but also check below for platform-specific instructions).

### **Installing dependencies on MacOS**

On MacOS, the homebrew package manager can be used to install the dependencies. After installing homebrew, run the following commands in a terminal:

`brew tap adoptopenjdk/openjdk`

`brew install erlang git adoptopenjdk11`

### Installing dependencies on Windows

On windows, the chocolatey package manager can be used to install the dependencies. First install chocolatey following the instructions at https://chocolatey.org/install, then run the following command in a terminal with Administrator rights:

`choco install openjdk11 git erlang visualstudio2019buildtools`

To compile the RABS tools, make sure to run the command `./gradlew` build from a developer shell (Start -> Visual Studio 2019 -> Developer PowerShell for VS 2019).

### Installing dependencies on Linux

On Linux, check if your distribution offers the necessary programs pre-packaged in the version needed (JDK11, Erlang >= 23, a C compiler); otherwise download from the distribution pages linked above.

## Compiling the RABS compiler from source

To compile the RABS compiler from source, clone the git repository and run gradle (after installing the necessary dependencies):


### Linux or macOS

`git clone https://github.com/razi236/ResourceABS`

`cd abstools`

`./gradlew assemble`

`frontend/bin/absc --help`

### Windows

`git clone "https://github.com/razi236/ResourceABS"`

`cd abstools`

`.\gradlew assemble`

`frontend\bin\absc.bat --help`




