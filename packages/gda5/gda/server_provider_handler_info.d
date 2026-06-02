/// Module for [ServerProviderHandlerInfo] class
module gda.server_provider_handler_info;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.types;
import gid.gid;
import gobject.types;

/** */
class ServerProviderHandlerInfo
{
  GdaServerProviderHandlerInfo _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaServerProviderHandlerInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.connection.Connection cnc() nothrow
  {
    return cToD!(gda.connection.Connection)(cast(void*)(cast(GdaServerProviderHandlerInfo*)this._cPtr).cnc);
  }

  /** */
  @property void cnc(gda.connection.Connection propval) nothrow
  {
    cValueFree!(gda.connection.Connection)(cast(void*)(cast(GdaServerProviderHandlerInfo*)this._cPtr).cnc);
    dToC(propval, cast(void*)&(cast(GdaServerProviderHandlerInfo*)this._cPtr).cnc);
  }

  /** */
  @property gobject.types.GType gType() nothrow
  {
    return (cast(GdaServerProviderHandlerInfo*)this._cPtr).gType;
  }

  /** */
  @property void gType(gobject.types.GType propval) nothrow
  {
    (cast(GdaServerProviderHandlerInfo*)this._cPtr).gType = propval;
  }

  /** */
  @property string dbmsType() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaServerProviderHandlerInfo*)this._cPtr).dbmsType);
  }

  /** */
  @property void dbmsType(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdaServerProviderHandlerInfo*)this._cPtr).dbmsType);
    dToC(propval, cast(void*)&(cast(GdaServerProviderHandlerInfo*)this._cPtr).dbmsType);
  }
}
