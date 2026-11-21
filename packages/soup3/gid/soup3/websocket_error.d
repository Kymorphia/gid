/// Module for [WebsocketError] enum namespace
module gid.soup3.websocket_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;

/// Namespace for [WebsocketError] enum
struct WebsocketError
{
  alias Enum = gid.soup3.types.WebsocketError; ///

  /**
      Registers error quark for SoupWebsocket if needed.
      Returns: Error quark for SoupWebsocket.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = soup_websocket_error_quark();
    return _retval;
  }
}

class WebsocketException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.soup3.websocket_error.WebsocketError.quark, cast(int)code, msg);
  }

  alias Code = gid.soup3.types.WebsocketError;
}
