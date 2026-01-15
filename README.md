# Windows11 - Auto Tablet Mode Script
This script triggers the tablet mode of Win11 for computers where input devices like volume buttons are considered HID keyboards by Win11. Typical example is OneXplayer X1 Air.

## Context
In Win11, tablet mode (better touch experience) is triggered when no HID Keyboards is detected by Windows.
However, on some computers, some other devices like volume buttons are considered as HID Keyboards by Windows. 
This is for instance the case with the OneXPlayer X1 Air and results in two major inconveniences:
* The touch keyboard does not automatically popups when using the touchscreen without any keyboards connected.
* Taskbar and buttons size+behaviour are not adjusted to improve the touch experience.


## Solution
This script will run in the background with almost no ram/cpu usage. It will monitor the connection/disconnection of keyboards devices.
If this concerns the keyboards you actually want to consider (as you will define in the script), the script will modified the value of the Win11 tablet mode key in the registry according to the presence or absence of the keyboards.


## Key Features
* Automatically enable/disable tablet mode in Win11 based on the keyboards you want to consider.
* Almost no ram/cpu usage.
* Can be configured for more than 1 keyboard.
* Easy to install (less than 5min)


## Installation
1. Copy the script "AutoTabletMode.ps1" into a folder C:\Scripts .
2. Open the script with notepad or something equivalent.
3. Edit the following two lines with the "VID & PID" values of the keyboards you want to consider. By default, the script was written for the OneXPlayer X1 Air and its detachable keyboard. If you own the same computer, it should work as-is. KeyboardB is there if you want to consider another keyboard like a Logitech one.

    In this case or if you don't have the same computer as me, you will need to find out the "VID & PID" values of the keyboard you want to consider by checking the properties of devices/drivers in the Windows "Device Manager".
    ```
    $KeyboardA = "VID_258A&PID_001E"
    $KeyboardB = "xx"
    ```
4. Once edited, save and close the editor !
5. Import "AutoTabletMode - TaskScheduler.xml" as new task in the Windows "Task Scheduler".
6. Done - Reboot - Test it !

## Future Options
* Automatic keyboard language selection if you use both azerty and qwerty keyboards for instance.

## Disclosure
Don't blame me if you break something on your computer. Use it at your own risk.
