/// Module for [ProviderInfo] class
module gda.provider_info;

public import gid.basictypes;
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

  /**
      Create a `provider_info.ProviderInfo` wrap type.
      Params:
        id = the unique identifier of the database provider
        location = the complete path to the shared library implementing the database provider
        description = provider's description
        dsnParams = a #GdaSet containing all the parameters which can/must be specified when opening a connection or defining a named data source (DSN)
        authParams = a #GdaSet containing all the authentication parameters
  */
  this(string id = string.init, string location = string.init, string description = string.init, gda.set.Set dsnParams = gda.set.Set.init, gda.set.Set authParams = gda.set.Set.init) nothrow
  {
    this.id = id;
    this.location = location;
    this.description = description;
    this.dsnParams = dsnParams;
    this.authParams = authParams;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaProviderInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `id` field.
      Returns: the unique identifier of the database provider
  */
  @property string id() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).id);
  }

  /**
      Set `id` field.
      Params:
        propval = the unique identifier of the database provider
  */
  @property void id(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).id);
    dToC(propval, cast(void*)&(cast(GdaProviderInfo*)this._cPtr).id);
  }

  /**
      Get `location` field.
      Returns: the complete path to the shared library implementing the database provider
  */
  @property string location() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).location);
  }

  /**
      Set `location` field.
      Params:
        propval = the complete path to the shared library implementing the database provider
  */
  @property void location(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).location);
    dToC(propval, cast(void*)&(cast(GdaProviderInfo*)this._cPtr).location);
  }

  /**
      Get `description` field.
      Returns: provider's description
  */
  @property string description() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = provider's description
  */
  @property void description(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).description);
    dToC(propval, cast(void*)&(cast(GdaProviderInfo*)this._cPtr).description);
  }

  /**
      Get `dsnParams` field.
      Returns: a #GdaSet containing all the parameters which can/must be specified when opening a connection or defining a named data source (DSN)
  */
  @property gda.set.Set dsnParams() nothrow
  {
    return cToD!(gda.set.Set)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).dsnParams);
  }

  /**
      Set `dsnParams` field.
      Params:
        propval = a #GdaSet containing all the parameters which can/must be specified when opening a connection or defining a named data source (DSN)
  */
  @property void dsnParams(gda.set.Set propval) nothrow
  {
    cValueFree!(gda.set.Set)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).dsnParams);
    dToC(propval, cast(void*)&(cast(GdaProviderInfo*)this._cPtr).dsnParams);
  }

  /**
      Get `authParams` field.
      Returns: a #GdaSet containing all the authentication parameters
  */
  @property gda.set.Set authParams() nothrow
  {
    return cToD!(gda.set.Set)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).authParams);
  }

  /**
      Set `authParams` field.
      Params:
        propval = a #GdaSet containing all the authentication parameters
  */
  @property void authParams(gda.set.Set propval) nothrow
  {
    cValueFree!(gda.set.Set)(cast(void*)(cast(GdaProviderInfo*)this._cPtr).authParams);
    dToC(propval, cast(void*)&(cast(GdaProviderInfo*)this._cPtr).authParams);
  }
}
