/// Module for [Context] class
module gst.context;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gobject.object;
import gst.c.functions;
import gst.c.types;
import gst.structure;
import gst.task_pool;
import gst.types;

/**
    #GstContext is a container object used to store contexts like a device
    context, a display server connection and similar concepts that should
    be shared between multiple elements.
    
    Applications can set a context on a complete pipeline by using
    [gst.element.Element.setContext], which will then be propagated to all
    child elements. Elements can handle these in #GstElementClass::set_context
    and merge them with the context information they already have.
    
    When an element needs a context it will do the following actions in this
    order until one step succeeds:
    
    1. Check if the element already has a context
    2. Query downstream with [gst.types.QueryType.Context] for the context
    3. Query upstream with [gst.types.QueryType.Context] for the context
    4. Post a [gst.types.MessageType.NeedContext] message on the bus with the required
       context types and afterwards check if a usable context was set now
    5. Create a context by itself and post a [gst.types.MessageType.HaveContext] message
       on the bus.
    
    Bins will catch [gst.types.MessageType.NeedContext] messages and will set any previously
    known context on the element that asks for it if possible. Otherwise the
    application should provide one if it can.
    
    #GstContext can be persistent.
    A persistent #GstContext is kept in elements when they reach
    [gst.types.State.Null], non-persistent ones will be removed.
    Also, a non-persistent context won't override a previous persistent
    context set to an element.
*/
class Context : gobject.boxed.BoxedWrap!(gst_context_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Context self() nothrow
  {
    return this;
  }

  /**
      Creates a new context.
  
      Params:
        contextType = Context type
        persistent = Persistent context
      Returns: The new context.
  */
  this(string contextType, bool persistent) nothrow
  {
    GstContext* _cretval;
    const(char)* _contextType = contextType.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_context_new(_contextType, persistent);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a copy of the context. Returns a copy of the context.
      Returns: a new copy of context.
        
        MT safe
  */
  gst.context.Context copy() nothrow
  {
    GstContext* _cretval;
    _cretval = gst_context_copy(cast(const(GstContext)*)this._cPtr);
    auto _retval = _cretval ? new gst.context.Context(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the type of context.
      Returns: The type of the context.
  */
  string getContextType() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_context_get_context_type(cast(const(GstContext)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Accesses the structure of the context.
      Returns: The structure of the context. The structure is
        still owned by the context, which means that you should not modify it,
        free it and that the pointer becomes invalid when you free the context.
  */
  gst.structure.Structure getStructure() nothrow
  {
    const(GstStructure)* _cretval;
    _cretval = gst_context_get_structure(cast(const(GstContext)*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the task pool from context.
  
      Params:
        pool = a #GstTaskPool
      Returns: true if a task pool was set on context
  */
  bool getTaskPool(out gst.task_pool.TaskPool pool) nothrow
  {
    bool _retval;
    GstTaskPool* _pool;
    _retval = cast(bool)gst_context_get_task_pool(cast(GstContext*)this._cPtr, &_pool);
    pool = gobject.object.ObjectWrap._getDObject!(gst.task_pool.TaskPool)(_pool, Yes.Take);
    return _retval;
  }

  /**
      Checks if context has context_type.
  
      Params:
        contextType = Context type to check.
      Returns: true if context has context_type.
  */
  bool hasContextType(string contextType) nothrow
  {
    bool _retval;
    const(char)* _contextType = contextType.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_context_has_context_type(cast(const(GstContext)*)this._cPtr, _contextType);
    return _retval;
  }

  /**
      Checks if context is persistent.
      Returns: true if the context is persistent.
  */
  bool isPersistent() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_context_is_persistent(cast(const(GstContext)*)this._cPtr);
    return _retval;
  }

  /**
      Tests if you can safely modify context. It is only safe to modify context when
      there is only one owner of the context - ie, the object is writable.
      Returns: 
  */
  bool isWritable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_context_is_writable(cast(const(GstContext)*)this._cPtr);
    return _retval;
  }

  /**
      Returns a writable copy of context.
      
      If there is only one reference count on context, the caller must be the owner,
      and so this function will return the context object unchanged. If on the other
      hand there is more than one reference on the object, a new context object will
      be returned. The caller's reference on context will be removed, and instead the
      caller will own a reference to the returned object.
      
      In short, this function unrefs the context in the argument and refs the context
      that it returns. Don't access the argument after calling this function. See
      also: [gst.context.Context.ref_].
      Returns: a writable context which may or may not be the
            same as context
  */
  gst.context.Context makeWritable() nothrow
  {
    GstContext* _cretval;
    _cretval = gst_context_make_writable(cast(GstContext*)this._cPtr(Yes.Dup));
    auto _retval = _cretval ? new gst.context.Context(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets pool on context as the task pool to be shared between elements.
      If pool is null, any previously set task pool will be removed from
      the context.
  
      Params:
        pool = a #GstTaskPool or null to unset
  */
  void setTaskPool(gst.task_pool.TaskPool pool = null) nothrow
  {
    gst_context_set_task_pool(cast(GstContext*)this._cPtr, pool ? cast(GstTaskPool*)pool._cPtr(No.Dup) : null);
  }

  /**
      Gets a writable version of the structure.
      Returns: The structure of the context. The structure is still
        owned by the context, which means that you should not free it and
        that the pointer becomes invalid when you free the context.
        This function checks if context is writable.
  */
  gst.structure.Structure writableStructure() nothrow
  {
    GstStructure* _cretval;
    _cretval = gst_context_writable_structure(cast(GstContext*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Modifies a pointer to a #GstContext to point to a different #GstContext. The
      modification is done atomically (so this is useful for ensuring thread safety
      in some cases), and the reference counts are updated appropriately (the old
      context is unreffed, the new one is reffed).
      
      Either new_context or the #GstContext pointed to by old_context may be null.
  
      Params:
        oldContext = pointer to a pointer to a #GstContext
              to be replaced.
        newContext = pointer to a #GstContext that will
              replace the context pointed to by old_context.
      Returns: true if new_context was different from old_context
  */
  static bool replace(ref gst.context.Context oldContext, gst.context.Context newContext = null) nothrow
  {
    bool _retval;
    GstContext* _oldContext = oldContext ? cast(GstContext*)oldContext._cPtr(Yes.Dup) : null;
    _retval = cast(bool)gst_context_replace(&_oldContext, newContext ? cast(GstContext*)newContext._cPtr(No.Dup) : null);
    oldContext = _oldContext ? new gst.context.Context(cast(void*)_oldContext, Yes.Take) : null;
    return _retval;
  }
}
