# Yet Another Filament Bank

## Why another Filament Buffering Solution?

I wanted a solution that met the following requirements:

- Does a decent job of handling retracting filament (duh)
- Fully 3d printable while ideally using a minimal amount of filament
- Retains maximum visibility of filament in the system
- Easy to change filament

## License

## Instructions

### Step One: Printing

The first step is to print the peices required for the buffer chambers. You can start from scratch with the .stl files, or printable files for building this out of PLA exist both in pre-arranged 3mf files for PrusaSlicer or gcode files for direct printing from a Prusa i3 MK3S printer.

#### Buffering chambers

##### 1x bottom bracket

This is the bottom part that holds the separator walls and sidewalls in place. 

I recommend printing this with transparent filament and minimal infill (downloadable gcodes are 5% hexagonal infill). This model is included as part of `brackets_pegs.3mf` and its associated gcode file.

##### 1x top bracket

This holds the tops of the separatator walls and sidewalls in place, holds the wheel assemblies in place, and has tabs for hanging the assembly on your printer stand. 

I recommend printing this with transparent filament and minimal infill (downloadable gcodes are 5% hexagonal infill). This model is included as part of `brackets_pegs.3mf` and its associated gcode file.

##### 2x side wall

The sidewalls fit into the top and bottom brackets and hold the separator walls in place.

I recommend printing this with transparent filament to allow more visibility to the filament chambers. Printing these with standard settings will create a sturdier chamber, but I recommend printing them with 10% hex infill with no top/bottom layers. This will allow maximum visibility into the buffer chambers. Both copies of this model are included as part of `sidewalls.3mf` and its associated gcode file.

##### 1x side pegs

This model includes four pegs that secure the separator walls into the top and bottom brackets. The longer pegs go into the top bracket. All pegs include threading at the end to hold them securely in place.

I recommend printing this with either 20% gyroid infill or 100% infill. This model is included as part of `brackets_pegs.3mf` and its associated gcode file.

##### 6x separator wall

The separator walls isolate each color of filament into separate chambers.

I recommend printing these with transparent filament to allow more visibility to the filament chambers. Printing these with standard settings will create a sturdier chamber, but I recommend printing them with 10% hex infill with no top/bottom layers. This will allow maximum visibility into the buffer chambers. Both copies of this model are included as part of `separator_wall.3mf` and its associated gcode file.

#### Five wheel assemblies

  - 5x filament wheels
  - 5x filament wheel mount bottom
  - 5x filament wheel mount top
  - 5x sets of axle and connectors (model includes 1x axle, 2x connectors, as needed)
  - 5x thumb pegs

### Modifying

Many changes that you would like to make can be made by modifying `src/filament_bank_values.scad`. For example, increasing the thickness of walls for a more solid assembly. If you make improvements to the design, please submit a pull request on github!

### Assembly

- 10x PC4-M6 Quick Fitting Push to Connect PTFE fittings

### Installation

- 2x bolts/nuts for hanging (size???)

## Credit

This is a filament buffering system designed for use with the Prusa MMU2s, but should be easily adaptable to suit similar requirements or MMU2S modifications adding additonal filaments.

The original inspiration for this comes from [David Shealey](https://www.thingiverse.com/TNDave/about)'s brilliant design for his [Prusa MMU2 Filament Retract Bank](https://www.thingiverse.com/thing:3373895). His concept of a simple wheel releasing filament into a channel was the first workable buffering system for the MMU2S, as far as I'm concerned. However, this design suffers from two flaws. First, the walls of the chambers were designed to be acrylic plastic -- which had the advantage of being clear, but required some knowlege of working with acrylic.

This led [Piotr Karkovski](https://www.thingiverse.com/Karkovski/about) to create a modified [Fully printable Prusa MMU2 Filament Retract Bank (Buffer)](https://www.thingiverse.com/thing:3670379). This solved the orignial issue, and Piotr's instructions suggested maintaining visibility by using hex infill with no top or bottom layers. This was a very nice innovation, but it didn't help to solve the other issue with Shealey's original design.

Shealy's design relies on a paddle that slides up and down that, as you feed filament in, is supposed to force the filament to return up the other side. While this occasionally worked for me, I found it to be frustating in practice. [Garth Gangaway](https://www.thingiverse.com/GVader/about) set out to solve this problem with a new design, but this again relied on acrylic panels, and I did not like the clipping solution used on this model.

I am super grateful to all of these designers and their innovation. While I haven't used their original designs in creating this project, it certainly wouldn't exist without their original work, especially David Shealey's original design.
