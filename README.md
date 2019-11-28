# Introduction
Repo for several programs targetting the AllWinner A20-OLinuXino-MICRO board.

Currently, all the programs are run after u-boot board initialization.

## Documentation
The following is a list of documents, and links where to find them, that I
personally employ for development on the AllWinner A20-OLinuXino-MICRO board.

### ARM References:

 * [ARM Architecture Reference Manual - ARMv7-A/R Edition - Issue D](https://static.docs.arm.com/ddi0406/cd/DDI0406C_d_armv7ar_arm.pdf?_ga=2.57310826.1757749621.1574847913-298474141.1565170953). Last access: 27.11.2019.

 * [ARM and Thumb2 Instruction Set - Quick Card Reference - Issue M](http://infocenter.arm.com/help/topic/com.arm.doc.qrc0001m/QRC0001_UAL.pdf). Last access: 27.11.2019.

### A20-OlinuXino-Micro References:

 * [A20-OlinuXino-Micro - User's Manual - Revision S](https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-MICRO/resources/A20-OLinuXino-Micro.pdf). Last Access: 27.11.2019.
 * [A20 User Manual - Revision 1.4](https://github.com/allwinner-zh/documents/blob/master/A20/A20_User_Manual_v1.4_20150510.pdf). Last Access: 27.11.2019.
 * [A20-OlinuXino-Micro - Hardware Schematics - Revision from G1 to L1](https://github.com/OLIMEX/OLINUXINO/tree/master/HARDWARE/A20-OLinuXino-MICRO). Last Access: 28.11.2019.

## Toolchain
You can download the bare-metal GNU toolchain (Cortex-A family) directly from
[developer.arm.com](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads)

## Configure
If you already have the toolchain's directory in your `PATH`, you're good to go.
Otherwise, you have to specify the directory in the `DIR` variable of the top-level
Makefile.

## How to build
A top-level Makefile manages the building of each program.

To build all programs, simply type `make` or `make all`.

For building a subset of programs, simply append their folder's name to `make`:

```make $(FOLDER_NAME_1) $(FOLDER_NAME_2) ... $(FOLDER_NAME_N)```

For example:

```make blink-led```

builds the blink-led program.
