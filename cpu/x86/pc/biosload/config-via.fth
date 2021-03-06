\ See license at end of file
purpose: Configuration for loading from a USB key via Syslinux

\ --- The environment that "boots" OFW ---
\ - Image Format - Example Media - previous stage bootloader

\ - (Syslinux) COM32 format - USB Key w/ FAT FS - Syslinux
create syslinux-loaded

create via-demo

create debug-startup

create virtual-mode
create linux-support
\ create serial-console
\ create use-usb-debug-port
create pc

\ The disadvantage of the timestamp counter is that it changes speed with
\ CPU throttling.  The advantage is that it is 64 bits, so no rollover.
create use-timestamp-counter \ Use CPU's timestamp counter for "ms"
create use-tsc-timing        \ Use timestamp counter for t( .. )t

\ The advantage of the ACPI counter is that its speed is independent of
\ CPU throttling.  The disadvantage is that it is 32 bits, so it rolls
\ over every 20 minutes or so, unless you extend it with an SMI handler.
\ create use-acpi-timing
\ create use-acpi-delays

\ create pseudo-nvram
create resident-packages
create addresses-assigned  \ Don't reassign PCI addresses
\ create virtual-mode
create use-root-isa
\ create use-isa-ide
create use-ega
create use-elf
create use-watch-all
\ create use-null-nvram
create pseudo-nvram
create no-floppy-node

fload ${BP}/cpu/x86/pc/biosload/addrs.fth

\ LICENSE_BEGIN
\ Copyright (c) 2006 FirmWorks
\ 
\ Permission is hereby granted, free of charge, to any person obtaining
\ a copy of this software and associated documentation files (the
\ "Software"), to deal in the Software without restriction, including
\ without limitation the rights to use, copy, modify, merge, publish,
\ distribute, sublicense, and/or sell copies of the Software, and to
\ permit persons to whom the Software is furnished to do so, subject to
\ the following conditions:
\ 
\ The above copyright notice and this permission notice shall be
\ included in all copies or substantial portions of the Software.
\ 
\ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
\ EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
\ MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
\ NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
\ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
\ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
\ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
\
\ LICENSE_END
