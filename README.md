# Introduction
Repo for several programs targetting the AllWinner A20-OLinuXino-MICRO board.

Currently, all the programs are run after u-boot board initialization.

## Toolchain
You can download the bare-metal GNU toolchain (Cortex-A family) directly from
[developer.arm.com](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads)

## How to build
A top-level Makefile manages the building of each program.

To build all programs, simply type `make` or `make all`.

For building a subset of programs, simply append their folder's name to `make`:

```make $(FOLDER_NAME_1) $(FOLDER_NAME_2) ... $(FOLDER_NAME_N)```

For example:

```make blink-led```

builds the blink-led program.
