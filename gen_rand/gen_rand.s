  .syntax unified
  .cpu    cortex-a7
  .text
  .global start
  .type   _start, %function
  .thumb

_start:
  adr r0, .AHB_CLOCK_GATING_0
  ldr r0, [r0]
  ldr r1, [r0]
  mov r2, 0x01
  eor r1, r1, r2, LSL 0x05
  str r1, [r0]          @ pass clock to SS
  adr r0, .SS_CLK_REG
  ldr r0, [r0]          @ SS Clock Reg
  mov r1, 0x01
  lsl r1, #31
  str r1, [r0]          @ activate SS w/ minimal configuration [24Mhz]
  mov r2, 0x53
  adr r0, .SS_REG
  ldr r0, [r0]
  str r2, [r0]          @ set PRNG mode, enable it, start it
  ldr r2, =0x1000
.DELAY:
  subs r2, 0x01
  bne  .DELAY
  adr r0, .SS_MD_0
  ldr r0, [r0]
  ldr r0, [r0]          @ print MD[0]
  bx lr

.AHB_CLOCK_GATING_0:
  .word 0x01C20060

.SS_REG:
  .word 0x01C15000

.SS_MD_0:
  .word 0x01C1504C

.SS_CLK_REG:
  .word 0x01C2009C
