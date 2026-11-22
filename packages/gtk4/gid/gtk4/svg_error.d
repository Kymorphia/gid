/// Module for [SvgError] enum namespace
module gid.gtk4.svg_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/// Namespace for [SvgError] enum
struct SvgError
{
  alias Enum = gid.gtk4.types.SvgError; ///

  /**
      Returns context information about what XML attribute
      the parsing error occurred in.
  
      Params:
        error = an error in the [gid.gtk4.types.SvgError] domain
      Returns: the attribute name
  */
  static string getAttribute(gid.glib2.error.ErrorWrap error) nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_svg_error_get_attribute(error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns context information about what XML element
      the parsing error occurred in.
  
      Params:
        error = an error in the [gid.gtk4.types.SvgError] domain
      Returns: the element name
  */
  static string getElement(gid.glib2.error.ErrorWrap error) nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_svg_error_get_element(error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns context information about the end position
      in the document where the parsing error occurred.
  
      Params:
        error = an error in the [gid.gtk4.types.SvgError] domain
      Returns: the [gid.gtk4.types.SvgLocation]
  */
  static gid.gtk4.types.SvgLocation getEnd(gid.glib2.error.ErrorWrap error) nothrow
  {
    const(GtkSvgLocation)* _cretval;
    _cretval = gtk_svg_error_get_end(error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
    gid.gtk4.types.SvgLocation _retval;
    if (_cretval)
      _retval = *cast(gid.gtk4.types.SvgLocation*)_cretval;
    return _retval;
  }

  /**
      Returns context information about the start position
      in the document where the parsing error occurred.
  
      Params:
        error = an error in the [gid.gtk4.types.SvgError] domain
      Returns: the [gid.gtk4.types.SvgLocation]
  */
  static gid.gtk4.types.SvgLocation getStart(gid.glib2.error.ErrorWrap error) nothrow
  {
    const(GtkSvgLocation)* _cretval;
    _cretval = gtk_svg_error_get_start(error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
    gid.gtk4.types.SvgLocation _retval;
    if (_cretval)
      _retval = *cast(gid.gtk4.types.SvgLocation*)_cretval;
    return _retval;
  }

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_svg_error_quark();
    return _retval;
  }
}

class SvgException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtk4.svg_error.SvgError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtk4.types.SvgError;
}
