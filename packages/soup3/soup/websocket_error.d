/// Module for [WebsocketError] enum namespace
module soup.websocket_error;

import gid.gid;
import glib.error;
import glib.types;
import soup.c.functions;
import soup.c.types;
import soup.types;

/// Namespace for [WebsocketError] enum
struct WebsocketError
{
  alias Enum = soup.types.WebsocketError; ///

  /**
      Registers error quark for SoupWebsocket if needed.
      Returns: Error quark for SoupWebsocket.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = soup_websocket_error_quark();
    return _retval;
  }
}

class WebsocketException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(soup.websocket_error.WebsocketError.quark, cast(int)code, msg);
  }

  alias Code = soup.types.WebsocketError;
}
