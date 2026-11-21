/// C types for freetype2 library
module gid.freetype2.c.types;

public import gid.core.basictypes;
public import gid.glib2.c.types;

/** */
struct FT_Bitmap;

/** */
alias FT_Face = FT_Face_st*;

struct FT_Face_st;

/** */
alias FT_Library = FT_Library_st*;

struct FT_Library_st;

