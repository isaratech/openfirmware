\ Also from FinalSetting.c

\ Subsystem IDs
0833152d 002c config-wl
0833152d 012c config-wl
0833152d 022c config-wl
0833152d 032c config-wl
0833152d 042c config-wl
0833152d 052c config-wl
0833152d 062c config-wl
0833152d 072c config-wl

\ Cache line size (low byte) / latency timer (high byte) registers
2008 000c config-ww 
0008 010c config-ww 
0008 020c config-ww
0008 040c config-ww
0008 050c config-ww 
0008 060c config-ww 
0008 070c config-ww 
2000 080c config-ww
2000 780c config-ww
2008 800c config-ww
2008 810c config-ww
2008 820c config-ww
2008 830c config-ww
2010 840c config-ww
0800 8f0c config-ww
0008 a00c config-ww

   0 4 devfunc  \ PM_table
   a0 80 80 mreg \ Enable dynamic power management (coreboot for vx800 uses f0; 70 bits are reserved on vx855)
   a1 e0 e0 mreg \ Dynamic power management for DRAM
   a2 d6 d6 mreg \ Dynamic clock stop controls (coreboot for vx8000 uses ff fe; 29 bits are reserved on vx800)
   a3 80 80 mreg \ Toggle reduction on
   a5 81 81 mreg \ "Reserved"
   end-table

\ cache_as_ram_auto.c : enable_shadow_ram

   0 3 devfunc
\ Initial DOS hole settings, so the firmware can set things up
   80 ff ff mreg \ Enable R/W memory access to Cxxxx bank
   81 ff ff mreg \ Enable R/W memory access to Dxxxx bank
   82 ff ff mreg \ Enable R/W memory access to Exxxx bank
   83 30 30 mreg \ Enable R/W memory access to Fxxxx bank (30), no memory hole (0c), SMM switching of Axxxx bank (03)

\ Final DOS hole settings, after stuff has been copied in, for reference
\  80 ff 2a mreg \ CC000-CFFFF off, C0000-C7FFF RO
\  81 ff 00 mreg \ D0000-DFFFF off
\  82 ff aa mreg \ E0000-EFFFF RO
\  83 ff 20 mreg \ Enable R/W memory access to Fxxxx bank (20), no memory hole (0c), SMM switching of Axxxx bank (03)
   end-table

   0 3 devfunc
[ifdef] use-apic
   86 38 38 mreg  \ SMM and APIC Decoding: enable APIC lowest int arb, IOAPIC split decode, MSI (SMM later)
[then]
   end-table

   \ Additional Power Management Setup not in coreboot
   0 2 devfunc
   76 08 08 mreg  \ AGTL Power down buffers in S3
\   92 ff 00 mreg  \ ACPI IO Base address
\   93 ff 04 mreg  \ ACPI IO Base address
   end-table

   0 4 devfunc
   84 ff db mreg  \ Dynamic clocks
   85 ff 05 mreg  \ Dynamic clocks
   89 ff f8 mreg  \ Dynamic clocks
   8b ff bf mreg  \ Dynamic clocks
   8d ff 30 mreg  \ Self-refresh in C3 and C4
   \ LuckeLin at Via says: If D0F4 Rx8e[5] was set to 0, we could turn-off PLL in S1 state.
   \ If your machine does not support S1, it was fine to set it to 1 at all time.
   \ (wmb adds - D0F4 Rx8e[5] needs to be set to 1 before entering S3, even if set to 0 for S1)
   \ LuckeLin also says: [Phoenix] Set(s) Rx8e[4] to 1 to fix another S3 issue. Chip internal control
   \ signal was hard-wired to 1 in new chip. It does not control anything. Please just keep it to be default setting.
   8e ff 20 mreg  \ Leave PLL on in suspend state - necessary for reliable S3
   90 ff ff mreg  \ Gate clocks
   91 ff ff mreg  \ Gate clocks
   92 cc cc mreg  \ Dynamic buffer control, power down comparators
   95 ff 01 mreg  \ Reserved - Phoenix value
   a5 ff 00 mreg  \ Reserved - Phoenix value
   a8 20 20 mreg  \ Central traffic controller dynamic clock stop
   d1 ff 01 mreg  \ BIOS scratch - Phoenix value
   d2 ff 02 mreg  \ BIOS scratch - Phoenix value
   d3 ff 03 mreg  \ BIOS scratch - Phoenix value
   d4 ff 10 mreg  \ BIOS scratch - Phoenix value
   d8 ff 10 mreg  \ BIOS scratch - Phoenix value
   e4 ff 2a mreg  \ BIOS scratch - Phoenix value
   e8 ff 10 mreg  \ BIOS scratch - Phoenix value
   e9 ff fa mreg  \ BIOS scratch - Phoenix value
   eb ff 01 mreg  \ BIOS scratch - Phoenix value
   f6 ff 01 mreg  \ Reserved - Phoenix value
   end-table
    
   \ Bus tuning
   0 5 devfunc
   54 8f 80 mreg  \ SM request gets high priority, PCCA occupancy timer off
   55 0f 04 mreg  \ PCCA P2C Promote Timer value 4
   59 0f 02 mreg  \ IGFX Promote Timer value 2
   5f 0f 06 mreg  \ IPI Promote Timer value 6
   64 20 00 mreg  \ Upstream MSI doesn't flush queued P2C Write Data
   72 ff 09 mreg  \ Reserved - Phoenix value
   80 0b 08 mreg  \ Upstream Request 1T earlier
   81 ff 9a mreg  \ Reserved - Phoenix value
   83 ff 81 mreg  \ P2PW down arb timer timer 8, P2PR down arb timer timer 1
   84 7f 28 mreg  \ Downstream arbitration Timeout timer for C2P
   85 c0 c0 mreg  \ Abort P2P cycle to PCI1, CPU to PCI1 cycle blocks next C2P cycle
   a3 01 00 mreg  \ Via suggests 0 here
   end-table

   0 7 devfunc
   76 ff d0 mreg  \ Via says this should be the same value as D17F7 Rx76
   e5 ff 40 mreg  \ Reserved - Phoenix value
   e6 ff 29 mreg  \ Reserved - Phoenix value
   end-table

0 [if]
   d# 11 0 devfunc  \ USB device
   41 18 18 mreg  \ Enable backdoor
   62 ff 2d mreg  \ Subsystem ID backdoor
   63 ff 15 mreg  \ Subsystem ID backdoor
   60 ff 33 mreg  \ Subsystem ID backdoor
   61 ff 08 mreg  \ Subsystem ID backdoor
   41 08 08 mreg  \ Disable backdoor, enable use of backdoored Subsystem ID
   end-table
[then]

   d# 12 0 devfunc  \ SDIO tuning
   04 10 10 mreg  \ Enable Memory Write and Invalidate
   44 01 01 mreg  \ Enable backdoor
   2c ff 2d mreg  \ Subsystem ID backdoor
   2d ff 15 mreg  \ Subsystem ID backdoor
   2e ff 33 mreg  \ Subsystem ID backdoor
   2f ff 08 mreg  \ Subsystem ID backdoor
   44 01 00 mreg  \ Disable backdoor
\   8b 05 01 mreg  \ Do not report 1.8V support
   8c c3 03 mreg  \ Falling edge trigger for Slots 1 and 2 data in high speed
   8e ff 7e mreg  \ Delay host clock for Slots 1, 2, 3 by 4.8 nS
   8f 09 01 mreg  \ Falling edge trigger on slot 3 output clock under high speed
[ifdef] demo-board
   99 ff f9 mreg  \ Two slots
[then]
[ifdef] xo-board
\  98 ff 20 mreg  \ Set Reserved bit - Phoenix value - No, SD fails to start the clock if this bit is set
   99 ff fa mreg  \ Three slots
[then]
   end-table

0 [if]
   d# 13 0 devfunc  \ Card reader
   fc 0c 0c mreg  \ Enable backdoor
   2c ff 2d mreg  \ Subsystem ID backdoor
   2d ff 15 mreg  \ Subsystem ID backdoor
   2e ff 33 mreg  \ Subsystem ID backdoor
   2f ff 08 mreg  \ Subsystem ID backdoor
   fc 0c 00 mreg  \ Disable backdoor
   end-table
[then]

0 [if]
   d# 15 0 devfunc  \ EIDE tuning
   09 05 05 mreg  \ Set EIDE to native mode so prober will see config reg 3d set
   40 02 02 mreg  \ Enable primary channel
   4a ff 5e mreg  \ Drive1 timing
   4b ff 20 mreg  \ Drive0 timing
   4c f0 60 mreg  \ Address setup time
   52 df 0e mreg  \ Ultra dma wait strobe timing
\   53 df c6 mreg  \ Ultra DMA mode control
   53 df 06 mreg  \ Ultra DMA mode control
   c4 1d 18 mreg  \ Config 1
\  d4 ac 24 mreg  \ Config 3
   d4 bc 34 mreg  \ Config 3 - 10 res be like Phx
   bc ff 2d mreg  \ Subsystem ID backdoor
   bd ff 15 mreg  \ Subsystem ID backdoor
   be ff 33 mreg  \ Subsystem ID backdoor
   bf ff 08 mreg  \ Subsystem ID backdoor
   end-table
[then]

   \ USB Tuning
   d# 16 0 devfunc  \ UHCI Ports 0,1
   04 10 10 mreg  \ Enable Memory Write and Invalidate
   42 10 10 mreg  \ Enable backdoor
   2c ff 2d mreg  \ Subsystem ID backdoor
   2d ff 15 mreg  \ Subsystem ID backdoor
   2e ff 33 mreg  \ Subsystem ID backdoor
   2f ff 08 mreg  \ Subsystem ID backdoor
   42 10 00 mreg  \ Disable backdoor
   4a 02 02 mreg  \ Enable Stop Bus Master Cycle if HALT Bit is Asserted
   4b 60 60 mreg  \ Enable New UHCI Dynamic Scheme - 66MHz (40) & 33MHz (20)
   c1 20 00 mreg  \ Disable USB PIRQ
   end-table

   d# 16 1 devfunc  \ UHCI Ports 2,3
   04 10 10 mreg  \ Enable Memory Write and Invalidate
   42 10 10 mreg  \ Enable backdoor
   2c ff 2d mreg  \ Subsystem ID backdoor
   2d ff 15 mreg  \ Subsystem ID backdoor
   2e ff 33 mreg  \ Subsystem ID backdoor
   2f ff 08 mreg  \ Subsystem ID backdoor
   42 10 00 mreg  \ Disable backdoor
   4a 02 02 mreg  \ Enable Stop Bus Master Cycle if HALT Bit is Asserted
   4b 60 60 mreg  \ Enable New UHCI Dynamic Scheme - 66MHz (40) & 33MHz (20)
   c1 20 00 mreg  \ Disable USB PIRQ
   end-table

[ifndef] xo-board
   d# 16 2 devfunc  \ UHCI Ports 4,5
   04 10 10 mreg  \ Enable Memory Write and Invalidate
   42 10 10 mreg  \ Enable backdoor
   2c ff 2d mreg  \ Subsystem ID backdoor
   2d ff 15 mreg  \ Subsystem ID backdoor
   2e ff 33 mreg  \ Subsystem ID backdoor
   2f ff 08 mreg  \ Subsystem ID backdoor
   42 10 00 mreg  \ Disable backdoor
   4a 02 02 mreg  \ Enable Stop Bus Master Cycle if HALT Bit is Asserted
   4b 60 60 mreg  \ Enable New UHCI Dynamic Scheme - 66MHz (40) & 33MHz (20)
   c1 20 00 mreg  \ Disable USB PIRQ
   end-table
[then]

   
   d# 16 4 devfunc  \ EHCI
   04 10 10 mreg  \ Enable Memory Write and Invalidate
   42 10 10 mreg  \ Enable backdoor
   2c ff 2d mreg  \ Subsystem ID backdoor
   2d ff 15 mreg  \ Subsystem ID backdoor
   2e ff 33 mreg  \ Subsystem ID backdoor
   2f ff 08 mreg  \ Subsystem ID backdoor
   42 10 00 mreg  \ Disable backdoor
   41 20 20 mreg  \ Evaluate PERIODIC Enable bit only at beginning of micro-frame 0 (undocumented)
   42 40 40 mreg  \ Enable Check PRESOF of ITDOUT Transaction during Fetching Data from DRAM
   43 c0 c0 mreg  \ Enable Dynamic Clock Scheme - 66MHz (80) & 33MHz (40)
   48 20 00 mreg  \ Disable DMA bursts
   4b 60 60 mreg  \ EHCI sleep timeout to match Via settings
\   4b 60 00 mreg  \ Via setting of 60 doesn't work with USB LAN device
   4c 03 03 mreg  \ Squelch detector fine tune - 01 is 112.5 mV
   4d 10 10 mreg  \ 10 res be like Phx
   4e 03 03 mreg  \ reserved bit - setting is appropriate for vx800 03 res be like Phx
   4f 10 10 mreg  \ Enable Clear RUN Bit when EHCI_IDLE
   50 80 80 mreg  \ Fetch one more QH before de-asserting Doorbell
   52 ff 11 mreg  \ be like Phx
   53 ff bf mreg  \ Via settings, different from old Phx
   55 ff ff mreg  \ Disconnect level fine tune - 575 mV for ports 0-3
   56 0f 0f mreg  \ Disconnect level fine tune - 575 mV for ports 4-5
   5a ff cc mreg  \ HS termination resistor fine tune - 45 ohm, 48 ohm for ports 0,1
   5b ff cc mreg  \ HS termination resistor fine tune - 45 ohm, 48 ohm for ports 2,3
   5c 0f 00 mreg  \ DPLL Track Speed 2, DPLL Lock Speed 2
   5d ff cc mreg  \ HS termination resistor fine tune - 45 ohm, 48 ohm for ports 4,5
   64 07 03 mreg  \ High bit of NULL-SOF valid time (04=00), HS ISO actitivy (02) and USB 1.1 ISO activity (01) inhibit C4 
   end-table

[ifdef] xo-board
   \ On a boot we turn off USB power to ensure that USB devices are reset
   \ properly after a reboot.  A "stand-init" routine in via/usb.fth turns
   \ it back on, after the implicit delay of uncompressing OFW and other
   \ startup activities.  We must do this before selecting GPO10 below, else
   \ the enable will start to float high before we can turn it off.
   acpi-io-base h# 4c + port-rl  h# 400 bitclr  ax dx out  \ Turn off USB power
[then]

   d# 17 0 devfunc  \ Bus control and power management
   04 43 43 mreg  \ Check parity, enable I/O and memory access
   40 44 44 mreg  \ Enable I/O Recovery time (40), Enable ports 4d0/4d1 for edge/level setting (04)
[ifdef] xo-board
   41 40 40 mreg  \ Enable fff0.0000-fff7.ffff ROM on LPC bus
[then]
   42 fc f0 mreg  \ Various setting related to DMA line  buffers
   43 0f 0b mreg  \ Enable PCI delayed transactions (08), Write transaction timer (02), Read transaction timer (01)
\  4d 01 01 mreg  \ Enable LPC TPM
   4e 08 08 mreg  \ Enable ports 74/75 for CMOS RAM access

[ifdef] demo-board
   50 40 40 mreg  \ Disable USB device mode
[then]
[ifdef] xo-board
\  50 4c 4c mreg  \ Disable USB device mode, unused USB 1.1 ports 4,5, and EIDE device
\  50 cc 88 mreg  \ Disable EIDE device (set rsvd 80 bit to Phoenix value) (USB device mode enabled)
   50 cc c8 mreg  \ Disable USB device mode and EIDE device (set rsvd 80 bit to Phoenix value)
   51 9f 88 mreg  \ Enable SDIO and internal RTC, disable card reader, int mouse & kbd
[then]

   52 1b 19 mreg  \ No wait state between SIRQ transactions (10), Enable SIRQ (08), SIRQ frame is 6 clocks (3>1)
.( Check PC/PCI DMA necessity) cr
   53 80 80 mreg  \ Enable PC/PCI DMA
.( Check interrupt routing) cr
   55 ff a0 mreg  \ INTA and External General interrupt routing - INTA:IRQ10
   56 ff b9 mreg  \ INTB,C routing - INTC:IRQ11, INTB:IRQ9
[ifdef] demo-board
   57 f0 a0 mreg  \ INTD routing - INTD:IRQ10
[then]
[ifdef] xo-board
   57 f0 a0 mreg  \ INTD routing - INTD:IRQ10 (leave IRQ12 for PS2 mouse)
[then]
.( Check RTC century byte mapping to cmos 32 - see d17f0 rx58) cr
[ifdef] use-apic
   58 40 40 mreg  \ Enable Internal IO-APIC
[then]
[ifdef] xo-board
   59 ff 1c mreg  \ Keyboard (ports 60,64) and ports 62,66 on LPC bus (EC)
   5c ff 68 mreg  \ High byte (68) of PCS0
   5d ff 00 mreg  \ High byte (00) of PCS0
   64 0f 07 mreg  \ PCS0 size is 8 bytes - to include 68 and 6c
   66 01 01 mreg  \ PCS0 Enable
   67 10 10 mreg  \ PCS0 to LPC Bus
[then]
[ifdef] use-apic
\  5b 10 10 mreg  \ Enable APIC Clock Gating
   5b 53 53 mreg  \ Enable APIC Clock Gating - 43 res be like Phx
[then]
   68 80 80 mreg  \ Enable HPETs

hpet-mmio-base lbsplit swap 2swap swap  drop  ( bits31:24 bits23:16 bits15:8 )
   69 ff rot mreg  \ HPET base low
   6a ff rot mreg  \ HPET base mid
   6b ff rot mreg  \ HPET base high

   6e ff 18 mreg  \ COMB not pos decoded but otherwise set to 2f8, COMA pos decoded at 3f8
   70 ff 2d mreg  \ Subsystem ID backdoor
   71 ff 15 mreg  \ Subsystem ID backdoor
   72 ff 33 mreg  \ Subsystem ID backdoor
   73 ff 08 mreg  \ Subsystem ID backdoor
[ifdef] demo-board   \ No need to debounce on XO as the signal comes from the EC
   80 20 20 mreg  \ Debounce power button
[then]
   81 08 08 mreg  \ 32-bit ACPI timer
\  81 08 00 mreg  \ 24-bit ACPI timer - why?
   82 0f 0a mreg  \ Direct SCI to IRQ 10 (0xa)
   84 ff da mreg  \ IRQs 7,6,4,3,1 are primary wakeups
   85 ff 40 mreg  \ IRQ 14 is primary wakeup
\  8a 9f 1f mreg  \ C-state auto switching with normal latencies
   8a 9f 9f mreg  \ C-state auto switching with slow C4 recovery mode - for C4 support
[ifdef] demo-board
   8d 18 18 mreg  \ fast clock as throttle timer tick, hold SMI# low until event status cleared (FIXME for OLPC)
[then]
[ifdef] xo-board
   8d 18 18 mreg  \ fast clock as throttle timer tick, hold SMI# low until event status cleared
[then]
   
   94 ff 68 mreg  \ be like Phx - importantly, clear the 80 bit so the SMBus clock comes from the 14 MHz divider
   95 ff cd mreg  \ 0x0c enables GPIO0,1 (per datasheet; programmer's manual is vague)
[ifdef] demo-board
   97 ff 80 mreg  \ be like Phx 
[then]

[ifdef] xo-board
   97 ff 80 mreg   \ Wait for power to go down before coming back up - needed for power-off
\ NO! This doesn't work.  If these lines are set as GPIOs, the system
\ will crash when you disable the internal KBC.
\   97 ff 81 mreg  \ GPIO4/5 not KBDT/KBCK
[then]

[ifdef] xo-board
   9b fe 88 mreg  \ 80 undoc but is LVDS power.  00 forces LVDS power off, 80 lets 3d5.D2[7,6,3] control it; 1 selects GPO11/12 instead of CR_PWSEL/CR_PWOFF (DCONLOAD)
   9f ff 08 mreg  \ Slot 3 is SDIO, no pullup on KB/MS, fastest SD
[then]
[ifdef] demo-board
   9b ff 88 mreg  \ 80 undoc but is LVDS power.  0 forces LVDS power off, 1 lets 3d5.D2[7,6,3] control it
   9f ff ad mreg  \ be like Phx (slot 3 is Card Reader not SDIO)
[then]

   b0 08 00 mreg  \ The BIOS Porting Note says to clear this bit.  Phoenix and coreboot agree.
   b4 80 00 mreg  \ No positive decoding for UART1 ???
\  b7 40 40 mreg  \ 40 res be like Phx (Phoenix now uses 00)
uart-dma-io-base wbsplit swap  ( bits15:8 bits7:0 )
   b8 fc rot mreg  \ UART DMA Control Registers Base low (port is 4080)
   b9 ff rot mreg  \ UART DMA Control Registers Base high
   ba 77 44 mreg  \ COM1 DMA Channel Selects - DMA0 for both Transmit and Receive

spi-mmio-base lbsplit swap 2swap swap  drop  ( bits31:24 bits23:16 bits15:8 )
   bc ff rot mreg  \ SPI MMIO Base Address 15:8  (address is fed30000)
   bd ff rot mreg  \ SPI MMIO Base Address 23:16
   be ff rot mreg  \ SPI MMIO Base Address 31:24

smbus-io-base wbsplit swap  ( bits15:8 bits7:0 )
   d0 f0 rot mreg  \ SMBUS IO Base Address low (port is 0500)
   d1 ff rot mreg  \ SMBUS IO Base Address high
   d2 0f 05 mreg  \ Enable SMBUS and set divider
\  e2 80 80 mreg  \ Inhibit C4 during USB isochronous transaction
   e2 ff e9 mreg  \ Inhibit C4 during USB isochronous transaction, other bits reserved - Phoenix value
[ifdef] demo-board
   e4 ff a0 mreg  \ Enable short C3/C4 (80), select various multi-function pins
[then]
[ifdef] xo-board
   e3 04 04 mreg  \ Select GPIO8 (DCONBLNK) instead of SSPICLK
   e4 ff c8 mreg  \ Enable short C3/C4 (80), select GPO10 (40) (USB_PWR_EN), GPI10/11 (08)
[then]
   e5 60 60 mreg  \ Enable NM bus master as source of bus master status, enable NB int to wakeup from Cx
   e6 20 20 mreg  \ Enable USB Device Mode Bus Master as Break Event
[ifdef] use-apic
   e7 80 80 mreg  \ Enable APIC Cycle Reflect to ALL Bus Master Activity Effective Signal
[then]
[ifdef] xo-board
   ec 04 00 mreg  \ C3 state setting
[then]
   fc 06 04 mreg  \ DPSLP# to SLP# Latency Adjustment - 22.5 us
   end-table

   d# 17 7 devfunc  \ South-North Module Interface Control
   4e ff 80 mreg  \ Reserved - Phoenix value
   50 df 08 mreg  \ SM priorities - HDAC high priority, others low
   51 80 80 mreg  \ Enable subtractive decode for P2P cycle
   54 7b 02 mreg  \ CCA REQ timing - synchronize USB REQ but not others
0 [if]
   61 ff 2a mreg  \ Page C ROM shadow - C0000-CBFFF RO, CC000-CFFFF off
   62 ff 00 mreg  \ Page D ROM shadow - D0000-DFFFF off
\   63 f3 a0 mreg  \ Page E/F ROM shadow - E0000-EFFFF RO, F0000-FFFFF RO, no memory hole
\   64 ff aa mreg  \ Page E ROM shadow - E0000-EFFFF RW
[then]
   63 fc f0 mreg  \ Page E/F ROM shadow - E0000-EFFFF RW, F0000-FFFFF RW, no memory hole
   64 ff ff mreg  \ Page E ROM shadow - E0000-EFFFF RW
   70 fb 82 mreg  \ CPU to PCI flow control - CPU to PCI posted write, Enable Delay Transaction
   72 af ee mreg  \ Read caching and prefix - various knobs (40 bit is reserved)
   73 79 01 mreg  \ Enable PCI broken master timer & various knobs
\  74 d8 08 mreg  \ Lock Cycle Issued by CPU Blocks P2C Cycles (04 bit is reserved)
   74 dc 0c mreg  \ Lock Cycle Issued by CPU Blocks P2C Cycles - 04 res be like Phx
   75 ff 0f mreg  \ Use New grant mechanism for PCI arbitration, PCI Master Bus Timeout is 7x16 PCI clock
   76 fd d0 mreg  \ Enable PCI parking, Grant to CPU after 2 PC master grants, support IO address 22 for C3
   77 58 48 mreg  \ PCI1 FIFO empty blocks CPU to PCI read, Read FIFO times out after 1 ms
   80 07 07 mreg  \ PCI1 and HDAC upstream read does not pass write, APCI blocks upstream write
\  82 3e 20 mreg  \ Monitor CCA and SDIO2
   82 3f 21 mreg  \ Monitor CCA and SDIO2 - 01 res be like Phx
   88 ff 02 mreg  \ Reserved - Phoenix value
\  e0 e0 80 mreg  \ Dynamic CCA clock
   e0 f3 93 mreg  \ Dynamic CCA clock - 13 res be like Phx
   e1 ff 08 mreg  \ Reserved - Phoenix value
\  e2 1e 00 mreg  \ Use dynamic clocks for Downstream Interface, PCI1, Downstream HDAC, Downstream SM Internal PCI device
   e2 1f 00 mreg  \ Use dynamic clocks for Downstream Interface, PCI1, Downstream HDAC, Downstream SM Internal PCI device 01 res be like Phx
   e3 ff 5e mreg  \ PCI1 dynamic clock, PCI clock on when GRANT# asserted, Enable P2CR data timeout at 7*8 PCI clocks
\  e6 1f 1f mreg  \ Split APIC decoding, Snoop FEEx.xxxx, Enable top SMM, High SMM, Compat SMM (20 bit is reserved)
   e6 3f 39 mreg  \ Split APIC decoding, Snoop FEEx.xxxx, Enable top SMM, High SMM, Compat SMM (20 bit is reserved)
\  fc 40 40 mreg  \ Enable CCA Read Clock When MTXCTL state machine is not idle
   fc 48 48 mreg  \ Enable CCA Read Clock When MTXCTL state machine is not idle - 08 res be like Phx
   end-table

   d# 19 0 devfunc  \ P2P Bridge
   04 ff 07 mreg    \ Mem, IO, Bus Master Enable
   05 ff 01 mreg    \ SERR# enable
   19 ff 01 mreg    \ Secondary bus number
   1a ff 01 mreg    \ Subordinate bus number
   3e ff 04 mreg    \ ISA Enable
   end-table

   d# 20 0 devfunc
   41 01 01 mreg  \ Dynamic clock for HDAC
   40 01 01 mreg  \ Enable backdoor
   2c ff 2d mreg  \ Subsystem ID backdoor
   2d ff 15 mreg  \ Subsystem ID backdoor
   2e ff 33 mreg  \ Subsystem ID backdoor
   2f ff 08 mreg  \ Subsystem ID backdoor
   40 01 00 mreg  \ Disable backdoor
   end-table

[ifdef] use-apic
   \ APIC setup
   0 2 devfunc
   59 01 01 mreg  \ MSI Flat model support
   5c 10 10 mreg  \ Data bit 11 mask for MSI
   97 01 01 mreg  \ Redirect lowest priority MSI requests to APIC 00
   end-table
[then]

\   0 3 devfunc
\   86 38 38 mreg  \ SMM and APIC Decoding: enable APIC lowest int arb, IOAPIC split decode, MSI (SMM later)
\   end-table

   \ Low 2 bits of 86:
   \ x1 to write to SMM shadow memory behind VGA
   \ 00 to run - Axxxxx hits VGA in normal mode, hits shadow DRAM in SMM
   \ 01 to access VGA when in SMM (data cycles only)

\ acpi-io-base h# 26 + port-rb  h#  07 bitset  al dx out  \ Settings to support C4 state
acpi-io-base h# 26 + port-rb  h#  06 bitset  al dx out  \ Settings to support C3 state

3 # io-apic-mmio-base #) byte mov    1 # io-apic-mmio-base h# 10 + #) mov  \ IO-APIC FSB delivery type
