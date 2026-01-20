/// Module for [ProviderInfo] class
module gda.provider_info;

import gda.c.functions;
import gda.c.types;
import gda.set;
import gda.types;
import gid.gid;

/**
    This structure holds the information associated to a database provider as discovered by Libgda.
*/
class ProviderInfo
{
  GdaProviderInfo _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.provider_info.ProviderInfo");

    _cInstance = *cast(GdaProviderInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `id` field.
      Returns: the unique identifier of the database provider
  */
  @property string id()
  {
    return cToD!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).id);
  }

  /**
      Set `id` field.
      Params:
        propval = the unique identifier of the database provider
  */
  @property void id(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).id);
    dToC(propval, cast(void*)&(cast(GdaProviderInfo*)this._cPtr).id);
  }

  /**
      Get `location` field.
      Returns: the complete path to the shared library implementing the database provider
  */
  @property string location()
  {
    return cToD!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).location);
  }

  /**
      Set `location` field.
      Params:
        propval = the complete path to the shared library implementing the database provider
  */
  @property void location(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).location);
    dToC(propval, cast(void*)&(cast(GdaProviderInfo*)this._cPtr).location);
  }

  /**
      Get `description` field.
      Returns: provider's description
  */
  @property string description()
  {
    return cToD!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = provider's description
  */
  @property void description(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).description);
    dToC(propval, cast(void*)&(cast(GdaProviderInfo*)this._cPtr).description);
  }

  /**
      Get `dsnParams` field.
      Returns: a #GdaSet containing all the parameters which can/must be specified when opening a connection or defining a named data source (DSN)
  */
  @property gda.set.Set dsnParams()
  {
    return cToD!(gda.set.Set)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).dsnParams);
  }

  /**
      Set `dsnParams` field.
      Params:
        propval = a #GdaSet containing all the parameters which can/must be specified when opening a connection or defining a named data source (DSN)
  */
  @property void dsnParams(gda.set.Set propval)
  {
    cValueFree!(gda.set.Set)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).dsnParams);
    dToC(propval, cast(void*)&(cast(GdaProviderInfo*)this._cPtr).dsnParams);
  }

  /**
      Get `authParams` field.
      Returns: a #GdaSet containing all the authentication parameters
  */
  @property gda.set.Set authParams()
  {
    return cToD!(gda.set.Set)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).authParams);
  }

  /**
      Set `authParams` field.
      Params:
        propval = a #GdaSet containing all the authentication parameters
  */
  @property void authParams(gda.set.Set propval)
  {
    cValueFree!(gda.set.Set)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).authParams);
    dToC(propval, cast(void*)&(cast(GdaProviderInfo*)this._cPtr).authParams);
  }
}
