/// Module for [TLDError] enum namespace
module soup.tlderror;

import gid.gid;
import glib.error;
import glib.types;
import soup.c.functions;
import soup.c.types;
import soup.types;

/// Namespace for [TLDError] enum
struct TLDError
{
  alias Enum = soup.types.TLDError; ///

  /**
      Registers error quark for [soup.global.tldGetBaseDomain] if needed.
      Returns: Error quark for Soup TLD functions.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = soup_tld_error_quark();
    return _retval;
  }
}

class TLDException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(soup.tlderror.TLDError.quark, cast(int)code, msg);
  }

  alias Code = soup.types.TLDError;
}
