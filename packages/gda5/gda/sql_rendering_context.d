/// Module for [SqlRenderingContext] class
module gda.sql_rendering_context;

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
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_rendering_context.SqlRenderingContext");

    _cInstance = *cast(GdaSqlRenderingContext*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `flags` field.
      Returns: Global rendering options
  */
  @property gda.types.StatementSqlFlag flags()
  {
    return cast(gda.types.StatementSqlFlag)(cast(GdaSqlRenderingContext*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = Global rendering options
  */
  @property void flags(gda.types.StatementSqlFlag propval)
  {
    (cast(GdaSqlRenderingContext*)this._cPtr).flags = cast(GdaStatementSqlFlag)propval;
  }

  /**
      Get `params` field.
      Returns: Parameters to be used while doing the rendering
  */
  @property gda.set.Set params()
  {
    return cToD!(gda.set.Set)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).params);
  }

  /**
      Set `params` field.
      Params:
        propval = Parameters to be used while doing the rendering
  */
  @property void params(gda.set.Set propval)
  {
    cValueFree!(gda.set.Set)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).params);
    dToC(propval, cast(void*)&(cast(GdaSqlRenderingContext*)this._cPtr).params);
  }

  /**
      Get `provider` field.
      Returns: Pointer to the server provider to be used
  */
  @property gda.server_provider.ServerProvider provider()
  {
    return cToD!(gda.server_provider.ServerProvider)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).provider);
  }

  /**
      Set `provider` field.
      Params:
        propval = Pointer to the server provider to be used
  */
  @property void provider(gda.server_provider.ServerProvider propval)
  {
    cValueFree!(gda.server_provider.ServerProvider)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).provider);
    dToC(propval, cast(void*)&(cast(GdaSqlRenderingContext*)this._cPtr).provider);
  }

  /**
      Get `cnc` field.
      Returns: Pointer to the connection to be used
  */
  @property gda.connection.Connection cnc()
  {
    return cToD!(gda.connection.Connection)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).cnc);
  }

  /**
      Set `cnc` field.
      Params:
        propval = Pointer to the connection to be used
  */
  @property void cnc(gda.connection.Connection propval)
  {
    cValueFree!(gda.connection.Connection)(cast(void*)(cast(GdaSqlRenderingContext*)this._cPtr).cnc);
    dToC(propval, cast(void*)&(cast(GdaSqlRenderingContext*)this._cPtr).cnc);
  }

  /**
      Get `renderValue` field.
      Returns: function to render a #GValue
  */
  @property GdaSqlRenderingValue renderValue()
  {
    return (cast(GdaSqlRenderingContext*)this._cPtr).renderValue;
  }

  /**
      Set `renderValue` field.
      Params:
        propval = function to render a #GValue
  */

  @property void renderValue(GdaSqlRenderingValue propval)
  {
    (cast(GdaSqlRenderingContext*)this._cPtr).renderValue = propval;
  }
}
