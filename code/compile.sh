#!/bin/sh
riscv64-unknown-elf-gcc -Os -march=rv32i -mabi=ilp32 -mcmodel=medany -ffunction-sections -fdata-sections -ffreestanding -c func.c
riscv64-unknown-elf-gcc -Os -march=rv32i -mabi=ilp32 -mcmodel=medany -ffunction-sections -fdata-sections -ffreestanding -c start.s
riscv64-unknown-elf-gcc -Os -march=rv32i -mabi=ilp32 -mcmodel=medany -ffunction-sections -fdata-sections -ffreestanding -nostartfiles -nostdlib -nostdinc -static -lgcc -Wl,--nmagic -Wl,--gc-sections -T linker.ld start.o func.o -o a.out
riscv64-unknown-elf-objcopy -O binary a.out a.bin
xxd -g4 -c 4 -p a.bin > a.txt
riscv64-unknown-elf-objdump -D a.out > a.list
