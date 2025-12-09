/// Module for [ParamSpecPool] class
module gobject.param_spec_pool;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;

/**
    A #GParamSpecPool maintains a collection of #GParamSpecs which can be
    quickly accessed by owner and name.
    
    The implementation of the #GObject property system uses such a pool to
    store the #GParamSpecs of the properties all object types.
*/
class ParamSpecPool
{
  GParamSpecPool* cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.param_spec_pool.ParamSpecPool");

    cInstancePtr = cast(GParamSpecPool*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /**
      Inserts a #GParamSpec in the pool.
  
      Params:
        pspec = the #GParamSpec to insert
        ownerType = a #GType identifying the owner of pspec
  */
  void insert(gobject.param_spec.ParamSpec pspec, gobject.types.GType ownerType)
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
  gobject.param_spec.ParamSpec[] list(gobject.types.GType ownerType)
  {
    GParamSpec** _cretval;
    uint _cretlength;
    _cretval = g_param_spec_pool_list(cast(GParamSpecPool*)this._cPtr, ownerType, &_cretlength);
    gobject.param_spec.ParamSpec[] _retval;

    if (_cretval)
    {
      _retval = new gobject.param_spec.ParamSpec[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gobject.param_spec.ParamSpec(cast(void*)_cretval[i], No.Take);
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
  gobject.param_spec.ParamSpec[] listOwned(gobject.types.GType ownerType)
  {
    GList* _cretval;
    _cretval = g_param_spec_pool_list_owned(cast(GParamSpecPool*)this._cPtr, ownerType);
    auto _retval = gListToD!(gobject.param_spec.ParamSpec, GidOwnership.Container)(cast(GList*)_cretval);
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
  gobject.param_spec.ParamSpec lookup(string paramName, gobject.types.GType ownerType, bool walkAncestors)
  {
    GParamSpec* _cretval;
    const(char)* _paramName = paramName.toCString(No.Alloc);
    _cretval = g_param_spec_pool_lookup(cast(GParamSpecPool*)this._cPtr, _paramName, ownerType, walkAncestors);
    auto _retval = _cretval ? new gobject.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Removes a #GParamSpec from the pool.
  
      Params:
        pspec = the #GParamSpec to remove
  */
  void remove(gobject.param_spec.ParamSpec pspec)
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
  this(bool typePrefixing)
  {
    GParamSpecPool* _cretval;
    _cretval = g_param_spec_pool_new(typePrefixing);
    this(_cretval, Yes.Take);
  }
}
