/// Module for [TLDError] enum namespace
module gid.soup3.tlderror;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;

/// Namespace for [TLDError] enum
struct TLDError
{
  alias Enum = gid.soup3.types.TLDError; ///

  /**
      Registers error quark for [gid.soup3.global.tldGetBaseDomain] if needed.
      Returns: Error quark for Soup TLD functions.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = soup_tld_error_quark();
    return _retval;
  }
}

class TLDException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.soup3.tlderror.TLDError.quark, cast(int)code, msg);
  }

  alias Code = gid.soup3.types.TLDError;
}
