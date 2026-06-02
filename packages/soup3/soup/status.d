/// Module for [Status] enum namespace
module soup.status;

import gid.gid;
import soup.c.functions;
import soup.c.types;
import soup.types;

/// Namespace for [Status] enum
struct Status
{
  alias Enum = soup.types.Status; ///

  /**
      Looks up the stock HTTP description of status_code.
      
      *There is no reason for you to ever use this
      function.* If you wanted the textual description for the
      [soup.message.Message.statusCode] of a given [soup.message.Message], you should just
      look at the message's [soup.message.Message.reasonPhrase]. However, you
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
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
