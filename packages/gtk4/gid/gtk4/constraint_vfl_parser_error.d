/// Module for [ConstraintVflParserError] enum namespace
module gid.gtk4.constraint_vfl_parser_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/// Namespace for [ConstraintVflParserError] enum
struct ConstraintVflParserError
{
  alias Enum = gid.gtk4.types.ConstraintVflParserError; ///

  /**
      Registers an error quark for VFL error parsing.
      Returns: the error quark
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_constraint_vfl_parser_error_quark();
    return _retval;
  }
}

class ConstraintVflParseException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtk4.constraint_vfl_parser_error.ConstraintVflParserError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtk4.types.ConstraintVflParserError;
}
