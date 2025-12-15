/// Module for [Context] class
module gst.context;

import gid.gid;
import gobject.boxed;
import gst.c.functions;
import gst.c.types;
import gst.structure;
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
class Context : gobject.boxed.Boxed
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
    return cast(void function())gst_context_get_type != &gidSymbolNotFound ? gst_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Context self()
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
  this(string contextType, bool persistent)
  {
    GstContext* _cretval;
    const(char)* _contextType = contextType.toCString(No.Alloc);
    _cretval = gst_context_new(_contextType, persistent);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the type of context.
      Returns: The type of the context.
  */
  string getContextType()
  {
    const(char)* _cretval;
    _cretval = gst_context_get_context_type(cast(const(GstContext)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Accesses the structure of the context.
      Returns: The structure of the context. The structure is
        still owned by the context, which means that you should not modify it,
        free it and that the pointer becomes invalid when you free the context.
  */
  gst.structure.Structure getStructure()
  {
    const(GstStructure)* _cretval;
    _cretval = gst_context_get_structure(cast(const(GstContext)*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks if context has context_type.
  
      Params:
        contextType = Context type to check.
      Returns: true if context has context_type.
  */
  bool hasContextType(string contextType)
  {
    bool _retval;
    const(char)* _contextType = contextType.toCString(No.Alloc);
    _retval = cast(bool)gst_context_has_context_type(cast(const(GstContext)*)this._cPtr, _contextType);
    return _retval;
  }

  /**
      Checks if context is persistent.
      Returns: true if the context is persistent.
  */
  bool isPersistent()
  {
    bool _retval;
    _retval = cast(bool)gst_context_is_persistent(cast(const(GstContext)*)this._cPtr);
    return _retval;
  }

  /**
      Gets a writable version of the structure.
      Returns: The structure of the context. The structure is still
        owned by the context, which means that you should not free it and
        that the pointer becomes invalid when you free the context.
        This function checks if context is writable.
  */
  gst.structure.Structure writableStructure()
  {
    GstStructure* _cretval;
    _cretval = gst_context_writable_structure(cast(GstContext*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
