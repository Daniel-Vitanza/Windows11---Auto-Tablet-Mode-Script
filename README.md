# Windows11 - Auto Tablet Mode Script
This script triggers the tablet mode of Win11 for computers where input devices like volume buttons are considered HID keyboards by Win11. Typical example is OneXplayer X1 Air.

## Context


## Solution
This script will run in the background with almost no ram/cpu usage. It will monitor the connection/disconnection of keyboards devices.
If this concerns the keyboards you actually want to consider (as you will define in the script), the script will modified the value of the Win11 tablet mode key in the registry according to the presence or absence of the keyboards.

## Key Features
*Automatically enable/disable tablet mode in Win11 based on the keyboards you want to consider.
*Almost no ram/cpu usage.
*Can be configured for more than 1 keyboard.
*Easy to install (less than 5min)

## Installation

```
$KeyboardA = "VID_258A&PID_001E"
$KeyboardB = "xx"
```

## Disclosure
Don't blame me if you break something on your computer. Use it at your own risk.
