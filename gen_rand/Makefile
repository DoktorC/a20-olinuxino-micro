MAIN  = gen_rand

CXX    ?= arm-eabi-gcc
AS 		 ?= arm-eabi-as
LD		 ?= arm-eabi-ld
OBJCPY ?= arm-eabi-objcopy

ARCH ?= -mcpu=cortex-a7 -mthumb
RELOC_ADDR ?= 0x0
LDFLAGS		 ?= -Ttext=$(RELOC_ADDR)

.PHONY: prng

$(MAIN): $(MAIN).bin

$(MAIN).bin: $(MAIN).elf
	$(OBJCPY) -O binary $< $@

$(MAIN).elf: $(MAIN).o
	$(LD) $(LDFLAGS) $< -o $@

$(MAIN).o:
	$(AS) $(ARCH) $(patsubst %.o,%.s,$@) -o $@

clean:
	rm -rf $(MAIN).o
	rm -rf $(MAIN).elf
	rm -rf $(MAIN).bin
