/// Module for [Closure] class
module gid.gobject2.closure;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gobject2.value;

/**
    A [gid.gobject2.closure.Closure] represents a callback supplied by the programmer.
    
    It will generally comprise a function of some kind and a marshaller
    used to call it. It is the responsibility of the marshaller to
    convert the arguments for the invocation from [GValues][gid.gobject2.value.Value] into
    a suitable form, perform the callback on the converted arguments,
    and transform the return value back into a [gid.gobject2.value.Value].
    
    In the case of C programs, a closure usually just holds a pointer
    to a function and maybe a data argument, and the marshaller
    converts between [gid.gobject2.value.Value] and native C types. The GObject
    library provides the [gid.gobject2.cclosure.CClosure] type for this purpose. Bindings for
    other languages need marshallers which convert between [GValues][gid.gobject2.value.Value]
    and suitable representations in the runtime of the language in
    order to use functions written in that language as callbacks. Use
    [gid.gobject2.closure.Closure.setMarshal] to set the marshaller on such a custom
    closure implementation.
    
    Within GObject, closures play an important role in the
    implementation of signals. When a signal is registered, the
    @c_marshaller argument to `func@signal_new` specifies the default C
    marshaller for any closure which is connected to this
    signal. GObject provides a number of C marshallers for this
    purpose, see the `g_cclosure_marshal_*()` functions. Additional C
    marshallers can be generated with the [glib-genmarshal][glib-genmarshal]
    utility.  Closures can be explicitly connected to signals with
    `func@signal_connect_closure`, but it usually more convenient to let
    GObject create a closure automatically by using one of the
    `g_signal_connect_*()` functions which take a callback function/user
    data pair.
    
    Using closures has a number of important advantages over a simple
    callback function/data pointer combination:
    
    - Closures allow the callee to get the types of the callback parameters,
      which means that language bindings don't have to write individual glue
      for each callback type.
    
    - The reference counting of [gid.gobject2.closure.Closure] makes it easy to handle reentrancy
      right; if a callback is removed while it is being invoked, the closure
      and its parameters won't be freed until the invocation finishes.
    
    - [gid.gobject2.closure.Closure.invalidate] and invalidation notifiers allow callbacks to be
      automatically removed when the objects they point to go away.
*/
class Closure : gid.gobject2.boxed.BoxedWrap!(g_closure_get_type)
{
  /**
      Create a `closure.Closure` boxed type.
      Params:
        inMarshal = Indicates whether the closure is currently being invoked with
            [gid.gobject2.closure.Closure.invoke]
        isInvalid = Indicates whether the closure has been invalidated by
            [gid.gobject2.closure.Closure.invalidate]
  */
  this(uint inMarshal = uint.init, uint isInvalid = uint.init) nothrow
  {
    super(boxedNew!GClosure(_getGType), Yes.Take);
    this.inMarshal = inMarshal;
    this.isInvalid = isInvalid;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Closure self() nothrow
  {
    return this;
  }

  /**
      Get `inMarshal` field.
      Returns: Indicates whether the closure is currently being invoked with
          [gid.gobject2.closure.Closure.invoke]
  */
  @property uint inMarshal() nothrow
  {
    return (cast(GClosure*)this._cPtr).inMarshal;
  }

  /**
      Set `inMarshal` field.
      Params:
        propval = Indicates whether the closure is currently being invoked with
            [gid.gobject2.closure.Closure.invoke]
  */
  @property void inMarshal(uint propval) nothrow
  {
    (cast(GClosure*)this._cPtr).inMarshal = propval;
  }

  /**
      Get `isInvalid` field.
      Returns: Indicates whether the closure has been invalidated by
          [gid.gobject2.closure.Closure.invalidate]
  */
  @property uint isInvalid() nothrow
  {
    return (cast(GClosure*)this._cPtr).isInvalid;
  }

  /**
      Set `isInvalid` field.
      Params:
        propval = Indicates whether the closure has been invalidated by
            [gid.gobject2.closure.Closure.invalidate]
  */
  @property void isInvalid(uint propval) nothrow
  {
    (cast(GClosure*)this._cPtr).isInvalid = propval;
  }

  /** Function alias for field `marshal` */
  alias MarshalFuncType = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData);

  /** */
  @property MarshalFuncType marshal() nothrow
  {
    return (cast(GClosure*)this._cPtr).marshal;
  }

  /**
      A variant of [gid.gobject2.closure.Closure.newSimple] which stores object in the
      data field of the closure and calls [gid.gobject2.object.ObjectWrap.watchClosure] on
      object and the created closure. This function is mainly useful
      when implementing new types of closures.
  
      Params:
        sizeofClosure = the size of the structure to allocate, must be at least
           `sizeof (GClosure)`
        object = a #GObject pointer to store in the data field of the newly
           allocated #GClosure
      Returns: a newly allocated #GClosure
  */
  static gid.gobject2.closure.Closure newObject(uint sizeofClosure, gid.gobject2.object.ObjectWrap object) nothrow
  {
    GClosure* _cretval;
    _cretval = g_closure_new_object(sizeofClosure, object ? cast(GObject*)object._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gobject2.closure.Closure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Allocates a struct of the given size and initializes the initial
      part as a #GClosure.
      
      This function is mainly useful when implementing new types of closures:
      
      ```c
      typedef struct _MyClosure MyClosure;
      struct _MyClosure
      {
        GClosure closure;
        // extra data goes here
      };
      
      static void
      my_closure_finalize (gpointer  notify_data,
                           GClosure *closure)
      {
        MyClosure *my_closure = (MyClosure *)closure;
      
        // free extra data here
      }
      
      MyClosure *my_closure_new (gpointer data)
      {
        GClosure *closure;
        MyClosure *my_closure;
      
        closure = g_closure_new_simple (sizeof (MyClosure), data);
        my_closure = (MyClosure *) closure;
      
        // initialize extra data here
      
        g_closure_add_finalize_notifier (closure, notify_data,
                                         my_closure_finalize);
        return my_closure;
      }
      ```
  
      Params:
        sizeofClosure = the size of the structure to allocate, must be at least
                           `sizeof (GClosure)`
        data = data to store in the data field of the newly allocated #GClosure
      Returns: a floating reference to a new #GClosure
  */
  static gid.gobject2.closure.Closure newSimple(uint sizeofClosure, void* data = null) nothrow
  {
    GClosure* _cretval;
    _cretval = g_closure_new_simple(sizeofClosure, data);
    auto _retval = _cretval ? new gid.gobject2.closure.Closure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets a flag on the closure to indicate that its calling
      environment has become invalid, and thus causes any future
      invocations of [gid.gobject2.closure.Closure.invoke] on this closure to be
      ignored.
      
      Also, invalidation notifiers installed on the closure will
      be called at this point. Note that unless you are holding a
      reference to the closure yourself, the invalidation notifiers may
      unref the closure and cause it to be destroyed, so if you need to
      access the closure after calling [gid.gobject2.closure.Closure.invalidate], make sure
      that you've previously called [gid.gobject2.closure.Closure.ref_].
      
      Note that [gid.gobject2.closure.Closure.invalidate] will also be called when the
      reference count of a closure drops to zero (unless it has already
      been invalidated before).
  */
  void invalidate() nothrow
  {
    g_closure_invalidate(cast(GClosure*)this._cPtr);
  }

  /**
      Invokes the closure, i.e. executes the callback represented by the closure.
  
      Params:
        returnValue = a #GValue to store the return
                         value. May be null if the callback of closure
                         doesn't return a value.
        paramValues = an array of
                         #GValues holding the arguments on which to
                         invoke the callback of closure
        invocationHint = a context-dependent invocation hint
  */
  void invoke(out gid.gobject2.value.Value returnValue, gid.gobject2.value.Value[] paramValues, void* invocationHint = null) nothrow
  {
    auto _returnValue = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    uint _nParamValues;
    if (paramValues)
      _nParamValues = cast(uint)paramValues.length;

    auto _paramValues_arr = new GValue[](paramValues.length);
    auto _paramValues = _paramValues_arr.ptr;
    foreach (i, obj; paramValues) _paramValues[i] = obj ? *cast(GValue*)obj._cPtr(No.Dup) : GValue.init;
    g_closure_invoke(cast(GClosure*)this._cPtr, _returnValue, _nParamValues, _paramValues, invocationHint);
    returnValue = new gid.gobject2.value.Value(cast(void*)_returnValue, Yes.Take);
  }

  /**
      Takes over the initial ownership of a closure.
      
      Each closure is initially created in a "floating" state, which means
      that the initial reference count is not owned by any caller.
      
      This function checks to see if the object is still floating, and if so,
      unsets the floating state and decreases the reference count. If the
      closure is not floating, [gid.gobject2.closure.Closure.sink] does nothing.
      
      The reason for the existence of the floating state is to prevent
      cumbersome code sequences like:
      
      ```c
      closure = g_cclosure_new (cb_func, cb_data);
      g_source_set_closure (source, closure);
      g_closure_unref (closure); // GObject doesn't really need this
      ```
      
      Because [gid.gobject2.global.sourceSetClosure] (and similar functions) take ownership of the
      initial reference count, if it is unowned, we instead can write:
      
      ```c
      g_source_set_closure (source, g_cclosure_new (cb_func, cb_data));
      ```
      
      Generally, this function is used together with [gid.gobject2.closure.Closure.ref_]. An example
      of storing a closure for later notification looks like:
      
      ```c
      static GClosure *notify_closure = NULL;
      void
      foo_notify_set_closure (GClosure *closure)
      {
        if (notify_closure)
          g_closure_unref (notify_closure);
        notify_closure = closure;
        if (notify_closure)
          {
            g_closure_ref (notify_closure);
            g_closure_sink (notify_closure);
          }
      }
      ```
      
      Because [gid.gobject2.closure.Closure.sink] may decrement the reference count of a closure
      (if it hasn't been called on closure yet) just like [gid.gobject2.closure.Closure.unref],
      [gid.gobject2.closure.Closure.ref_] should be called prior to this function.
  */
  void sink() nothrow
  {
    g_closure_sink(cast(GClosure*)this._cPtr);
  }
}
