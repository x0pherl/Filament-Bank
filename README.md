# Yet Another Filament Bank

## Why another Filament Buffering Solution?

I wanted a solution that met the following requirements:

- Does a decent job of handling retracting filament (duh)
- Fully 3d printable while ideally using a minimal amount of filament
- Retains maximum visibility of filament in the system
- Easy to change filament

## Bill of Materials

While a focus of this design is maximizing 3d printable parts, there are of course, some parts which you will need that cannot be effectively printed.

- 10x PC4-M6 Quick Fitting Push to Connect PTFE fittings
- 5x 604z bearings
- 2x M3 screws/nuts and bolts for affixing assembled bank to your printer stand (I used spare Prusa parts)
- Enough PTFE Teflon tubing (2mm Inner Diameter(ID) X 4mm Outer Diameter (OD)) to connect the bank to your printer and filament stands

## License

This project is licensed under the terms of the  [MIT license](LICENSE.txt).

## Step One: Printing Guide

The first step is to print the pieces required for the buffer chambers. You can start from scratch with the .stl files, or printable files for building this out of PLA exist both in pre-arranged .3mf files for PrusaSlicer or gcode files for direct printing from a Prusa i3 MK3S printer.

### Buffering chambers

#### 1x bottom bracket

This is the bottom part that holds the separator walls and sidewalls in place.

I recommend printing this with transparent filament and minimal infill (downloadable gcodes are 5% hexagonal infill). This model is included as part of `brackets_pegs.3mf` and its associated gcode file.

#### 1x top bracket

This holds the tops of the separator walls and sidewalls in place, holds the wheel assemblies in place, and has tabs for hanging the assembly on your printer stand.

I recommend printing this with transparent filament and minimal infill (downloadable gcodes are 5% hexagonal infill). This model is included as part of `brackets_pegs.3mf` and its associated gcode file.

#### 2x side wall

The sidewalls fit into the top and bottom brackets and hold the separator walls in place.

I recommend printing this with transparent filament to allow more visibility to the filament chambers. Printing these with standard settings will create a sturdier chamber, but I recommend printing them with 10% hex infill with no top/bottom layers. This will allow maximum visibility into the buffer chambers. Both copies of this model are included as part of `sidewalls.3mf` and its associated gcode file.

#### 1x side pegs

This model includes four pegs that secure the separator walls into the top and bottom brackets. The longer pegs go into the top bracket. All pegs include threading at the end to hold them securely in place.

I recommend printing this with either 20% gyroid infill or 100% infill. This model is included as part of `brackets_pegs.3mf` and its associated gcode file.

#### 6x separator wall

The separator walls isolate each color of filament into separate chambers.

I recommend printing these with transparent filament to allow more visibility to the filament chambers. Printing these with standard settings will create a sturdier chamber, but I recommend printing them with 10% hex infill with no top/bottom layers. This will allow maximum visibility into the buffer chambers. Both copies of this model are included as part of `separator_wall.3mf` and its associated gcode file.

### Five wheel assemblies

#### 5x filament wheels

This is the wheel that the filament rotates against when the printer is printing.

The default 20% gyroid infill profile is fine here. I recommend printing each of these five wheels in a different color, it will make it easy to tell at a glance which wheel is turning.

This model is included as part of `wheel_and_peg.3mf` and its associated gcode file.

#### 5x thumb pegs

These pegs lock the brackets into place with the buffering chamber.

The default 20% gyroid infill profile is fine here. I recommend printing each of these in a different color as with the five wheels, it will make it easy to tell at a glance which bracket to pull out when you're changing filament

This model is included as part of `wheel_and_peg.3mf` and its associated gcode file.

#### 5x filament wheel mount bottom

This is the bottom half of the bracket that holds the filament wheel in place and connects to the buffering chambers.

I recommend printing these with transparent filament to allow more visibility to the filament chambers, although it will not matter as much with these parts. I recommend printing them with 10% hex infill with no top/bottom layers. This model is included as part of `wheel_assembly.3mf` and its associated gcode file.

#### 5x filament wheel mount top

This is the top half of the bracket that holds the filament wheel in place and connects to the buffering chambers.

I recommend printing these with transparent filament to allow more visibility to the filament chambers, although it will not matter as much with these parts. I recommend printing them with 10% hex infill with no top/bottom layers. This model is included as part of `wheel_assembly.3mf` and its associated gcode file.

#### 5x filament wheel axle

This is the axle that will screw in place, holding the bearing and brackets in place. These are easy to break while assembling, you may find it useful to print some spares.

The default 20% gyroid infill profile is fine here. This model is included as part of `wheel_assembly.3mf` and its associated gcode file.

#### 10x filament wheel axle

You'll need 10 connectors that hold the filament wheel mount brackets together.

The default 20% gyroid infill profile is fine here. This model is included as part of `wheel_assembly.3mf` and its associated gcode file.

## Modifying

Many changes that you would like to make can be made by modifying `src/filament_bank_values.scad`. For example, increasing the thickness of walls for a more solid assembly. If you make improvements to the design, please submit a pull request on github!

## Assembly

YouTube videos of the assemby process are available:

- [Part One - Filament Buffer Assembly](https://youtu.be/NMZ75zq5oWg)
- [Part Two -- Wheel Bracket Assembly](https://youtu.be/zj1OsbUYNdQ)
- [Part Three -- Final Assembly](https://youtu.be/MDklB2XTeAQ)

### Buffering Chamber Assembly

Start with the bottom bracket. It may be helpful to use a utility knife to clean any printing artifacts out of the 6 slots along the bracket. Note that on the one side, next the round hole for the peg, there is a small notch. That side is the "deeper" section, and your separator walls should be aligned to match.

Slide each of the six separator walls into the slots on the bottom bracket. With the notch on the right of the bottom bracket, slide in the two shorter pegs, then use a pair of pliers to give each peg a twist or two clockwise to lock the pegs in place.

Then carefully align one of the sidewalls with the separator walls, and slide it down into the bottom bracket until it is firmly in place. Repeat with the other side.

Align the top bracket with the sidewall and separator walls and slide into place. With the back bracket facing to the right, slide in the two longer pegs, then use a pair of pliers to give each peg a twist or two clockwise to lock the pegs in place.

Congratulations, you've finished the buffering chambers! Why don't you reward yourself with some gummi bears :)

### Wheel Bracket Assembly

First, fit one of the printed axles through the top filament wheel mount (when inserted properly, it will sit flush on the plate). Place this on a flat surface so that the axle is pointing upwards.

Now, push one of the bearings into a the center of a wheel. Push the combined wheel/bearing onto the axle which is facing upwards.

Carefully align the bottom filament wheel mount so that the socket for the axle aligns with the axle, then carefully pick up the assembled bracket and gently turn the axle a bit by hand or using a coin to turn it. TIGHTEN VERY GENTLY, or the axle may break.

> IF the axle breaks, you will need to get the remaining part out of the bottom bracket. Using a utility knife and stabbing the center of the broken axle and turning it is effective in this case.

Once you have the axle in place, insert the two 3d printed connector bolts to hold the top and bottom brackets in place. When all of the screws are in place, make sure they are all flush with the bottom bracket, or the brackets will not all fit into the buffering chamber.

Finally, make sure the wheel spins freely. You may need to carefully push the wheel towards the top or bottom bracket to eliminate friction and allow it to freely turn.

Screw two of the two PTFE tube quick releases into the top of the bracket, and you'll have assembled a wheel bracket.

Repeat 4 more times and then reward yourself with some gummi bears.

## Installation

The top bracket of the buffering chamber has brackets for hanging. Using M3 screws, secure the buffering chamber to a wall or your print stand. Ideally, there should be a short line of travel from the MMU2s unit downward to the buffering chamber.

Insert each of the wheel assemblies into the top bracket. Note that the back should be angled down as you insert them, so that the guide along the back lines up with the protrusion along the back of the top bracket. Then drop the front of the wheel assembly down and secure it with one of the thumb pegs. If you printed the pegs and wheels in five different colors as suggested in the printing instructions, be sure to match them up.

Finally insert PTFE tubing from the back of the wheel assemblies, and run that to your MMU2s unit; and run PTFE tubing from the front of the wheel assemblies to your filament stands.

Now you're ready to print!

## Credit

This is a filament buffering system designed for use with the Prusa MMU2s, but should be easily adaptable to suit similar requirements or MMU2S modifications adding additional filaments.

The original inspiration for this comes from [David Shealey](https://www.thingiverse.com/TNDave/about)'s brilliant design for his [Prusa MMU2 Filament Retract Bank](https://www.thingiverse.com/thing:3373895). His concept of a simple wheel releasing filament into a channel was the first workable buffering system for the MMU2S, as far as I'm concerned. However, this design suffers from two flaws. First, the walls of the chambers were designed to be acrylic plastic -- which had the advantage of being clear, but required some knowlege of working with acrylic.

This led [Piotr Karkovski](https://www.thingiverse.com/Karkovski/about) to create a modified [Fully printable Prusa MMU2 Filament Retract Bank (Buffer)](https://www.thingiverse.com/thing:3670379). This solved the orignial issue, and Piotr's instructions suggested maintaining visibility by using hex infill with no top or bottom layers. This was a very nice innovation, but it didn't help to solve the other issue with Shealey's original design.

Shealy's design relies on a paddle that slides up and down that, as you feed filament in, is supposed to force the filament to return up the other side. While this occasionally worked for me, I found it to be frustating in practice. [Garth Gangaway](https://www.thingiverse.com/GVader/about) set out to solve this problem with a new design, but this again relied on acrylic panels, and I did not like the clipping solution used on this model.

I am super grateful to all of these designers and their innovation. While I haven't used their original designs in creating this project, it certainly wouldn't exist without their original work, especially David Shealey's original design.
