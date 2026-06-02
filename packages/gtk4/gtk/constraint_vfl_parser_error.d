/// Module for [ConstraintVflParserError] enum namespace
module gtk.constraint_vfl_parser_error;

import gid.gid;
import glib.error;
import glib.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [ConstraintVflParserError] enum
struct ConstraintVflParserError
{
  alias Enum = gtk.types.ConstraintVflParserError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_constraint_vfl_parser_error_quark();
    return _retval;
  }
}

class ConstraintVflParseException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gtk.constraint_vfl_parser_error.ConstraintVflParserError.quark, cast(int)code, msg);
  }

  alias Code = gtk.types.ConstraintVflParserError;
}
