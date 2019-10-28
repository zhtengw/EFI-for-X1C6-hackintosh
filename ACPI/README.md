|Patches|Description|
|-------|-----------|
|SSDT-Battery|	Battery(need GBIF, GBST, GBIX renamed )|
|SSDT-Keyboard-X1C6	|Thinkpad Clickpad and keyboard hotkeys(See detail in #1 keyboard hotkey)|
|SSDT-PLUG	|	Plugin Type 1 to enable XCPM|
|SSDT-PNLF	|	LCD brightness control|
|SSDT-SBUS	|	Add SMBus device|
|SSDT-SLPWAK-X1C6	|Sleep and Wake(affect the behavior of LID, LED on LOGO, solved wake up immediately; need _PTS, _WAK, GPRW renamed)|


#### 1 keyboard hotkey:
Make Fn+4 sleep hotkey works normally, need SSDT-SLPWAK-X1C6 to be functional;
Make Fn key functional, need _Q14, _Q15, _Q13, _Q6A, _Q64, _Q65, _Q66, _Q60, _Q61, _Q62 renamed

|Key	|	EC Queries	|Default Function	|Mapping PS2 codes	|Mapping ADB Codes|
|-----|-------------|-----------------|-------------------|-----------------|
|Fn+F4(Mic Mute)|	_Q6A	|	Play/Pause	|e022		|	0x34|
|Fn+F5(down)	|_Q15	|	Bright D(F14)|	e005	|		BRI_DOWN(0x6b)|
|Fn+F6(up)|	_Q14	|	Bright U(F15)|	e006		|	BRI_UP(0x71)|
|Fn+F7(Mirror Screen)	|_Q16	|	null(Video Mirror)|	e06e	|		0x70|
|Fn+F8(Wireless)	|_Q64	|	null(F18)	|69		|	0x4f|
|Fn+F9(Settings)|	_Q66	|	null(F19)	|6a		|	0x50|
|Fn+F10(Bluetooth)|	_Q60	|	null(F20)	|6b	|		0x5a|
|Fn+F11(Keyboard)|_Q61	|	null(F17)	|68		|	0x40|
|Fn+F12(Star)	|_Q62		|null(F22)	|6d		|	DEADKEY(0x80)|
|Fn+PrtSc(CutScreen)	|_Q65	|	null(F16)	|67		|	0x6a	|

I defined shortcut to make Fn+F9(F19) open "System Preferences.app", Fn+PrtSc(F16) to open Screenshot.app and Fn+F11(F17) to open Launchpad.

Video Mirror, F20, and F22 can not be recognized by macOS.
