/// Module for [DsnInfo] class
module gda.dsn_info;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.boxed;

/**
    This structure defines the properties of a named data source (DSN).
*/
class DsnInfo : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_dsn_info_get_type != &gidSymbolNotFound ? gda_dsn_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DsnInfo self()
  {
    return this;
  }

  /**
      Get `name` field.
      Returns: the (unique) name of the DSN (plain text, not RFC 1738 encoded)
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GdaDsnInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = the (unique) name of the DSN (plain text, not RFC 1738 encoded)
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaDsnInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GdaDsnInfo*)this._cPtr).name);
  }

  /**
      Get `provider` field.
      Returns: the ID of the database provider to be used (plain text, not RFC 1738 encoded)
  */
  @property string provider()
  {
    return cToD!(string)(cast(void*)(cast(GdaDsnInfo*)this._cPtr).provider);
  }

  /**
      Set `provider` field.
      Params:
        propval = the ID of the database provider to be used (plain text, not RFC 1738 encoded)
  */
  @property void provider(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaDsnInfo*)this._cPtr).provider);
    dToC(propval, cast(void*)&(cast(GdaDsnInfo*)this._cPtr).provider);
  }

  /**
      Get `description` field.
      Returns: a descriptive string (plain text, not RFC 1738 encoded), can be null.
  */
  @property string description()
  {
    return cToD!(string)(cast(void*)(cast(GdaDsnInfo*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = a descriptive string (plain text, not RFC 1738 encoded), can be null.
  */
  @property void description(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaDsnInfo*)this._cPtr).description);
    dToC(propval, cast(void*)&(cast(GdaDsnInfo*)this._cPtr).description);
  }

  /**
      Get `cncString` field.
      Returns: the connection string, a semi-colon separated &lt;key>=&lt;value&gt; list where &lt;key&gt; and &lt;value&gt; are RFC 1738 encoded
  */
  @property string cncString()
  {
    return cToD!(string)(cast(void*)(cast(GdaDsnInfo*)this._cPtr).cncString);
  }

  /**
      Set `cncString` field.
      Params:
        propval = the connection string, a semi-colon separated &lt;key>=&lt;value&gt; list where &lt;key&gt; and &lt;value&gt; are RFC 1738 encoded
  */
  @property void cncString(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaDsnInfo*)this._cPtr).cncString);
    dToC(propval, cast(void*)&(cast(GdaDsnInfo*)this._cPtr).cncString);
  }

  /**
      Get `authString` field.
      Returns: the authentication string, a semi-colon separated &lt;key>=&lt;value&gt; list where &lt;key&gt; and &lt;value&gt; are RFC 1738 encoded. Can be null.
  */
  @property string authString()
  {
    return cToD!(string)(cast(void*)(cast(GdaDsnInfo*)this._cPtr).authString);
  }

  /**
      Set `authString` field.
      Params:
        propval = the authentication string, a semi-colon separated &lt;key>=&lt;value&gt; list where &lt;key&gt; and &lt;value&gt; are RFC 1738 encoded. Can be null.
  */
  @property void authString(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaDsnInfo*)this._cPtr).authString);
    dToC(propval, cast(void*)&(cast(GdaDsnInfo*)this._cPtr).authString);
  }

  /**
      Get `isSystem` field.
      Returns: true if the DSN is a system wide defined data source
  */
  @property bool isSystem()
  {
    return cast(bool)(cast(GdaDsnInfo*)this._cPtr).isSystem;
  }

  /**
      Set `isSystem` field.
      Params:
        propval = true if the DSN is a system wide defined data source
  */
  @property void isSystem(bool propval)
  {
    (cast(GdaDsnInfo*)this._cPtr).isSystem = propval;
  }

  /**
      Creates a new #GdaDsnInfo struct.
      Returns: a new #GdaDsnInfo struct.
  */
  this()
  {
    GdaDsnInfo* _cretval;
    _cretval = gda_dsn_info_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copy constructor.
      Returns: a new #GdaDsnInfo
  */
  gda.dsn_info.DsnInfo copy()
  {
    GdaDsnInfo* _cretval;
    _cretval = gda_dsn_info_copy(cast(GdaDsnInfo*)this._cPtr);
    auto _retval = _cretval ? new gda.dsn_info.DsnInfo(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
