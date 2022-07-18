MEMORY {
  ram : ORIGIN = 0x80000000, LENGTH = 0x4000
}

ENTRY(asm_start)

SECTIONS {
  .text : {
    */start.o (.text*);
    *(.text*);
  } > ram

  .rodata : {
    *(.rodata*);
  } > ram

  .bss : {
    *(.bss*);
  } > ram
}
