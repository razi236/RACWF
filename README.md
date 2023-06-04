RACWF
=========
`RACWF`is a decision support system for efficient resource allocation in cross-organisational workflows.


## **Installing Dependencies**

Running the `RACWF` requires Java (version 11 or greater) and `ABSTools` installed. `ABSTools`'s installation requires Erlang (version 23 or greater).

Java can be downloaded, e.g., from https://adoptopenjdk.net. Erlang is available at https://www.erlang.org/downloads (but also check below for platform-specific instructions).

### **Installing dependencies on MacOS**

On MacOS, the homebrew package manager can be used to install the dependencies. After installing homebrew, run the following commands in a terminal:

`brew tap adoptopenjdk/openjdk`

`brew install erlang git adoptopenjdk11`

### Installing dependencies on Windows

On Windows, the chocolatey package manager can be used to install the dependencies. First install chocolatey following the instructions at https://chocolatey.org/install, then run the following command in a terminal with Administrator rights:

`choco install openjdk11 git erlang visualstudio2019buildtools`

To compile the RACWF, make sure to run the command `./gradlew` build from a developer shell (Start -> Visual Studio 2019 -> Developer PowerShell for VS 2019).

### Installing dependencies on Linux

On Linux, check if your distribution offers the necessary programs pre-packaged in the version needed (JDK11, Erlang >= 23, a C compiler); otherwise download from the distribution pages linked above.

### Installing the RACWF from source

To install the `RACWF`, clone the git repository and run gradle (after installing the necessary dependencies):

`https://github.com/razi236/RACWF.git`

`cd RACWF`

`./gradlew assemble`


### Running the RACWF source file

Use the following command to run RACWF.

`make`
