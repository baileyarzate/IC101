Author: J. Wlodek x7599 
Date: 9-11-2020

StreamDevice based EPICS driver for control of Sydor PBG Controllers.

Command | Description | Input/Output Format
--------|-------------|---------
AM n | set Amplitude  | n = 0 – 100 (0 to +/-20V) 
MO [0-1-t-c] | Mode | 0 = off, 1 = DC, t = External trigger, c = cw pulses 
PW f | Set pulse Width. | Used with Mode t only; f is in us. 
FD freq dc | set frequency and Duty cycle | freq range is 30 to 31250 Hz, dc is 0.1 to 100% Used with mode c only. 
PO [0-1] | set polarity | PO 1 is positive. PO 0 is negative 
QT? | Read temperatures | Returns four values in fomat +99999.99. Couples in order W, X, Y, Z
VR? | get firmware version | a.b.c 
