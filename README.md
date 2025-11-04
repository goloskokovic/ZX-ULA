ULA CPLD Project - Clone of the ZX Spectrum ULA.

This project aims to replace a custom-made component for the 8-bit microcomputer ZX Spectrum manufactured by the English company Sinclair Research.

![image](/Eagle/ULA.jpg)

Details

All this work was based on the work of Chris Smith [1] and done jointly by the project authors. Thanks to the people from the Brazilian discussion lists "ClubedoTK" [2] and "TK90X" [3] who encouraged and helped in the development of this project.

On the website [4] there is a small diary created by Victor Trucco describing the steps during the development of the project.

The project [5] has two revisions, rev1 and rev2, each in a separate folder. In each revision there is a folder with the PCB design, a folder with the Gerber fabrication files and a folder with the CPLD source code project. The software version used for PCB design was Cadsoft Eagle, and the software used for CPLD design was Altera Quartus version 10.1sp1.

In the "VHDL Version" folder, there is a version of the CPLD code written entirely in VHDL, for both Altera and Xilinx CPLDs. This code was not used in the final ULA CPLD. This is the version used here.

The final product is a small board designed to be inserted directly into the socket of the original integrated circuit, thus replacing the defective component, with the advantage of having a 15kHz analog RGB output for direct use with compatible monitors.

Assembly

Solder the SMD components, obtain an 80-pin turned terminal block, cut it in half for the two 40-pin sides. The CPLD occupies the space of four pins on each side of the turned terminal block, so it is necessary to cut the 4 central pins of each block to make an SMD solder joint at these points.

Place the block in position to find out which pins should be cut, cut with thin cutting pliers to leave it flush with the PCB. Use a 40-pin turned socket and plug the blocks into the socket for aligned soldering. Place the PCB on top of the block and fit the uncut pins into their respective holes and solder them. To solder the 8 cut pins (4 on each side), place the soldering iron tip on one side to heat the PCB and the pin header simultaneously, and apply the solder from the other side. Check with a magnifying glass to ensure successful soldering.

If using the 15kHz RGB output, solder a 90-degree pin header to the PCB, and in revision 2, solder the synchronization jumper. You can choose which type of synchronization will go to the monitor, separate or composite. Depending on the monitor, one type may be better than the other, so it may be necessary to test both types; however, the separate synchronization option has greater compatibility with monitors.

In the Photos folder, there are some photos of the first prototype built.

CPLD Programming

To program the CPLD, a USB Blaster device specific to Altera CPLDs is required. In PCB rev1, the contact points for the programming signals are spread across the PCB, requiring the construction of a "nail bed" or soldering of wires to the points. For rev2, the signals are arranged in a 1x6 connector. The signal names are on the PCB silkscreen. It is necessary to use an external 5V power supply and apply 5V to the VCC pin of the USB Blaster, as it does not power the device but detects if it is powered.

Open the project in Quartus software and go to the programmer. Power the PCB and the USB Blaster and click "Program". If there is a failure in this step, check the connections and check if 5V is going to the USB Blaster. The file needed for programming is called "ULA.pof".

Usage

It is highly recommended to replace the ULA socket on the ZX Spectrum PCB with a machined socket, however, it is possible to use the original. Carefully plug the ULA PCB into the TK socket, pressing slowly to avoid bending any pins. If everything goes well, just turn on the computer and enjoy your new ULA.

Links

[1] http://www.zxdesign.info/thebeginning.shtml [2] http://br.groups.yahoo.com/group/ClubedoTK/ [3] http://br.groups.yahoo.com/group/TK90X/ [4] http://www.victortrucco.com/TK/ULATKCPLD/ULATKCPLD.asp [5] https://github.com/fbelavenuto/tk90x_ula
