# Arduino-Relay-Extension-Cord
A simple relay extension cord built with Arduino, a Solid State Relay and 433 Mhz Radio module.

# Hardware components:

- 2 x Arduino Board
- 1 x 433 Mhz Receiver
- 1 x 433 Mhz Transmitter
- 2 x Antenna (17.32cm)
- Extension Cord
- 1 x SSR (Solid State Relay or classic relay if you'd prefer)
- 1 x 12V 1A Power Supply.

The Antenna's length was calculated with this formula: Lambda = (V/f)  (V = speed in the ether, f = wavelength) all divided by 4.


The circuit scheme is available on my blog:

- http://www.hackerstribe.com/2013/prolunga-rele-v2-0-python-atmega328p/

# Software

This project provides a basic web interface (luce.html), to toggle the SSR state.

The sender.pde is the arduino code to be uploaded to the arduino (connected to a PC acting as a server).
The receiver.pde is the arduino code to be uploaded on the Arduino directly connected to the SSR.

Each of the two arduino bot got a 433 Mhz device. (Transmitter and receiver or transreceiver if you'd prefer).
Finally the Main-server-remote.py must run on the PC acting as a server (it directly communicate through USB with Arduino, the 'sender' one).


