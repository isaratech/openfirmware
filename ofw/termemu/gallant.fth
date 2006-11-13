\ ========== Copyright Header Begin ==========================================
\ 
\ Hypervisor Software File: gallant.fth
\ 
\ Copyright (c) 2006 Sun Microsystems, Inc. All Rights Reserved.
\ 
\  - Do no alter or remove copyright notices
\ 
\  - Redistribution and use of this software in source and binary forms, with 
\    or without modification, are permitted provided that the following 
\    conditions are met: 
\ 
\  - Redistribution of source code must retain the above copyright notice, 
\    this list of conditions and the following disclaimer.
\ 
\  - Redistribution in binary form must reproduce the above copyright notice,
\    this list of conditions and the following disclaimer in the
\    documentation and/or other materials provided with the distribution. 
\ 
\    Neither the name of Sun Microsystems, Inc. or the names of contributors 
\ may be used to endorse or promote products derived from this software 
\ without specific prior written permission. 
\ 
\     This software is provided "AS IS," without a warranty of any kind. 
\ ALL EXPRESS OR IMPLIED CONDITIONS, REPRESENTATIONS AND WARRANTIES, 
\ INCLUDING ANY IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A 
\ PARTICULAR PURPOSE OR NON-INFRINGEMENT, ARE HEREBY EXCLUDED. SUN 
\ MICROSYSTEMS, INC. ("SUN") AND ITS LICENSORS SHALL NOT BE LIABLE FOR 
\ ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR 
\ DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES. IN NO EVENT WILL SUN 
\ OR ITS LICENSORS BE LIABLE FOR ANY LOST REVENUE, PROFIT OR DATA, OR 
\ FOR DIRECT, INDIRECT, SPECIAL, CONSEQUENTIAL, INCIDENTAL OR PUNITIVE 
\ DAMAGES, HOWEVER CAUSED AND REGARDLESS OF THE THEORY OF LIABILITY, 
\ ARISING OUT OF THE USE OF OR INABILITY TO USE THIS SOFTWARE, EVEN IF 
\ SUN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
\ 
\ You acknowledge that this software is not designed, licensed or
\ intended for use in the design, construction, operation or maintenance of
\ any nuclear facility. 
\ 
\ ========== Copyright Header End ============================================
purpose: Include gallant font in dictionary
copyright: Copyright 1990-1994 Sun Microsystems, Inc.  All Rights Reserved

hex
headerless
label gallant-romfont
   666f6e74 l, 0000000c l, 00000016 l, 00000002 l,
   00000020 l, 000000e0 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 06000600 l, 06000600 l, 06000600 l,
   06000600 l, 06000600 l, 06000000 l, 00000600 l,
   06000000 l, 00000000 l, 00000000 l, 00001980 l,
   19801980 l, 19801980 l, 19800000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 03300330 l, 03300660 l,
   1ff01ff0 l, 0cc00cc0 l, 19801980 l, 7fc07fc0 l,
   33006600 l, 66000000 l, 00000000 l, 00000000 l,
   00000600 l, 1f803fc0 l, 66e06660 l, 66003e00 l,
   1f8007c0 l, 06600660 l, 66607fc0 l, 3f800600 l,
   00000000 l, 00000000 l, 00000000 l, 000038c0 l,
   4cc04580 l, 65803b00 l, 03000600 l, 06000c00 l,
   0dc01a60 l, 1a203320 l, 31c00000 l, 00000000 l,
   00000000 l, 00000700 l, 0f8018c0 l, 18c018c0 l,
   0f801e00 l, 3e007700 l, 636061e0 l, 61c06180 l,
   3fe01e60 l, 00000000 l, 00000000 l, 00000000 l,
   0c001e00 l, 1e000600 l, 06000c00 l, 18001000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000180 l, 03000600 l,
   06000c00 l, 0c000c00 l, 0c000c00 l, 0c000c00 l,
   06000600 l, 03000180 l, 00000000 l, 00000000 l,
   00000000 l, 18000c00 l, 06000600 l, 03000300 l,
   03000300 l, 03000300 l, 03000600 l, 06000c00 l,
   18000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000f00 l, 06006660 l, 76e01980 l,
   00001980 l, 76e06660 l, 06000f00 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000600 l, 06000600 l, 06007fe0 l, 7fe00600 l,
   06000600 l, 06000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000c00 l, 1e001e00 l,
   06000600 l, 0c001800 l, 10000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00007fe0 l,
   7fe00000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 0c001e00 l,
   1e000c00 l, 00000000 l, 00000000 l, 00000000 l,
   006000c0 l, 00c00180 l, 01800300 l, 03000600 l,
   06000c00 l, 0c001800 l, 18003000 l, 30006000 l,
   00000000 l, 00000000 l, 00000700 l, 0f801180 l,
   10c030c0 l, 30c030c0 l, 30c030c0 l, 30c030c0 l,
   30801880 l, 1f000e00 l, 00000000 l, 00000000 l,
   00000000 l, 02000600 l, 0e001e00 l, 36000600 l,
   06000600 l, 06000600 l, 06000600 l, 06000600 l,
   3fc00000 l, 00000000 l, 00000000 l, 00001f00 l,
   3f8061c0 l, 40c000c0 l, 00c000c0 l, 01800300 l,
   06000c00 l, 18003020 l, 7fe07fe0 l, 00000000 l,
   00000000 l, 00000000 l, 0f801fc0 l, 20e04060 l,
   006000e0 l, 07c00fc0 l, 00e00060 l, 00604060 l,
   60403f80 l, 1f000000 l, 00000000 l, 00000000 l,
   00000180 l, 03800380 l, 05800580 l, 09800980 l,
   11801180 l, 21803fe0 l, 7fe00180 l, 01800180 l,
   00000000 l, 00000000 l, 00000000 l, 0fc00fc0 l,
   10001000 l, 20003f80 l, 31c000e0 l, 00600060 l,
   00604060 l, 606030c0 l, 1f800000 l, 00000000 l,
   00000000 l, 00000700 l, 0c001800 l, 30003000 l,
   60006780 l, 6fc070e0 l, 60606060 l, 60607040 l,
   3f801f00 l, 00000000 l, 00000000 l, 00000000 l,
   1fe03fe0 l, 60400040 l, 00c00080 l, 00800180 l,
   01000100 l, 03000200 l, 02000600 l, 04000000 l,
   00000000 l, 00000000 l, 00000f00 l, 118030c0 l,
   30c030c0 l, 18800d00 l, 06000b00 l, 118030c0 l,
   30c030c0 l, 18800f00 l, 00000000 l, 00000000 l,
   00000000 l, 0f8011c0 l, 20e06060 l, 60606060 l,
   70e03f60 l, 1e600060 l, 00c000c0 l, 01800700 l,
   3c000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 0c001e00 l, 1e000c00 l,
   00000000 l, 0c001e00 l, 1e000c00 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 0c001e00 l, 1e000c00 l, 00000000 l,
   0c001e00 l, 1e000600 l, 06000c00 l, 18001000 l,
   00000000 l, 00000000 l, 00000000 l, 006001c0 l,
   07001c00 l, 70007000 l, 1c000700 l, 01c00060 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00007fe0 l, 7fe00000 l,
   00007fe0 l, 7fe00000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   60003800 l, 0e000380 l, 00e000e0 l, 03800e00 l,
   38006000 l, 00000000 l, 00000000 l, 00000000 l,
   0f001f80 l, 39c020c0 l, 00c000c0 l, 01800300 l,
   06000c00 l, 0c000000 l, 00000c00 l, 0c000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   0f803fc0 l, 30606060 l, 67206fa0 l, 6ca06ca0 l,
   67e06000 l, 30003fe0 l, 0fe00000 l, 00000000 l,
   00000000 l, 00000600 l, 06000b00 l, 0b000900 l,
   11801180 l, 10803fc0 l, 20c02040 l, 40604060 l,
   e0f00000 l, 00000000 l, 00000000 l, 00000000 l,
   ff006080 l, 60c060c0 l, 60c06180 l, 7f8060c0 l,
   60606060 l, 60606060 l, 60c0ff80 l, 00000000 l,
   00000000 l, 00000000 l, 00000fc0 l, 10602020 l,
   20006000 l, 60006000 l, 60006000 l, 60002000 l,
   30201840 l, 0f800000 l, 00000000 l, 00000000 l,
   00000000 l, ff0061c0 l, 60c06060 l, 60606060 l,
   60606060 l, 60606060 l, 60606040 l, 6180fe00 l,
   00000000 l, 00000000 l, 00000000 l, 00007fc0 l,
   30403040 l, 30003000 l, 30803f80 l, 30803000 l,
   30003000 l, 30203020 l, 7fe00000 l, 00000000 l,
   00000000 l, 00000000 l, 7fc03040 l, 30403000 l,
   30003080 l, 3f803080 l, 30003000 l, 30003000 l,
   30007800 l, 00000000 l, 00000000 l, 00000000 l,
   00000fc0 l, 10602020 l, 20006000 l, 60006000 l,
   600061f0 l, 60602060 l, 30601860 l, 0f800000 l,
   00000000 l, 00000000 l, 00000000 l, f0f06060 l,
   60606060 l, 60606060 l, 7fe06060 l, 60606060 l,
   60606060 l, 6060f0f0 l, 00000000 l, 00000000 l,
   00000000 l, 00001f80 l, 06000600 l, 06000600 l,
   06000600 l, 06000600 l, 06000600 l, 06000600 l,
   1f800000 l, 00000000 l, 00000000 l, 00000000 l,
   1f800600 l, 06000600 l, 06000600 l, 06000600 l,
   06000600 l, 06000600 l, 06000600 l, 06000600 l,
   04003800 l, 30000000 l, 0000f0e0 l, 61806300 l,
   66006c00 l, 78007800 l, 7c006e00 l, 67006380 l,
   61c060e0 l, f0700000 l, 00000000 l, 00000000 l,
   00000000 l, 78003000 l, 30003000 l, 30003000 l,
   30003000 l, 30003000 l, 30003020 l, 30207fe0 l,
   00000000 l, 00000000 l, 00000000 l, 0000e070 l,
   60e070e0 l, 70e070e0 l, 59605960 l, 59604d60 l,
   4e604e60 l, 44604460 l, e4f00000 l, 00000000 l,
   00000000 l, 00000000 l, c0706020 l, 70207820 l,
   58204c20 l, 46204720 l, 432041a0 l, 40e040e0 l,
   4060e030 l, 00000000 l, 00000000 l, 00000000 l,
   00000f00 l, 11c020c0 l, 20606060 l, 60606060 l,
   60606060 l, 60602040 l, 30401880 l, 0f000000 l,
   00000000 l, 00000000 l, 00000000 l, 7f8030c0 l,
   30603060 l, 306030c0 l, 37803000 l, 30003000 l,
   30003000 l, 30007800 l, 00000000 l, 00000000 l,
   00000000 l, 00000f00 l, 11c020c0 l, 20606060 l,
   60606060 l, 60606060 l, 60603040 l, 38401f80 l,
   0e001f00 l, 239001e0 l, 00000000 l, 00000000 l,
   ff006180 l, 60c060c0 l, 60c06080 l, 7f007c00 l,
   6e006700 l, 638061c0 l, 60e0f070 l, 00000000 l,
   00000000 l, 00000000 l, 00001fe0 l, 30606020 l,
   60207000 l, 3c001e00 l, 078001c0 l, 00e04060 l,
   406060c0 l, 7f800000 l, 00000000 l, 00000000 l,
   00000000 l, 7fe04620 l, 06000600 l, 06000600 l,
   06000600 l, 06000600 l, 06000600 l, 06001f80 l,
   00000000 l, 00000000 l, 00000000 l, 0000f070 l,
   60206020 l, 60206020 l, 60206020 l, 60206020 l,
   60206020 l, 70403fc0 l, 1f800000 l, 00000000 l,
   00000000 l, 00000000 l, e0e06040 l, 30803080 l,
   30801900 l, 19001900 l, 0a000e00 l, 0e000400 l,
   04000400 l, 00000000 l, 00000000 l, 00000000 l,
   0000fef0 l, 66206620 l, 66207620 l, 77403340 l,
   37403bc0 l, 3b801980 l, 19801980 l, 19800000 l,
   00000000 l, 00000000 l, 00000000 l, f0706020 l,
   30403880 l, 18800d00 l, 06000600 l, 0b001180 l,
   11c020c0 l, 4060e0f0 l, 00000000 l, 00000000 l,
   00000000 l, 0000f070 l, 60203040 l, 18801880 l,
   0d000600 l, 06000600 l, 06000600 l, 06000600 l,
   0f000000 l, 00000000 l, 00000000 l, 00000000 l,
   3fe020c0 l, 00c00180 l, 01800300 l, 03000600 l,
   06000c00 l, 0c001800 l, 18203fe0 l, 00000000 l,
   00000000 l, 00000000 l, 0f800f80 l, 0c000c00 l,
   0c000c00 l, 0c000c00 l, 0c000c00 l, 0c000c00 l,
   0c000f80 l, 0f800000 l, 00000000 l, 00000000 l,
   00006000 l, 30003000 l, 18001800 l, 0c000c00 l,
   06000600 l, 03000300 l, 01800180 l, 00c000c0 l,
   00600000 l, 00000000 l, 00000000 l, 1f001f00 l,
   03000300 l, 03000300 l, 03000300 l, 03000300 l,
   03000300 l, 03001f00 l, 1f000000 l, 00000000 l,
   00000000 l, 00000400 l, 0e001b00 l, 318060c0 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   fff0fff0 l, 00000000 l, 00000100 l, 03000600 l,
   06000780 l, 07800300 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000f80 l,
   18c010c0 l, 03c01cc0 l, 30c030c0 l, 30c039c0 l,
   1ee00000 l, 00000000 l, 00000000 l, 00002000 l,
   6000e000 l, 60006000 l, 67806fc0 l, 70e06060 l,
   60606060 l, 60607060 l, 78c04f80 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00001f80 l, 31c020c0 l, 60006000 l, 60006000 l,
   704030c0 l, 1f800000 l, 00000000 l, 00000000 l,
   00000060 l, 00e00060 l, 00600060 l, 0f6031e0 l,
   20e06060 l, 60606060 l, 606070e0 l, 39601e70 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000f00 l, 30c06060 l, 60607fe0 l,
   60006000 l, 30001860 l, 0f800000 l, 00000000 l,
   00000000 l, 00000380 l, 04c004c0 l, 0c000c00 l,
   0c000c00 l, 3f800c00 l, 0c000c00 l, 0c000c00 l,
   0c001e00 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00001f20 l, 31e060c0 l,
   60c060c0 l, 31803f00 l, 60007fc0 l, 3fe02060 l,
   40204020 l, 7fc03f80 l, 00001000 l, 30007000 l,
   30003000 l, 378039c0 l, 30c030c0 l, 30c030c0 l,
   30c030c0 l, 30c079e0 l, 00000000 l, 00000000 l,
   00000000 l, 00000600 l, 06000000 l, 00001e00 l,
   06000600 l, 06000600 l, 06000600 l, 06000600 l,
   1f800000 l, 00000000 l, 00000000 l, 00000000 l,
   00c000c0 l, 00000000 l, 03c000c0 l, 00c000c0 l,
   00c000c0 l, 00c000c0 l, 00c000c0 l, 20c030c0 l,
   38801f00 l, 0e000000 l, 6000e000 l, 60006000 l,
   600061c0 l, 63006600 l, 7c007800 l, 7c006e00 l,
   67006380 l, f1e00000 l, 00000000 l, 00000000 l,
   00001e00 l, 06000600 l, 06000600 l, 06000600 l,
   06000600 l, 06000600 l, 06000600 l, 06001f80 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 0000ddc0 l, 6ee06660 l, 66606660 l,
   66606660 l, 66606660 l, ef700000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   278079c0 l, 30c030c0 l, 30c030c0 l, 30c030c0 l,
   30c079e0 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000f80 l, 11c020e0 l,
   60606060 l, 60606060 l, 70403880 l, 1f000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, ef8071c0 l, 60e06060 l, 60606060 l,
   60606040 l, 70807f00 l, 60006000 l, 60006000 l,
   f0000000 l, 00000000 l, 00000000 l, 00000f20 l,
   11e020e0 l, 60606060 l, 60606060 l, 706038e0 l,
   1fe00060 l, 00600060 l, 006000f0 l, 00000000 l,
   00000000 l, 00000000 l, 738034c0 l, 38c03000 l,
   30003000 l, 30003000 l, 30007800 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00001fc0 l, 30c03040 l, 38001e00 l, 078001c0 l,
   20c030c0 l, 3f800000 l, 00000000 l, 00000000 l,
   00000000 l, 00000400 l, 04000c00 l, 7fc00c00 l,
   0c000c00 l, 0c000c00 l, 0c000c20 l, 0e400780 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 000079e0 l, 30c030c0 l, 30c030c0 l,
   30c030c0 l, 30c039c0 l, 1e600000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   f0706020 l, 30403040 l, 18801880 l, 0d000d00 l,
   06000600 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 0000ff70 l, 66206620 l,
   66203740 l, 3b403b40 l, 19801980 l, 19800000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, f8f07040 l, 38801d00 l, 0e000700 l,
   0b8011c0 l, 20e0f1f0 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 0000f0f0 l,
   60203040 l, 30401880 l, 18800d00 l, 0d000600 l,
   06000400 l, 0c000800 l, 78007000 l, 00000000 l,
   00000000 l, 00000000 l, 7fe060e0 l, 41c00380 l,
   07000e00 l, 1c003820 l, 70607fe0 l, 00000000 l,
   00000000 l, 00000000 l, 03800600 l, 06000600 l,
   06000600 l, 0c003800 l, 0c000600 l, 06000600 l,
   06000600 l, 03800000 l, 00000000 l, 00000000 l,
   00000600 l, 06000600 l, 06000600 l, 06000600 l,
   06000600 l, 06000600 l, 06000600 l, 06000600 l,
   06000600 l, 06000600 l, 06000000 l, 1c000600 l,
   06000600 l, 06000600 l, 030001c0 l, 03000600 l,
   06000600 l, 06000600 l, 1c000000 l, 00000000 l,
   00000000 l, 00000000 l, 00001c20 l, 3e6067c0 l,
   43800000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 06000600 l, 00000000 l, 06000600 l,
   06000600 l, 06000600 l, 06000600 l, 06000600 l,
   06000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 06000600 l, 1f8036c0 l, 26c06600 l,
   66006600 l, 66007640 l, 36c01f80 l, 06000600 l,
   00000000 l, 00000000 l, 00000f80 l, 1cc018c0 l,
   18001800 l, 18007e00 l, 7e001800 l, 18001800 l,
   18003e20 l, 7fe061c0 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 60602f40 l,
   1f8030c0 l, 30c030c0 l, 30c01f80 l, 2f406060 l,
   00000000 l, 00000000 l, 00000000 l, 00006060 l,
   606030c0 l, 19801980 l, 0f000600 l, 1f800600 l,
   1f800600 l, 06000600 l, 06000000 l, 00000000 l,
   00000000 l, 00000600 l, 06000600 l, 06000600 l,
   06000600 l, 06000600 l, 00000000 l, 06000600 l,
   06000600 l, 06000600 l, 06000600 l, 06000000 l,
   00001f00 l, 31803180 l, 30003000 l, 1f003180 l,
   31801f00 l, 01800180 l, 31803180 l, 1f000000 l,
   00000000 l, 00000000 l, 00000000 l, 00001980 l,
   19800000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00001f80 l,
   20404f20 l, 59a05820 l, 582059a0 l, 4f202040 l,
   1f800000 l, 00000000 l, 00000000 l, 00000000 l,
   1f003180 l, 01800780 l, 19803180 l, 31803380 l,
   1dc00000 l, 3fc00000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 06600cc0 l, 19803300 l, 66003300 l,
   19800cc0 l, 06600000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 3fc03fc0 l, 00c000c0 l,
   00c00000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00007fe0 l,
   7fe00000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   1f802040 l, 5f2059a0 l, 59a05f20 l, 59a059a0 l,
   20401f80 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 1f801f80 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000f00 l, 19801980 l,
   19800f00 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000600 l, 06000600 l,
   06007fe0 l, 7fe00600 l, 06000600 l, 06000000 l,
   7fe07fe0 l, 00000000 l, 00000000 l, 00000f00 l,
   1f803180 l, 21800300 l, 06000c00 l, 18403fc0 l,
   3fc00000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 0f001b80 l, 21800180 l,
   0f000380 l, 01803180 l, 3f801f00 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 03000600 l, 0c000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 000030c0 l, 30c030c0 l, 30c030c0 l,
   30c030c0 l, 30c039c0 l, 36e03000 l, 30006000 l,
   00000000 l, 00000000 l, 1ff03cc0 l, 7cc07cc0 l,
   7cc03cc0 l, 1cc00cc0 l, 0cc00cc0 l, 0cc00cc0 l,
   0cc01ce0 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   06000f00 l, 0f000600 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 06000300 l, 01800f00 l,
   00000000 l, 02000600 l, 0e001600 l, 06000600 l,
   06000600 l, 06001f80 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   07001980 l, 10c030c0 l, 30c030c0 l, 30801980 l,
   0e000000 l, 3fc00000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 66003300 l, 19800cc0 l, 06600cc0 l,
   19803300 l, 66000000 l, 00000000 l, 00000000 l,
   00000000 l, 10003000 l, 10001040 l, 10801100 l,
   3a4004c0 l, 09401240 l, 244047e0 l, 00400040 l,
   00000000 l, 00000000 l, 00000000 l, 00001000 l,
   30001000 l, 10401080 l, 11003a00 l, 05c00a20 l,
   102020c0 l, 41000200 l, 03e00000 l, 00000000 l,
   00000000 l, 00000000 l, 38004400 l, 04001840 l,
   04804500 l, 3a4004c0 l, 09401240 l, 244047e0 l,
   00400040 l, 00000000 l, 00000000 l, 00000000 l,
   03000300 l, 00000000 l, 03000300 l, 06000c00 l,
   18003000 l, 30003040 l, 39c01f80 l, 0f000000 l,
   00000000 l, 00000000 l, 00000c00 l, 06000300 l,
   00000600 l, 06000b00 l, 0b001980 l, 11803fc0 l,
   20c06060 l, 4060e0f0 l, 00000000 l, 00000000 l,
   00000000 l, 03000600 l, 0c000000 l, 06000600 l,
   0b000b00 l, 19801180 l, 3fc020c0 l, 60604060 l,
   e0f00000 l, 00000000 l, 00000000 l, 00000600 l,
   0f001980 l, 00000600 l, 06000b00 l, 0b001980 l,
   11803fc0 l, 20c06060 l, 4060e0f0 l, 00000000 l,
   00000000 l, 00000000 l, 1c403fc0 l, 23800000 l,
   06000600 l, 0b000b00 l, 19801180 l, 3fc020c0 l,
   60604060 l, e0f00000 l, 00000000 l, 00000000 l,
   00001980 l, 19800000 l, 04000600 l, 06000b00 l,
   0b001980 l, 11803fc0 l, 20c06060 l, 4060e0f0 l,
   00000000 l, 00000000 l, 00000000 l, 0f001980 l,
   0f000400 l, 06000600 l, 0b000b00 l, 19801180 l,
   3fc020c0 l, 60604060 l, e0f00000 l, 00000000 l,
   00000000 l, 00000000 l, 03f00710 l, 07100b00 l,
   0b000b20 l, 13e01320 l, 3f002300 l, 23004310 l,
   4310e7f0 l, 00000000 l, 00000000 l, 00000000 l,
   00000fc0 l, 10602020 l, 20006000 l, 60006000 l,
   60006000 l, 60002000 l, 30201840 l, 0f800600 l,
   03000180 l, 0f000000 l, 00000c00 l, 06000100 l,
   7fe03020 l, 30003000 l, 30803f80 l, 30803000 l,
   30003020 l, 30207fe0 l, 00000000 l, 00000000 l,
   00000000 l, 03000600 l, 08007fe0 l, 30203000 l,
   30003080 l, 3f803080 l, 30003000 l, 30203020 l,
   7fe00000 l, 00000000 l, 00000000 l, 00000600 l,
   0f001080 l, 7fe03020 l, 30003000 l, 30803f80 l,
   30803000 l, 30003020 l, 30207fe0 l, 00000000 l,
   00000000 l, 00000000 l, 19801980 l, 00007fe0 l,
   30203000 l, 30003080 l, 3f803080 l, 30003000 l,
   30203020 l, 7fe00000 l, 00000000 l, 00000000 l,
   00001800 l, 0c000200 l, 1f800600 l, 06000600 l,
   06000600 l, 06000600 l, 06000600 l, 06001f80 l,
   00000000 l, 00000000 l, 00000000 l, 01800300 l,
   04001f80 l, 06000600 l, 06000600 l, 06000600 l,
   06000600 l, 06000600 l, 1f800000 l, 00000000 l,
   00000000 l, 00000600 l, 0f001980 l, 00001f80 l,
   06000600 l, 06000600 l, 06000600 l, 06000600 l,
   06001f80 l, 00000000 l, 00000000 l, 00000000 l,
   19801980 l, 00001f80 l, 06000600 l, 06000600 l,
   06000600 l, 06000600 l, 06000600 l, 1f800000 l,
   00000000 l, 00000000 l, 00000000 l, 7f0031c0 l,
   30c03060 l, 30603060 l, fc60fc60 l, 30603060 l,
   30603040 l, 31807e00 l, 00000000 l, 00000000 l,
   00000000 l, 1c403fc0 l, 2380c070 l, 60207020 l,
   78205c20 l, 4e204720 l, 43a041e0 l, 40e04060 l,
   e0300000 l, 00000000 l, 00000000 l, 00000c00 l,
   06000100 l, 0f8011c0 l, 20c02060 l, 60606060 l,
   60606060 l, 20403040 l, 18800f00 l, 00000000 l,
   00000000 l, 00000000 l, 01800300 l, 04000f80 l,
   11c020c0 l, 20606060 l, 60606060 l, 60602040 l,
   30401880 l, 0f000000 l, 00000000 l, 00000000 l,
   00000600 l, 09001080 l, 0f0011c0 l, 20c02060 l,
   60606060 l, 60606060 l, 20403040 l, 18800f00 l,
   00000000 l, 00000000 l, 00000000 l, 1c603fc0 l,
   22800f80 l, 11c020c0 l, 20606060 l, 60606060 l,
   60602040 l, 30401880 l, 0f000000 l, 00000000 l,
   00000000 l, 00001980 l, 19800000 l, 0f8011c0 l,
   20c02060 l, 60606060 l, 60606060 l, 20403040 l,
   18800f00 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 606030c0 l,
   19800f00 l, 06000f00 l, 198030c0 l, 60600000 l,
   00000000 l, 00000000 l, 00000000 l, 00800f80 l,
   11c021c0 l, 22606260 l, 62606460 l, 64606460 l,
   28403840 l, 18801f00 l, 10000000 l, 00000000 l,
   00000000 l, 0c000600 l, e3306020 l, 60206020 l,
   60206020 l, 60206020 l, 60206020 l, 70403fc0 l,
   1f800000 l, 00000000 l, 00000000 l, 00000180 l,
   0300e630 l, 60206020 l, 60206020 l, 60206020 l,
   60206020 l, 60207040 l, 3fc01f80 l, 00000000 l,
   00000000 l, 00000000 l, 06000f00 l, f9b06020 l,
   60206020 l, 60206020 l, 60206020 l, 60206020 l,
   70403fc0 l, 1f800000 l, 00000000 l, 00000000 l,
   00001980 l, 1980e030 l, 60206020 l, 60206020 l,
   60206020 l, 60206020 l, 60207040 l, 3fc01f80 l,
   00000000 l, 00000000 l, 00000000 l, 01800300 l,
   e6706020 l, 30401880 l, 0d000600 l, 06000600 l,
   06000600 l, 06000600 l, 0f000000 l, 00000000 l,
   00000000 l, 00007800 l, 30003f80 l, 30c03060 l,
   30603060 l, 30c03f80 l, 30003000 l, 30003000 l,
   30007800 l, 00000000 l, 00000000 l, 00000000 l,
   00000f00 l, 198030c0 l, 30c030c0 l, 31803780 l,
   318030c0 l, 30c030c0 l, 30c03180 l, 77000000 l,
   00000000 l, 00000000 l, 00000000 l, 0c000600 l,
   03000000 l, 0f8018c0 l, 10c003c0 l, 1cc030c0 l,
   30c030c0 l, 39c01ee0 l, 00000000 l, 00000000 l,
   00000000 l, 00000180 l, 03000600 l, 00000f80 l,
   18c010c0 l, 03c01cc0 l, 30c030c0 l, 30c039c0 l,
   1ee00000 l, 00000000 l, 00000000 l, 00000200 l,
   07000d80 l, 18c00000 l, 0f8018c0 l, 10c003c0 l,
   1cc030c0 l, 30c030c0 l, 39c01ee0 l, 00000000 l,
   00000000 l, 00000000 l, 0e401fc0 l, 13800000 l,
   00000f80 l, 18c010c0 l, 03c01cc0 l, 30c030c0 l,
   30c039c0 l, 1ee00000 l, 00000000 l, 00000000 l,
   00000000 l, 19801980 l, 00000000 l, 0f8018c0 l,
   10c003c0 l, 1cc030c0 l, 30c030c0 l, 39c01ee0 l,
   00000000 l, 00000000 l, 00000000 l, 07000d80 l,
   0d800700 l, 00000f80 l, 18c010c0 l, 03c01cc0 l,
   30c030c0 l, 30c039c0 l, 1ee00000 l, 00000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   3de06630 l, 46300630 l, 3ff06600 l, c600c600 l,
   e7307de0 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00001f80 l, 31c020c0 l,
   60006000 l, 60006000 l, 704030c0 l, 1f800600 l,
   03000180 l, 0f000000 l, 00000000 l, 0c000600 l,
   03000000 l, 0f0030c0 l, 60606060 l, 7fe06000 l,
   60003000 l, 18600f80 l, 00000000 l, 00000000 l,
   00000000 l, 00000180 l, 03000600 l, 00000f00 l,
   30c06060 l, 60607fe0 l, 60006000 l, 30001860 l,
   0f800000 l, 00000000 l, 00000000 l, 00000200 l,
   07000d80 l, 18c00000 l, 0f0030c0 l, 60606060 l,
   7fe06000 l, 60003000 l, 18600f80 l, 00000000 l,
   00000000 l, 00000000 l, 00001980 l, 19800000 l,
   00000f00 l, 30c06060 l, 60607fe0 l, 60006000 l,
   30001860 l, 0f800000 l, 00000000 l, 00000000 l,
   00000000 l, 18000c00 l, 06000000 l, 1e000600 l,
   06000600 l, 06000600 l, 06000600 l, 06001f80 l,
   00000000 l, 00000000 l, 00000000 l, 00000180 l,
   03000600 l, 00001e00 l, 06000600 l, 06000600 l,
   06000600 l, 06000600 l, 1f800000 l, 00000000 l,
   00000000 l, 00000400 l, 0e001b00 l, 31800000 l,
   1e000600 l, 06000600 l, 06000600 l, 06000600 l,
   06001f80 l, 00000000 l, 00000000 l, 00000000 l,
   00001980 l, 19800000 l, 00001e00 l, 06000600 l,
   06000600 l, 06000600 l, 06000600 l, 1f800000 l,
   00000000 l, 00000000 l, 00001c00 l, 06c00300 l,
   0d8000c0 l, 00c00060 l, 0f6018e0 l, 30603060 l,
   30603060 l, 18c00f00 l, 00000000 l, 00000000 l,
   00000000 l, 1c403fc0 l, 23800000 l, 00002780 l,
   79c030c0 l, 30c030c0 l, 30c030c0 l, 30c030c0 l,
   79e00000 l, 00000000 l, 00000000 l, 00000000 l,
   0c000600 l, 03000000 l, 0f8011c0 l, 20e06060 l,
   60606060 l, 60607040 l, 38801f00 l, 00000000 l,
   00000000 l, 00000000 l, 00000180 l, 03000600 l,
   00000f80 l, 11c020e0 l, 60606060 l, 60606060 l,
   70403880 l, 1f000000 l, 00000000 l, 00000000 l,
   00000200 l, 07000d80 l, 18c00000 l, 0f8011c0 l,
   20e06060 l, 60606060 l, 60607040 l, 38801f00 l,
   00000000 l, 00000000 l, 00000000 l, 1c403fc0 l,
   23800000 l, 00000f80 l, 11c020e0 l, 60606060 l,
   60606060 l, 70403880 l, 1f000000 l, 00000000 l,
   00000000 l, 00000000 l, 19801980 l, 00000000 l,
   0f8011c0 l, 20e06060 l, 60606060 l, 60607040 l,
   38801f00 l, 00000000 l, 00000000 l, 00000000 l,
   00000000 l, 00000000 l, 00000600 l, 06000000 l,
   00007fe0 l, 7fe00000 l, 00000600 l, 06000000 l,
   00000000 l, 00000000 l, 00000000 l, 00000000 l,
   00000010 l, 0fa011c0 l, 20e06160 l, 62606460 l,
   68607040 l, 38805f00 l, 80000000 l, 00000000 l,
   00000000 l, 00001800 l, 0c000600 l, 000079e0 l,
   30c030c0 l, 30c030c0 l, 30c030c0 l, 30c039c0 l,
   1e600000 l, 00000000 l, 00000000 l, 00000000 l,
   01800300 l, 06000000 l, 79e030c0 l, 30c030c0 l,
   30c030c0 l, 30c030c0 l, 39c01e60 l, 00000000 l,
   00000000 l, 00000000 l, 02000700 l, 0d8018c0 l,
   000079e0 l, 30c030c0 l, 30c030c0 l, 30c030c0 l,
   30c039c0 l, 1e600000 l, 00000000 l, 00000000 l,
   00000000 l, 19801980 l, 00000000 l, 79e030c0 l,
   30c030c0 l, 30c030c0 l, 30c030c0 l, 39c01e60 l,
   00000000 l, 00000000 l, 00000000 l, 00000180 l,
   03000600 l, 0000f0f0 l, 60203040 l, 30401880 l,
   18800d00 l, 0d000600 l, 06000400 l, 0c000800 l,
   78007000 l, 00000000 l, 00000000 l, 00000000 l,
   78003000 l, 30003f80 l, 30c03060 l, 306030c0 l,
   3f803000 l, 30003000 l, 30003000 l, 78000000 l,
   00001980 l, 19800000 l, 0000f0f0 l, 60203040 l,
   30401880 l, 18800d00 l, 0d000600 l, 06000400 l,
   0c000800 l, 78007000 l, 00000000 l, 00000000 l,
end-code
headers

' gallant-romfont is romfont
