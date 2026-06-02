/// Module for [ParserError] enum namespace
module json.parser_error;

import gid.gid;
import glib.error;
import glib.types;
import json.c.functions;
import json.c.types;
import json.types;

/// Namespace for [ParserError] enum
struct ParserError
{
  alias Enum = json.types.ParserError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = json_parser_error_quark();
    return _retval;
  }
}

class ParseException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(json.parser_error.ParserError.quark, cast(int)code, msg);
  }

  alias Code = json.types.ParserError;
}
