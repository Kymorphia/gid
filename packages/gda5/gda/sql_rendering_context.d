/// Module for [SqlRenderingContext] class
module gda.sql_rendering_context;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.server_provider;
import gda.set;
import gda.types;
import gid.gid;

/**
    Specifies the context in which a #GdaSqlStatement is being converted to SQL.
*/
class SqlRenderingContext
{
  GdaSqlRenderingContext _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlRenderingContext*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `flags` field.
      Returns: Global rendering options
  */
  @property gda.types.StatementSqlFlag flags() nothrow
  {
    return cast(gda.types.StatementSqlFlag)(cast(GdaSqlRenderingContext*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = Global rendering options
  */
  @property void flags(gda.types.StatementSqlFlag propval) nothrow
  {
    (cast(GdaSqlRenderingContext*)this._cPtr).flags = cast(GdaStatementSqlFlag)propval;
  }

  /**
      Get `params` field.
      Returns: Parameters to be used while doing the rendering
  */
  @property gda.set.Set params() nothrow
  {
    return cToD!(gda.set.Set)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).params);
  }

  /**
      Set `params` field.
      Params:
        propval = Parameters to be used while doing the rendering
  */
  @property void params(gda.set.Set propval) nothrow
  {
    cValueFree!(gda.set.Set)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).params);
    dToC(propval, cast(void*)&(cast(GdaSqlRenderingContext*)this._cPtr).params);
  }

  /**
      Get `provider` field.
      Returns: Pointer to the server provider to be used
  */
  @property gda.server_provider.ServerProvider provider() nothrow
  {
    return cToD!(gda.server_provider.ServerProvider)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).provider);
  }

  /**
      Set `provider` field.
      Params:
        propval = Pointer to the server provider to be used
  */
  @property void provider(gda.server_provider.ServerProvider propval) nothrow
  {
    cValueFree!(gda.server_provider.ServerProvider)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).provider);
    dToC(propval, cast(void*)&(cast(GdaSqlRenderingContext*)this._cPtr).provider);
  }

  /**
      Get `cnc` field.
      Returns: Pointer to the connection to be used
  */
  @property gda.connection.Connection cnc() nothrow
  {
    return cToD!(gda.connection.Connection)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).cnc);
  }

  /**
      Set `cnc` field.
      Params:
        propval = Pointer to the connection to be used
  */
  @property void cnc(gda.connection.Connection propval) nothrow
  {
    cValueFree!(gda.connection.Connection)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).cnc);
    dToC(propval, cast(void*)&(cast(GdaSqlRenderingContext*)this._cPtr).cnc);
  }

  /**
      Get `renderValue` field.
      Returns: function to render a #GValue
  */
  @property GdaSqlRenderingValue renderValue() nothrow
  {
    return (cast(GdaSqlRenderingContext*)this._cPtr).renderValue;
  }

  /**
      Set `renderValue` field.
      Params:
        propval = function to render a #GValue
  */

  @property void renderValue(GdaSqlRenderingValue propval) nothrow
  {
    (cast(GdaSqlRenderingContext*)this._cPtr).renderValue = propval;
  }
}
