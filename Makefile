AS=lasm

all:: primes.bin primes.hex

primes.hex: primes.asm
	$(AS) --tasm --listing --cpu 8080 $<

primes.bin: primes.asm
	BASE=$(basename $@) ; \
	$(AS) --prog --listing --cpu 8080 $$BASE.asm && \
	p2bin $$BASE.p $@ -r 0x-0x
