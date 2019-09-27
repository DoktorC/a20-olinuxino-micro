DIR  ?=
ARM_PREFIX  = $(DIR)/arm-eabi
CXX         = $(ARM_PREFIX)-gcc
AS          = $(ARM_PREFIX)-as
LD          = $(ARM_PREFIX)-ld.bfd
OBJDUMP     = $(ARM_PREFIX)-objdump
OBJCPY      = $(ARM_PREFIX)-objcopy

.PHONY: blink-led

blink-led:
	@make -C $@ AS=$(AS) LD=$(LD) OBJCPY=$(OBJCPY) $@

clean:
	@make -C blink-led clean
