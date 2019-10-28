// HotKey for TP
//
// In config ACPI, _Q13 to XQ13(Fn+4); need SSDT-SLPWAK-X1C6 to be funtional
// Find:     5F 51 31 33
// Replace:  58 51 31 33
//
// In config ACPI, _Q14 to XQ14(TP-up,Fn+F6)
// Find:     5F 51 31 34
// Replace:  58 51 31 34
//
// In config ACPI, _Q15 to XQ15(TP-down,Fn+F5)
// Find:     5F 51 31 35
// Replace:  58 51 31 35
//
// In config ACPI, _Q16 to XQ16(Fn+F7)
// Find:     5F 51 31 36
// Replace:  58 51 31 36
//
// In config ACPI, _Q6A to XQ6A(MicMute,Fn+F4)
// Find:     5F 51 36 41
// Replace:  58 51 36 41
//
// In config ACPI, _Q64 to XQ64(Wireless,Fn+F8)
// Find:     5F 51 36 34
// Replace:  58 51 36 34
//
// In config ACPI, _Q65 to XQ65(Cut,Fn+PrtSc)
// Find:     5F 51 36 35
// Replace:  58 51 36 35
//
// In config ACPI, _Q66 to XQ66(Setting,Fn+F9)
// Find:     5F 51 36 36
// Replace:  58 51 36 36
//
// In config ACPI, _Q60 to XQ60(Bluetooth,Fn+F10)
// Find:     5F 51 36 30
// Replace:  58 51 36 30
//
// In config ACPI, _Q61 to XQ61(Keyboard,Fn+F11)
// Find:     5F 51 36 31
// Replace:  58 51 36 31
//
// In config ACPI, _Q62 to XQ62(Star,Fn+F12)
// Find:     5F 51 36 32
// Replace:  58 51 36 32
//
// Hotkey mapping(Change the PS2 codes for function you like, 
// see https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller/blob/master/VoodooPS2Keyboard/ApplePS2ToADBMap.h)
//
//Key		        EC Queries	DefaultFunction	Mapping PS2 codes    Mapping ADB Codes
//Fn+4(Sleep)        _Q13         Sleep            null                 null
//Fn+F4(MicMute)    	_Q6A		    Play/Pause	    e022                 0x34
//Fn+F5(down)	    _Q15		    Bright D(F14)	e005                 BRI_DOWN(0x6b)
//Fn+F6(up)	        _Q14		    Bright U(F15)	e006                 BRI_UP(0x71)
//Fn+F7(Mirror)	    _Q16		    null(Video Mir)	e06e                 0x70
//Fn+F8(Wifi)	    _Q64		    null(F18)	    69                   0x4f
//Fn+F9(Setting)    	_Q66		    null(F19)	    6a                   0x50
//Fn+F10(BTH)	    _Q60		    null(F20)	    6b                   0x5a
//Fn+F11(KB)	        _Q61		    null(F17)	    68                   0x40
//Fn+F12(Star)	    _Q62		    null(F22)	    6d                   DEADKEY(0x80)
//Fn+PrtSc(CutSc)    _Q65		    null(F16)	    67                   0x6a	

DefinitionBlock ("", "SSDT", 2, "hack", "Keyboard", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__.XQ13, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ14, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ15, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ16, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ60, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ61, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ62, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ64, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ65, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ66, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC__.XQ6A, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.KBD_, DeviceObj)
    External (_SB_.PCI9.FNOK, IntObj)

    Scope (_SB.PCI0.LPCB.KBD)
    {
        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            If (!Arg2)
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Local0 = Package (0x04)
                {
                    "RM,oem-id", 
                    "LENOVO", 
                    "RM,oem-table-id", 
                    "Thinkpad_ClickPad"
                }
            Return (Local0)
        }
    }

    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0406)
            }

            \_SB.PCI0.LPCB.EC.XQ14 ()
        }

        Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0405)
            }

            \_SB.PCI0.LPCB.EC.XQ15 ()
        }

        Method (_Q16, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x046E)
            }

            \_SB.PCI0.LPCB.EC.XQ16 ()
        }

        Method (_Q6A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0422)
            }

            \_SB.PCI0.LPCB.EC.XQ6A ()
        }

        Method (_Q64, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0369)
            }

            \_SB.PCI0.LPCB.EC.XQ64 ()
        }

        Method (_Q66, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x036A)
            }

            \_SB.PCI0.LPCB.EC.XQ66 ()
        }

        Method (_Q60, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x036B)
            }

            \_SB.PCI0.LPCB.EC.XQ60 ()
        }

        Method (_Q61, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0368)
            }

            \_SB.PCI0.LPCB.EC.XQ61 ()
        }

        Method (_Q62, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x036D)
            }

            \_SB.PCI0.LPCB.EC.XQ62 ()
        }

        Method (_Q65, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.KBD, 0x0367)
            }

            \_SB.PCI0.LPCB.EC.XQ65 ()
        }

        Method (_Q13, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                \_SB.PCI9.FNOK = One
            }

            \_SB.PCI0.LPCB.EC.XQ13 ()
        }
    }
}

