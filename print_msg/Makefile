MAIN  = print_msg
SOURCES = $(MAIN)
OBJECTS   = $(addsuffix .o, $(SOURCES))

CXX    ?= arm-eabi-gcc
AS 		 ?= arm-eabi-as
LD		 ?= arm-eabi-ld
OBJCPY ?= arm-eabi-objcopy

RELOC_ADDR ?= 0x0
LDFLAGS		 ?= -Ttext=$(RELOC_ADDR)

.PHONY: $(SOURCES)

$(MAIN): $(MAIN).bin

$(MAIN).bin: $(MAIN).elf
	$(OBJCPY) -O binary $< $@

$(MAIN).elf: $(OBJECTS)
	$(LD) $(LDFLAGS) $^ -o $@

%.o:
	$(AS) -mcpu=cortex-a7 -mthumb $(patsubst %.o,%.s,$@) -o $@

clean:
	rm -rf $(OBJECTS)
	rm -rf $(MAIN).elf
	rm -rf $(MAIN).bin
