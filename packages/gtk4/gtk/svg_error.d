/// Module for [SvgError] enum namespace
module gtk.svg_error;

import gid.gid;
import glib.error;
import glib.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [SvgError] enum
struct SvgError
{
  alias Enum = gtk.types.SvgError; ///

  /**
      Returns context information about what XML attribute
      the parsing error occurred in.
  
      Params:
        error = an error in the [gtk.types.SvgError] domain
      Returns: the attribute name
  */
  static string getAttribute(glib.error.ErrorWrap error) nothrow
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
        error = an error in the [gtk.types.SvgError] domain
      Returns: the element name
  */
  static string getElement(glib.error.ErrorWrap error) nothrow
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
        error = an error in the [gtk.types.SvgError] domain
      Returns: the [gtk.types.SvgLocation]
  */
  static gtk.types.SvgLocation getEnd(glib.error.ErrorWrap error) nothrow
  {
    const(GtkSvgLocation)* _cretval;
    _cretval = gtk_svg_error_get_end(error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
    gtk.types.SvgLocation _retval;
    if (_cretval)
      _retval = *cast(gtk.types.SvgLocation*)_cretval;
    return _retval;
  }

  /**
      Returns context information about the start position
      in the document where the parsing error occurred.
  
      Params:
        error = an error in the [gtk.types.SvgError] domain
      Returns: the [gtk.types.SvgLocation]
  */
  static gtk.types.SvgLocation getStart(glib.error.ErrorWrap error) nothrow
  {
    const(GtkSvgLocation)* _cretval;
    _cretval = gtk_svg_error_get_start(error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
    gtk.types.SvgLocation _retval;
    if (_cretval)
      _retval = *cast(gtk.types.SvgLocation*)_cretval;
    return _retval;
  }

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
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
    super(gtk.svg_error.SvgError.quark, cast(int)code, msg);
  }

  alias Code = gtk.types.SvgError;
}
