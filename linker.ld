ENTRY(start)

SECTIONS {
    . = 1M;

    .boot :
    {
        /* Ensure the multiboot_header is at the beginning */
        *(.multiboot_header)
    }

    .text :
    {
        *(.text)
    }
}
