/// Module for [ParamSpecPool] class
module gid.gobject2.param_spec_pool;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.param_spec;
import gid.gobject2.types;

/**
    A #GParamSpecPool maintains a collection of #GParamSpecs which can be
    quickly accessed by owner and name.
    
    The implementation of the #GObject property system uses such a pool to
    store the #GParamSpecs of the properties all object types.
*/
@gidGir("ParamSpecPool")
class ParamSpecPool : OpaqueWrap!(GParamSpecPool*, void, void)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Inserts a #GParamSpec in the pool.
  
      Params:
        pspec = the #GParamSpec to insert
        ownerType = a #GType identifying the owner of pspec
  */
  void insert(gid.gobject2.param_spec.ParamSpec pspec, gid.gobject2.types.GType ownerType) nothrow
  {
    g_param_spec_pool_insert(cast(GParamSpecPool*)this._cPtr, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, ownerType);
  }

  /**
      Gets an array of all #GParamSpecs owned by owner_type in
      the pool.
  
      Params:
        ownerType = the owner to look for
      Returns: a newly
                 allocated array containing pointers to all #GParamSpecs
                 owned by owner_type in the pool
  */
  gid.gobject2.param_spec.ParamSpec[] list(gid.gobject2.types.GType ownerType) nothrow
  {
    GParamSpec** _cretval;
    uint _cretlength;
    _cretval = g_param_spec_pool_list(cast(GParamSpecPool*)this._cPtr, ownerType, &_cretlength);
    gid.gobject2.param_spec.ParamSpec[] _retval;

    if (_cretval)
    {
      _retval = new gid.gobject2.param_spec.ParamSpec[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gid.gobject2.param_spec.ParamSpec(cast(void*)_cretval[i], No.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets an #GList of all #GParamSpecs owned by owner_type in
      the pool.
  
      Params:
        ownerType = the owner to look for
      Returns: a
                 #GList of all #GParamSpecs owned by owner_type in
                 the pool#GParamSpecs.
  */
  gid.gobject2.param_spec.ParamSpec[] listOwned(gid.gobject2.types.GType ownerType) nothrow
  {
    GList* _cretval;
    _cretval = g_param_spec_pool_list_owned(cast(GParamSpecPool*)this._cPtr, ownerType);
    auto _retval = gListToD!(gid.gobject2.param_spec.ParamSpec, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Looks up a #GParamSpec in the pool.
  
      Params:
        paramName = the name to look for
        ownerType = the owner to look for
        walkAncestors = If true, also try to find a #GParamSpec with param_name
           owned by an ancestor of owner_type.
      Returns: The found #GParamSpec, or null if no
        matching #GParamSpec was found.
  */
  gid.gobject2.param_spec.ParamSpec lookup(string paramName, gid.gobject2.types.GType ownerType, bool walkAncestors) nothrow
  {
    GParamSpec* _cretval;
    const(char)* _paramName = paramName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_param_spec_pool_lookup(cast(GParamSpecPool*)this._cPtr, _paramName, ownerType, walkAncestors);
    auto _retval = _cretval ? new gid.gobject2.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Removes a #GParamSpec from the pool.
  
      Params:
        pspec = the #GParamSpec to remove
  */
  void remove(gid.gobject2.param_spec.ParamSpec pspec) nothrow
  {
    g_param_spec_pool_remove(cast(GParamSpecPool*)this._cPtr, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
  }

  /**
      Creates a new #GParamSpecPool.
      
      If type_prefixing is true, lookups in the newly created pool will
      allow to specify the owner as a colon-separated prefix of the
      property name, like "GtkContainer:border-width". This feature is
      deprecated, so you should always set type_prefixing to false.
  
      Params:
        typePrefixing = Whether the pool will support type-prefixed property names.
      Returns: a newly allocated #GParamSpecPool.
  */
  this(bool typePrefixing) nothrow
  {
    GParamSpecPool* _cretval;
    _cretval = g_param_spec_pool_new(typePrefixing);
    this(_cretval, Yes.Take);
  }
}
