Nerf Stampede barrel mod
========================

This is an [OpenSCAD] file for printing a barrel extension for a [Nerf Stampede](Stampede), to make it more closely resemble a [Warhammer 40k Lasgun](Lasgun).

Usage
-----

**At time of writing, this file has not been tested.  Use at your own risk!**

To print this design, you will normally need to convert the OpenSCAD files into something your 3D printer can use.  There are typically two steps to this: creating a stereolithograph (STL) file, which describes the 3D shapes you want to print, then "slicing" the STL file to produce the set of instructions your 3D printer will actually use.

The easiest way to build the STL files is to use Make from the command line.  If you have OpenSCAD installed, just run:

    make lasbarrel.stl

Alternatively, if you don't have OpenSCAD but do have Docker (I expect, but haven't tested, that drop-in replacements for Docker like Podman will Just Work), try:

    make USE_DOCKER=Yes lasbarrel.stl

For slicing the STL files to get something your printer can use, you're on your own, as that depends a lot on the specifics of your printer.  Personally, I use [Slic3r].

[OpenSCAD]: http://www.openscad.org/
[Stampede]: https://nerf.fandom.com/wiki/Stampede_ECS
[Lasgun]: https://warhammer40k.fandom.com/wiki/Lasgun
[Slic3r]: https://slic3r.org/
