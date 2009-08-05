purpose: Secure NAND updater
\ See license at end of file

\ Depends on words from security.fth and copynand.fth

: get-hex#  ( -- n )
   safe-parse-word
   push-hex $number pop-base  " Bad number" ?nand-abort
;

0 [if]
0 value partition-map-offset
0 value next-partition-start

0 value partition#
d# 256 constant /partition-entry
: partition-adr  ( -- adr )  partition# /partition-entry *  load-base +  ;
: max-nand-offset  ( -- n )  " usable-page-limit" $call-nand /nand-page *  ;

: add-partition  ( name$ #eblocks -- )
   partition# " max#partitions" $call-nand >=  abort" Partition map overflow"

   -rot                                                ( #eblocks name$ )
   partition-adr /partition-entry erase                ( #eblocks name$ )
   d# 15 min  partition-adr swap move                  ( #eblocks )
   next-partition-start  partition-adr d# 16 + l!      ( #eblocks )

   dup -1 =  if                                        ( #eblocks )
      drop  max-nand-offset                            ( last-offset )
      next-partition-start -                           ( #bytes )
   else
      /nand-block *                                    ( #bytes )
   then                                                ( #bytes )

   dup partition-adr d# 24 +  l!             \ size    ( #bytes )

   next-partition-start + to next-partition-start      ( )
   next-partition-start max-nand-offset > abort" NAND size overflow"

   partition# 1+ to partition#
;
: start-partition-map  ( -- )
   load-base /nand-block h# ff fill
   0 to partition#
\   0 to next-partition-start
   " partition-map-page#" $call-nand  /nand-page *  to partition-map-offset

   partition-map-offset to next-partition-start
   " FIS directory" 1 add-partition   
;
: write-partition-map  ( -- )
   partition-map-offset /nand-page /  dup " erase-block" $call-nand
   load-base  swap  nand-pages/block  " write-pages" $call-nand
   nand-pages/block <> abort" Can't write partition map"
   " read-partmap" $call-nand
;

0 value partition-page-offset
: map-eblock# ( block# -- block#' )  partition-page-offset +  ;

\ XXX need to check for overwriting existing partition map
[then]

0 value last-eblock#
: erase-eblock  ( eblock# -- )
   drop \ XXX
;

0 value secure-fsupdate?
d# 128 constant /spec-maxline

: erase-gap  ( end-block -- )
   dup last-eblock# >  if
      last-eblock# 1+  ?do  i erase-eblock  loop   
   else
      drop
   then
;

vocabulary nand-commands
also nand-commands definitions

0 [if]
: set-partition:  ( "partitionid" -- )  \ partitionid is number or name
   safe-parse-word " $set-partition" $call-nand abort" Nonexistent partition#" 
;

: partitions:  ( "name" "#eblocks" ... -- )
   start-partition-map
   begin  parse-word  dup  while   ( name$ )
      get-hex#  add-partition      ( )
   repeat                          ( null$ )
   2drop
   write-partition-map
;
[then]

: zblocks:  ( "eblock-size" "#eblocks" ... -- )
   get-hex# to /nand-block
   get-hex# to #image-eblocks
   open-nand
   #image-eblocks  show-init
   get-inflater
;

: zblocks-end:  ( -- )  #image-eblocks  erase-gap  ;

: data:  ( "filename" -- )
   safe-parse-word fn-buf place
   " ${DN}${PN}\${CN}${FN}" expand$  image-name-buf place
   open-img
   true to secure-fsupdate?
;

: erase-all  ( -- )
   #image-eblocks  0  ?do  i erase-eblock  loop
   #image-eblocks show-writing
;

: get-zdata  ( comprlen -- )
   secure-fsupdate?  if
      load-base /spec-maxline  fileih read-line           ( len end? error? )
      " Spec line read error" ?nand-abort                 ( len end? )
      0= " Spec line too long" ?nand-abort                ( len )
      load-base swap                                      ( adr len )
      source $= 0=  " Spec line mismatch" ?nand-abort     ( )

      fileih                                              ( ih )
   else                                                   ( )
      source-id                                           ( ih )
   then                                                   ( ih )

   >r  load-base /nand-block +  over  r@  fgets           ( comprlen #read r: ih )
   <>  " Short read of zdata file" ?nand-abort            ( r: ih )

   r> fgetc newline <>                                    ( error? )
   " Missing newline after zdata" ?nand-abort             ( )

   \ The "2+" skips the Zlib header
   load-base /nand-block + 2+  load-base true  (inflate)      ( len )
   /nand-block <>  " Wrong expanded data length" ?nand-abort  ( )
;

: zblock: ( "eblock#" "comprlen" "hashname" "hash-of-128KiB" -- )
   get-hex#                              ( eblock# )
   get-hex# >r                           ( eblock# r: comprlen )
   safe-parse-word                       ( eblock# hashname$ r: comprlen )
   safe-parse-word hex-decode            ( eblock# hashname$ [ hash$ ] err? r: comprlen )
   " Malformed hash string" ?nand-abort  ( eblock# hashname$ hash$ r: comprlen )
                                        
   r> get-zdata                          ( eblock# hashname$ hash$ )

   2>r                                   ( eblock# hashname$ r: hash$ )
   load-base /nand-block 2swap           ( eblock# data$ hashname$ r: hash$ )
   hash                                  ( eblock# calc-hash$ r: hash$ )

   2r>  $=  0=  if                       ( eblock# )
      ." Bad hash for eblock# " .x cr cr
      ." Your USB key may be bad.  Please try a different one." cr
      ." See http://wiki.laptop.org/go/Bad_hash" cr cr
      abort
   then                                        ( eblock# )

   dup erase-gap                               ( eblock# )
   
   dup /nand-block um* " seek" $call-nand      ( eblock# error )
   " Bad seek" ?nand-abort                     ( eblock# )

   load-base /nand-block " write" $call-nand   ( eblock# #written )
   /nand-block <>                              ( eblock# error? )
   " Error writing to NAND FLASH" ?nand-abort  ( eblock# )

   dup to last-eblock#                         ( eblock# )
   show-written                                ( )
;

previous definitions

: fs-update  ( "devspec" -- )
   load-crypto  abort" Can't load hash routines"

   false to secure-fsupdate?
   safe-parse-word r/o open-file       ( fd )
   abort" Can't open file"             ( fd )

   file @                              ( fd fd' )
   over file !  linefeed line-delimiter c!  ( fd fd' )
   file !                              ( fd )


   also nand-commands   
   ['] include-file catch  dup  if
      nip .error
   then
   previous
   show-done
   close-nand-ihs
;

: do-fs-update  ( img$ -- )
   tuck  load-base h# c00000 +  swap move  ( len )
   load-base h# c00000 + swap              ( adr len )

   ['] noop to show-progress

\  clear-context  nand-commands
   also nand-commands
   
   true to secure-fsupdate?
   ['] include-buffer  catch  ?dup  if  nip nip  .error  security-failure  then

   previous
\  only forth also definitions

   show-done
   close-nand-ihs
;

: fs-update-from-list  ( devlist$ -- )
   load-crypto  if  visible  ." Crytpo load failed" cr  show-sad  security-failure   then

   visible                            ( devlist$ )
   begin  dup  while                  ( rem$ )
      bl left-parse-string            ( rem$ dev$ )
      dn-buf place                    ( rem$ )

      null$ pn-buf place              ( rem$ )
      null$ cn-buf place              ( rem$ )
      " fs" bundle-present?  if       ( rem$ )
         " Filesystem image found - " ?lease-debug
         fskey$ to pubkey$            ( rem$ )
         img$  sig$  sha-valid?  if   ( rem$ )
            2drop                     ( )
            show-unlock               ( )
            img$ do-fs-update         ( )
            ." Rebooting in 10 seconds ..." cr
            d# 10,000 ms  bye
            exit
         then                         ( rem$ )
         show-lock                    ( rem$ )
      then                            ( rem$ )
   repeat                             ( rem$ )
   2drop
;
: update-devices  " disk: sd: http:\\172.18.0.1"  ;
: try-fs-update  ( -- )
   ." Searching for a NAND file system update image." cr
   " disk: sd:" fs-update-from-list
[ifdef] Later
   ." Trying NANDblaster" cr
   ['] nandblaster catch  0=  if  exit  then
   " http:\\172.18.0.1" fs-update-from-list
[then]
;

: $update-nand  ( devspec$ -- )
   load-crypto abort" Can't load the crypto functions"
   null$ cn-buf place                           ( devspec$ )
   2dup                                         ( devspec$ devspec$ )
   [char] : right-split-string dn-buf place     ( devspec$ path+file$ )
   [char] \ right-split-string                  ( devspec$ file$ path$ )
   dup  if  1-  then  pn-buf place              ( devspec$ file$ )
   2drop                                        ( devspec$ )
   boot-read loaded do-fs-update                ( )
;
: update-nand  ( "devspec" -- )  safe-parse-word  $update-nand  ;

\ LICENSE_BEGIN
\ Copyright (c) 2007 FirmWorks
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