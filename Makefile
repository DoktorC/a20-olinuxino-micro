DIR  ?=
ARM_PREFIX  = $(DIR)/arm-eabi
CXX         = $(ARM_PREFIX)-gcc
AS          = $(ARM_PREFIX)-as
LD          = $(ARM_PREFIX)-ld.bfd
OBJDUMP     = $(ARM_PREFIX)-objdump
OBJCPY      = $(ARM_PREFIX)-objcopy

.PHONY: blink-led serial

blink-led:
	@make -C $@ AS=$(AS) LD=$(LD) OBJCPY=$(OBJCPY) $@

serial:
	@make -C $@ AS=$(AS) LD=$(LD) OBJCPY=$(OBJCPY) $@

clean:
	@make -C blink-led clean
	@make -C serial clean
