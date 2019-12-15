  .syntax unified
  .cpu cortex-a7
  .text
  .global _start
  .type _start, %function
  .thumb

_start:
  push {lr}
  adr r2, .UART0
  ldr r2, [r2]        @ load UART0 base address
  adr r3, .UART0_LSR
  ldr r3, [r3]        @ cache LSR's content
  adr r4, .MSG        @ load addr of message to print
  mov r5, 0x14        @ msg's length

.LOOP:
  beq .EPILOGUE       @ r5 == 0x00?

.CHECK_TX:
  bl  .EMPTY_TX
  bne .PRINT
  bl  .DELAY
  b   .CHECK_TX

.PRINT:
  ldrb r0, [r4], 0x01
  strb r0, [r2]        @ write char
  subs r5, 0x01
  b    .LOOP

.EMPTY_TX:
  ldr r0, [r3]        @ load UART_LSR content
  lsr r0, 0x05
  mov r1, 0x01        @ check "TX Holding Register" empty
  ands r0, r1
  bx  lr

.DELAY:
  ldr r6, =0x1000

.DELAY_LOOP:
  subs r6, 0x01
  bne .DELAY_LOOP     @ r6 == 0x00?
  bx  lr

.EPILOGUE:
  mov r0, 0x0A
  strb r0, [r2]       @ print line-feed/new-line
  pop {lr}
  mov r0, r5          @ returns #chars printed
  bx  lr

.UART0:
  .word 0x1C28000
.UART0_LSR:
  .word 0x1C28014
.MSG:
  .string "Alan Mathison Turing"

