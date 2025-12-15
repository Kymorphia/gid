/// Module for [ServerAuthSender] class
module arrowflight.server_auth_sender;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

/** */
class ServerAuthSender : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_server_auth_sender_get_type != &gidSymbolNotFound ? gaflight_server_auth_sender_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ServerAuthSender self()
  {
    return this;
  }

  /**
      Writes a message to the client.
  
      Params:
        message = A #GBytes to be sent.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool write(glib.bytes.Bytes message)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gaflight_server_auth_sender_write(cast(GAFlightServerAuthSender*)this._cPtr, message ? cast(GBytes*)message._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
