MAIN  = blink-led

CXX    ?= arm-eabi-gcc
AS 		 ?= arm-eabi-as
LD		 ?= arm-eabi-ld
OBJCPY ?= arm-eabi-objcopy

RELOC_ADDR ?= 0x0
LDFLAGS		 ?= -Ttext=$(RELOC_ADDR)

.PHONY: blink-led

$(MAIN): $(MAIN).bin

$(MAIN).bin: $(MAIN).elf
	$(OBJCPY) -O binary $< $@

$(MAIN).elf: $(MAIN).o
	$(LD) $(LDFLAGS) $< -o $@

$(MAIN).o:
	$(AS) -mcpu=cortex-a7 -mthumb $(patsubst %.o,%.s,$@) -o $@

clean:
	rm -rf $(MAIN).o
	rm -rf $(MAIN).elf
	rm -rf $(MAIN).bin
