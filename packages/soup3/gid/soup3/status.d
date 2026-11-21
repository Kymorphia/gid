/// Module for [Status] enum namespace
module gid.soup3.status;

import gid.core.gid;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;

/// Namespace for [Status] enum
struct Status
{
  alias Enum = gid.soup3.types.Status; ///

  /**
      Looks up the stock HTTP description of status_code.
      
      *There is no reason for you to ever use this
      function.* If you wanted the textual description for the
      [gid.soup3.message.Message.statusCode] of a given [gid.soup3.message.Message], you should just
      look at the message's [gid.soup3.message.Message.reasonPhrase]. However, you
      should only do that for use in debugging messages; HTTP reason
      phrases are not localized, and are not generally very descriptive
      anyway, and so they should never be presented to the user directly.
      Instead, you should create you own error messages based on the
      status code, and on what you were trying to do.
  
      Params:
        statusCode = an HTTP status code
      Returns: the (terse, English) description of status_code
  */
  static string getPhrase(uint statusCode) nothrow
  {
    const(char)* _cretval;
    _cretval = soup_status_get_phrase(statusCode);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
