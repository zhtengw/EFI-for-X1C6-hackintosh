# macOS on Thinkpad X1 Carbon 6th Gen 2018, 20KG*
[![release](https://img.shields.io/badge/download-release-blue.svg)](https://github.com/zhtengw/EFI-for-X1C6-hackintosh/releases)

## My hardware configuration
| Name                | Specifications | Funtional or not |
| ------------------- | -----------------------------------------|---------------|
| Processor           | Intel Core i5-8250U Processor            |Fully|
| Memory              | 8GB LPDDR3 2133MHz                       |Fully|
| Storage             | Samsung NVMe SSD Controller PM981 256GB  |Replaced by **Samsung SM961** then work|
| Graphics            | Intel UHD Graphics 620                   |Fully with WhateverGreen.kext and properties inject|
| Display             | 14.0" FHD 1920x1080 LED IPS              |Fully|
| Audio               | Realtek Audio ALC285 codec               |Fully with AppleALC.kext and layout-id 11|
| Ethernet            | Intel(R) Ethernet Connection (4) I219-V  |Fully with IntelMausi.kext|
| WLAN & Bluetooth    | Intel(R) Dual Band Wireless-AC 8265      |Replaced by **Bcm94360CS2** then work|
| MicroSD Card Reader | Generic-SD/MMC CRW USB Device            |Fully with USBPorts.kext|
| Keyboard & Trackpad | LED backlight, TrackPoint and multi-touch touchpad |Almost fully with VoodooPS2Controller.kext and SSDT-Keyboard-X1C6 patch| 
| Fingerprint         | On chip fingerprint reader               |Non-funtional|


All ports listed below are working.

|Ports |
|------|
| two USB 3.1 Gen 1|
|two USB 3.1 Type-C Gen 2/Thunderbolt 3|
|HDMI 1.4b|
|Ethernet extension connector|
|headphone/microphone jack|
|MircoSD card reader|

All [Apple Continuity funtions](https://support.apple.com/en-us/HT204681) are working.
