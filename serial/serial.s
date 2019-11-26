  .syntax unified
  .cpu cortex-a7
  .global _start
  .type _start, %function
  .thumb

_start:
  sub sp, 0x4
  mov r0, 0x0
  str r0, [sp]
  ldr r0, =0x1C28000  @ load UART0 base address
  mov r2, 0x14        @ UART_LSR offset
  add r3, r0, r2      @ UART_LSR address
  adr r4, msg         @ load addr of message to print
  mov r5, 0x14        @ message's length
  mov r6, 0x0         @ current char
  b config_led

config_led:
  ldr r0, =0x1C20800  @ load PIO base address
  eor r1, r0, 0xFC    @ compute port H CFG0 address
  ldr r0, [r1]        @ load port H CFG0 content
  mov r2, #1          @ configure as output
  lsl r2, #8
  eor r0, r0, r2
  str r0, [r1]        @ record configuration
  ldr r0, =0x1C20800  @ load PIO base address
  eor r1, r0, 0x10C   @ compute port H data reg address
  mov r7, 0x0         @ "is-led-on" flag clear
  b check_end_tx

delay:
  sub r2, #1
  cmp r2, #0
  bne delay
  cmp r7, 0x0         @ is led turn on?
  bne turn_off_led

check_end_tx:
  ldr r2, [r3]        @ Load UART_LSR content
  mov r1, #1          @ Check "TX Holding Register Empty"
  lsl r1, #5
  and r1, r2, r1

send:
  lsr r1, #5
  cmp r1, #1          @ TXHR empty?
  bne set_counter
  ldr r1, [r4]        @ get chunk
  mov r0, 0x0
  b read_chunk

read_chunk:
  add r0, 0x1
  str r0, [sp]
  ldr r0, =0x1C28000  @ load UART0 base address
  str r1, [r0]        @ write char
  lsr r1, 0x8         @ next char in chunk
  ldr r0, [sp]
  cmp r0, 0x4
  bne read_chunk
  add r4, 0x4         @ next chunk
  add r6, 0x4

exit:
  cmp r5, r6          @ read entire message?
  bne turn_on_led
  add sp, 0x4
  b loop

turn_on_led:
  ldr r0, =0x1C20800  @ load PIO base address
  eor r1, r0, 0x10C   @ compute port H data reg address
  ldr r0, [r1]        @ load port H data reg content
  mov r2, #1          @ turn on the led
  lsl r2, #2
  eor r0, r0, r2
  str r0, [r1]
  ldr r2, =#50000000
  mov r7, 0x1         @ "is-led-on" flag set
  b delay

turn_off_led:
  ldr r0, [r1]        @ load port H data reg content
  mov r2, #1          @ turn off the led
  lsl r2, #2
  mvn r2, r2
  and r0, r0, r2
  str r0, [r1]
  ldr r2, =#50000000
  mov r7, 0x0         @ "is-turn-on" flag clear
  b delay

loop:
  b loop

set_counter:
  mov r2, #100        @ Set delay counter
  b delay

msg:
  .string "Alan Mathison Turing"
