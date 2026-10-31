/// D types for rsvg2 library
module rsvg.types;

import gid.gid;
import rsvg.c.functions;
import rsvg.c.types;


// Enums

/** */
alias Error = RsvgError;

/** */
alias HandleFlags = RsvgHandleFlags;

/** */
alias Unit = RsvgUnit;

// Structs

/** */
alias DimensionData = RsvgDimensionData;

/** */
alias Length = RsvgLength;

/** */
alias PositionData = RsvgPositionData;

/** */
alias Rectangle = RsvgRectangle;

// Callbacks

/**
    Function to let a user of the library specify the SVG's dimensions
    
    See the documentation for [rsvg.handle.Handle.setSizeCallback] for an example, and
    for the reasons for deprecation.

    Params:
      width = the width of the SVG
      height = the height of the SVG

    Deprecated: Use [rsvg.handle.Handle.renderDocument] instead, which lets you specify
      a viewport size in which to render the SVG document.
*/
alias SizeFunc = void delegate(out int width, out int height);

/** */
enum HAVE_CSS = true;

/** */
enum HAVE_PIXBUF = 1;

/** */
enum HAVE_SVGZ = true;

/**
    This is a C macro that expands to a number with the major version
    of librsvg against which your program is compiled.
    
    For example, for librsvg-2.3.4, the major version is 2.
    
    C programs can use this as a compile-time check for the required
    version, but note that generally it is a better idea to do
    compile-time checks by calling [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/)
    in your build scripts.
    
    Note: for a run-time check on the version of librsvg that your
    program is running with (e.g. the version which the linker used for
    your program), or for programs not written in C, use
    `rsvg_major_version` instead.
*/
enum MAJOR_VERSION = 2;

/**
    This is a C macro that expands to a number with the micro version
    of librsvg against which your program is compiled.
    
    For example, for librsvg-2.3.4, the micro version is 4.
    
    C programs can use this as a compile-time check for the required
    version, but note that generally it is a better idea to do
    compile-time checks by calling [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/)
    in your build scripts.
    
    Note: for a run-time check on the version of librsvg that your
    program is running with (e.g. the version which the linker used for
    your program), or for programs not written in C, use
    `rsvg_micro_version` instead.
*/
enum MICRO_VERSION = 3;

/**
    This is a C macro that expands to a number with the minor version
    of librsvg against which your program is compiled.
    
    For example, for librsvg-2.3.4, the minor version is 3.
    
    C programs can use this as a compile-time check for the required
    version, but note that generally it is a better idea to do
    compile-time checks by calling [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/)
    in your build scripts.
    
    Note: for a run-time check on the version of librsvg that your
    program is running with (e.g. the version which the linker used for
    your program), or for programs not written in C, use
    `rsvg_minor_version` instead.
*/
enum MINOR_VERSION = 61;

/**
    This is a C macro that expands to a string with the version of
    librsvg against which your program is compiled.
    
    For example, for librsvg-2.3.4, this macro expands to
    `"2.3.4"`.
    
    C programs can use this as a compile-time check for the required
    version, but note that generally it is a better idea to do
    compile-time checks by calling [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/)
    in your build scripts.
    
    Note: for a run-time check on the version of librsvg that your
    program is running with (e.g. the version which the linker used for
    your program), or for programs not written in C, use
    `rsvg_version` instead.
*/
enum VERSION = "2.61.3";
