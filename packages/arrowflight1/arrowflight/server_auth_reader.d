/// Module for [ServerAuthReader] class
module arrowflight.server_auth_reader;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class ServerAuthReader : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_server_auth_reader_get_type != &gidSymbolNotFound ? gaflight_server_auth_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ServerAuthReader self()
  {
    return this;
  }

  /**
  Get builder for [arrowflight.server_auth_reader.ServerAuthReader]
  Returns: New builder object
  */
  static ServerAuthReaderGidBuilder builder()
  {
    return new ServerAuthReaderGidBuilder;
  }

  /**
      Reads a message from the client.
      Returns: Read data as #GBytes on
          success, null on error.
      Throws: [ErrorWrap]
  */
  glib.bytes.Bytes read()
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = gaflight_server_auth_reader_read(cast(GAFlightServerAuthReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

class ServerAuthReaderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T reader(void* propval)
  {
    return setProperty("reader", propval);
  }
}

/// Fluent builder for [arrowflight.server_auth_reader.ServerAuthReader]
final class ServerAuthReaderGidBuilder : ServerAuthReaderGidBuilderImpl!ServerAuthReaderGidBuilder
{
  ServerAuthReader build()
  {
    return new ServerAuthReader(cast(void*)createGObject(ServerAuthReader._getGType), No.Take);
  }
}
