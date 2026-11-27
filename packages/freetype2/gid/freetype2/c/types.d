/// C types for freetype2 library
module gid.freetype2.c.types;

public import gid.core.basictypes;
public import gid.glib2.c.types;

/// GIR namespace of the binding (used to export D-defined GObject types to GIR)
enum string _gidGirNamespace = "freetype2";

/// GIR namespace version of the binding
enum string _gidGirVersion = "2.0";

/// C headers of the binding library (included by the C headers of D libraries using its types)
enum string[] _gidGirCIncludes = [];

/** */
@gidGir("Bitmap")
struct FT_Bitmap;

/** */
alias FT_Face = FT_Face_st*;

struct FT_Face_st;

/** */
alias FT_Library = FT_Library_st*;

struct FT_Library_st;

