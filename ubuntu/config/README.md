# Config files
Some detached configs to be applied manually

## TLP - Thinkpad T430
TLP config file  
Location: `/etc/default/tlp`

## Grub
Grub custom file to load iso images from reserved partition  
Location: `/etc/grub.d/40_custom`

## Xorg - LG 21:9 2560x1080 UltraWide 25UM65
Xorg config file  
Location: `/usr/share/X11/xorg.conf.d/90-monitor.conf`  
Useful commands:
  - `xrandr`: monitor identifiers and display resolutions
  - `xrandr --listmonitors`: list monitors
  - `gtf x y fr`: Modeline generator
  - `cvt x y fr`: similar to gtf

#### Modeline example test
```sh
xrandr --listmonitors
    Monitors: 1
     0: +*HDMI-2 1920/677x1080/290+0+0  HDMI-2

gtf 2560 1080 55
    # 2560x1080 @ 55.00 Hz (GTF) hsync: 61.32 kHz; pclk: 209.98 MHz
    Modeline "2560x1080_55.00"  209.98  2560 2720 2992 3424  1080 1081 1084 1115  -HSync +Vsync


xrandr --newmode "2560x1080_55.00"  209.98  2560 2720 2992 3424  1080 1081 1084 1115  -HSync +Vsync
xrandr --addmode HDMI-2 2560x1080_55.00
xrandr --output HDMI-2 --mode 2560x1080_55.00
```
To persist changes modify 90-monitor.conf

## Tilda
Tilda config file  
Location: `~/.config/tilda/config_0`
