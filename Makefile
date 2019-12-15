DIR  ?=
ARM_PREFIX  = $(DIR)/arm-eabi
CXX         = $(ARM_PREFIX)-gcc
AS          = $(ARM_PREFIX)-as
LD          = $(ARM_PREFIX)-ld.bfd
OBJDUMP     = $(ARM_PREFIX)-objdump
OBJCPY      = $(ARM_PREFIX)-objcopy

all: blink-led print_msg

.PHONY: blink-led print_msg

blink-led:
	@make -C $@ AS=$(AS) LD=$(LD) OBJCPY=$(OBJCPY) $@

print_msg:
	@make -C $@ AS=$(AS) LD=$(LD) OBJCPY=$(OBJCPY) $@

clean:
	@make -C blink-led clean
	@make -C print_msg clean
