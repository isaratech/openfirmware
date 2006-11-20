\ See license at end of file
purpose: Create memory node properties and lists

dev /memory

[ifdef] notdef
: cmos@   ( offset -- byte )  h# 70 pc!  h# 71 pc@  ;
: /ram  ( -- #bytes )
   \ The BIOS puts the number of kilobytes of extended memory in CMOS memory
   \ locations 30,31. The total memory is that plus the low meg.
   h# 30 cmos@  h# 31 cmos@  bwjoin    ( #kbytes-extended )
   d# 1024 +                           ( #kbytes-total )
   d# 1024 *                           ( #bytes )
;
[else]
h# 770.0000 constant /ram   \ 128 MB
[then]

: release-range  ( start-adr end-adr -- )  over - release  ;

: probe  ( -- )
   gpio-data@ 4 and  if  h# 770.0000  else  h# f70.0000  then  to /ram

   0 /ram  reg   \ Report extant memory

   \ Put h# 10.0000-1f.ffff and 28.0000-memsize in pool,
   \ reserving 0..10.0000 for the firmware
   \ and 20.0000-27.ffff for the "flash"

\   h#  0.0000  h# 02.0000  release   \ A little bit of DMA space, we hope
\   h# 10.0000  h# 0f.ffff  release
\   h# 28.0000  h# 80.0000 h# 28.0000 -  release

\ Release some of the first meg, between the page tables and the DOS hole,
\ for use as DMA memory.
   mem-info-pa 2 la+ l@   h# a.0000  release-range  \ Below DOS hole

[ifdef] virtual-mode
   h# 10.0000  dropin-base over -  release
   dropin-base dropin-size +  mem-info-pa la1+ l@  over -  release
[else]
   h# 10.0000                             ( free-bot )
   fw-pa dropin-base umin  dma-base umin  ( free-bot free-top )
   over -  release

   fw-pa /fw-ram +  dropin-base dropin-size + umax  dma-base dma-size + umax
   /ram  over -  release
[then]
;

device-end

also forth definitions
stand-init: Probing memory
   " probe" memory-node @ $call-method  
;
previous definitions
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
