  .syntax unified
  .cpu cortex-a7
  .global blink
  .type blink, %function
  .thumb

blink:
  ldr r0, =0x1C20800  @ load PIO base address
  eor r1, r0, 0xFC    @ compute port H CFG0 address
  ldr r0, [r1]        @ load port H CFG0 content
  mov r2, #1          @ configure as output
  lsl r2, #8
  eor r0, r0, r2
  str r0, [r1]        @ record configuration
  ldr r0, =0x1C20800  @ load PIO base address
  eor r1, r0, 0x10C   @ compute port H data reg address

turn_on:
  ldr r0, [r1]        @ load port H data reg content
  mov r2, #1          @ turn on the led
  lsl r2, #2
  eor r0, r0, r2
  str r0, [r1]
  mov r4, #1          @ "is-turn-on" flag set

set:
  ldr r3, =#50000000  @ about 1/20 of a second

delay:
  sub r3, #1
  cmp r3, #0
  bne delay
  cmp r4, #0
  beq turn_on

turn_off:
  ldr r0, [r1]        @ load port H data reg content
  mov r2, #1          @ turn off the led
  lsl r2, #2
  mvn r2, r2
  and r0, r0, r2
  str r0, [r1]
  mov r4, #0          @ "is-turn-on" flag cleared
  b set
