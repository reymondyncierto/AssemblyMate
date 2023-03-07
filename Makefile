NASM = nasm
LD = ld

SRCS := $(wildcard *.asm)
OBJS := $(SRCS:.asm=.o)
BINS := $(SRCS:.asm=)

all: $(BINS)

%: %.o
	$(LD) -o $@ $<

%.o: %.asm
	$(NASM) -f elf64 -o $@ $<

clean:
	rm -f $(OBJS) $(BINS)