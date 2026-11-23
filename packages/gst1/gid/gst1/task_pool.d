/// Module for [TaskPool] class
module gid.gst1.task_pool;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.object;
import gid.gst1.types;

/**
    This object provides an abstraction for creating threads. The default
    implementation uses a regular GThreadPool to start tasks.
    
    Subclasses can be made to create custom threads.
*/
class TaskPool : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_task_pool_get_type != &gidSymbolNotFound ? gst_task_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstTaskPool";
  }

  /** Returns `this`, for use in `with` statements. */
  override TaskPool self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.task_pool.TaskPool]
      Returns: New builder object
  */
  static TaskPoolGidBuilder builder() nothrow
  {
    return new TaskPoolGidBuilder;
  }

  /**
      Create a new default task pool. The default task pool will use a regular
      GThreadPool for threads.
      Returns: a new #GstTaskPool. [gid.gst1.object.ObjectWrap.unref] after usage.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GstTaskPool* _cretval;
      _cretval = gst_task_pool_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Wait for all tasks to be stopped. This is mainly used internally
      to ensure proper cleanup of internal data structures in test suites.
      
      MT safe.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCleanup` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncCleanup()
  {
    auto _klass = cast(GstTaskPoolClass*)_vfuncClass;
    if (!_klass.cleanup)
      return;

    _klass.cleanup(cast(GstTaskPool*)this._cPtr);
  }

  /**
      Dispose of the handle returned by [gid.gst1.task_pool.TaskPool.push]. This does
      not need to be called with the default implementation as the default
      #GstTaskPoolClass::push implementation always returns null. This does not need to be
      called either when calling [gid.gst1.task_pool.TaskPool.join], but should be called
      when joining is not necessary, but [gid.gst1.task_pool.TaskPool.push] returned a
      non-null value.
      
      This method should only be called with the same pool instance that provided
      id.
  
      Params:
        id = the id
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDisposeHandle` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDisposeHandle(void* id = null)
  {
    auto _klass = cast(GstTaskPoolClass*)_vfuncClass;
    if (!_klass.disposeHandle)
      return;

    _klass.disposeHandle(cast(GstTaskPool*)this._cPtr, id);
  }

  /**
      Join a task and/or return it to the pool. id is the id obtained from
      [gid.gst1.task_pool.TaskPool.push]. The default implementation does nothing, as the
      default #GstTaskPoolClass::push implementation always returns null.
      
      This method should only be called with the same pool instance that provided
      id.
  
      Params:
        id = the id
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncJoin` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncJoin(void* id = null)
  {
    auto _klass = cast(GstTaskPoolClass*)_vfuncClass;
    if (!_klass.join)
      return;

    _klass.join(cast(GstTaskPool*)this._cPtr, id);
  }

  /**
      Prepare the taskpool for accepting [gid.gst1.task_pool.TaskPool.push] operations.
      
      MT safe.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPrepare` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncPrepare()
  {
    auto _klass = cast(GstTaskPoolClass*)_vfuncClass;
    if (!_klass.prepare)
      return;

    GError *_err;
    _klass.prepare(cast(GstTaskPool*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
  }

  /**
      Start the execution of a new thread from pool.
  
      Params:
        func = the function to call
      Returns: a pointer that should be used
        for the gst_task_pool_join function. This pointer can be null, you
        must check error to detect errors. If the pointer is not null and
        [gid.gst1.task_pool.TaskPool.join] is not used, call [gid.gst1.task_pool.TaskPool.disposeHandle]
        instead.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPush` to chain up from an override.
      Overriding it from D is not supported (parameter 'func' of kind 'Callback' is not supported).
  */
  protected void* vfuncPush(gid.gst1.types.TaskPoolFunction func)
  {
    auto _klass = cast(GstTaskPoolClass*)_vfuncClass;
    if (!_klass.push)
      return typeof(return).init;

    extern(C) void _funcCallback(void* userData) nothrow
    {
      gidAttachThread();
      ptrThawGC(userData);
      auto _dlg = cast(gid.gst1.types.TaskPoolFunction*)userData;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.TaskPoolFunction");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GError *_err;
    auto _retval = _klass.push(cast(GstTaskPool*)this._cPtr, _funcCB, _func, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Wait for all tasks to be stopped. This is mainly used internally
      to ensure proper cleanup of internal data structures in test suites.
      
      MT safe.
  */
  void cleanup() nothrow
  {
    gst_task_pool_cleanup(cast(GstTaskPool*)this._cPtr);
  }

  /**
      Dispose of the handle returned by [gid.gst1.task_pool.TaskPool.push]. This does
      not need to be called with the default implementation as the default
      #GstTaskPoolClass::push implementation always returns null. This does not need to be
      called either when calling [gid.gst1.task_pool.TaskPool.join], but should be called
      when joining is not necessary, but [gid.gst1.task_pool.TaskPool.push] returned a
      non-null value.
      
      This method should only be called with the same pool instance that provided
      id.
  
      Params:
        id = the id
  */
  void disposeHandle(void* id = null) nothrow
  {
    gst_task_pool_dispose_handle(cast(GstTaskPool*)this._cPtr, id);
  }

  /**
      Join a task and/or return it to the pool. id is the id obtained from
      [gid.gst1.task_pool.TaskPool.push]. The default implementation does nothing, as the
      default #GstTaskPoolClass::push implementation always returns null.
      
      This method should only be called with the same pool instance that provided
      id.
  
      Params:
        id = the id
  */
  void join(void* id = null) nothrow
  {
    gst_task_pool_join(cast(GstTaskPool*)this._cPtr, id);
  }

  /**
      Prepare the taskpool for accepting [gid.gst1.task_pool.TaskPool.push] operations.
      
      MT safe.
      Throws: [ErrorWrap]
  */
  void prepare()
  {
    GError *_err;
    gst_task_pool_prepare(cast(GstTaskPool*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
  }

  /**
      Start the execution of a new thread from pool.
  
      Params:
        func = the function to call
      Returns: a pointer that should be used
        for the gst_task_pool_join function. This pointer can be null, you
        must check error to detect errors. If the pointer is not null and
        [gid.gst1.task_pool.TaskPool.join] is not used, call [gid.gst1.task_pool.TaskPool.disposeHandle]
        instead.
      Throws: [ErrorWrap]
  */
  void* push(gid.gst1.types.TaskPoolFunction func)
  {
    extern(C) void _funcCallback(void* userData) nothrow
    {
      gidAttachThread();
      ptrThawGC(userData);
      auto _dlg = cast(gid.gst1.types.TaskPoolFunction*)userData;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.TaskPoolFunction");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GError *_err;
    auto _retval = gst_task_pool_push(cast(GstTaskPool*)this._cPtr, _funcCB, _func, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from TaskPool
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gst1.task_pool.TaskPool), T.stringof ~ " is not derived from gid.gst1.task_pool.TaskPool");

    gid.gst1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCleanup", true)[0]) == gid.gst1.task_pool.TaskPool))
      _installVfunc(klass, "cleanup");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDisposeHandle", true)[0]) == gid.gst1.task_pool.TaskPool))
      _installVfunc(klass, "dispose_handle");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncJoin", true)[0]) == gid.gst1.task_pool.TaskPool))
      _installVfunc(klass, "join");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrepare", true)[0]) == gid.gst1.task_pool.TaskPool))
      _installVfunc(klass, "prepare");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPush", true)[0]) == gid.gst1.task_pool.TaskPool))
      static assert(0, "Overriding gid.gst1.task_pool.TaskPool.vfuncPush is not supported: parameter 'func' of kind 'Callback' is not supported");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstTaskPoolClass*)klass;

    switch (vfunc)
    {
      case "cleanup":
      {
        static extern(C) void _vfuncCleanupTramp(GstTaskPool* pool) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.task_pool.TaskPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstTaskPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.cleanup)
              return (cast(typeof(&_vfuncCleanupTramp))_klass.cleanup)(pool);
            return;
          }

          try
          {
            _obj.vfuncCleanup();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.task_pool.TaskPool.vfuncCleanup");
          }
        }

        _klass.cleanup = cast(typeof(_klass.cleanup))&_vfuncCleanupTramp;
        break;
      }
      case "dispose_handle":
      {
        static extern(C) void _vfuncDisposeHandleTramp(GstTaskPool* pool, void* id) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.task_pool.TaskPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstTaskPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.disposeHandle)
              return (cast(typeof(&_vfuncDisposeHandleTramp))_klass.disposeHandle)(pool, id);
            return;
          }

          try
          {
            _obj.vfuncDisposeHandle(id);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.task_pool.TaskPool.vfuncDisposeHandle");
          }
        }

        _klass.disposeHandle = cast(typeof(_klass.disposeHandle))&_vfuncDisposeHandleTramp;
        break;
      }
      case "join":
      {
        static extern(C) void _vfuncJoinTramp(GstTaskPool* pool, void* id) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.task_pool.TaskPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstTaskPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.join)
              return (cast(typeof(&_vfuncJoinTramp))_klass.join)(pool, id);
            return;
          }

          try
          {
            _obj.vfuncJoin(id);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.task_pool.TaskPool.vfuncJoin");
          }
        }

        _klass.join = cast(typeof(_klass.join))&_vfuncJoinTramp;
        break;
      }
      case "prepare":
      {
        static extern(C) void _vfuncPrepareTramp(GstTaskPool* pool, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.task_pool.TaskPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstTaskPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.prepare)
              return (cast(typeof(&_vfuncPrepareTramp))_klass.prepare)(pool, _err);
            return;
          }

          try
          {
            _obj.vfuncPrepare();
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
        }

        _klass.prepare = cast(typeof(_klass.prepare))&_vfuncPrepareTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gst1.task_pool.TaskPool]
class TaskPoolGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.task_pool.TaskPool]
final class TaskPoolGidBuilder : TaskPoolGidBuilderImpl!TaskPoolGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TaskPool build() nothrow
  {
    return new TaskPool(cast(void*)createGObject(TaskPool._getGType), Yes.Take);
  }
}
