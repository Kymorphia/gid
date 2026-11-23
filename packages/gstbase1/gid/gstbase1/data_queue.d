/// Module for [DataQueue] class
module gid.gstbase1.data_queue;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

/**
    #GstDataQueue is an object that handles threadsafe queueing of objects. It
    also provides size-related functionality. This object should be used for
    any #GstElement that wishes to provide some sort of queueing functionality.
*/
class DataQueue : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_data_queue_get_type != &gidSymbolNotFound ? gst_data_queue_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDataQueue";
  }

  /** Returns `this`, for use in `with` statements. */
  override DataQueue self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstbase1.data_queue.DataQueue]
      Returns: New builder object
  */
  static DataQueueGidBuilder builder() nothrow
  {
    return new DataQueueGidBuilder;
  }

  /** */
  @property uint currentLevelBytes() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("current-level-bytes");
  }

  /** */
  @property ulong currentLevelTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("current-level-time");
  }

  /** */
  @property uint currentLevelVisible() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("current-level-visible");
  }

  /** */
  protected void vfuncEmpty()
  {
    auto _klass = cast(GstDataQueueClass*)_vfuncClass;
    if (!_klass.empty)
      return;

    _klass.empty(cast(GstDataQueue*)this._cPtr);
  }

  /** */
  protected void vfuncFull()
  {
    auto _klass = cast(GstDataQueueClass*)_vfuncClass;
    if (!_klass.full)
      return;

    _klass.full(cast(GstDataQueue*)this._cPtr);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from DataQueue
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstbase1.data_queue.DataQueue), T.stringof ~ " is not derived from gid.gstbase1.data_queue.DataQueue");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEmpty", true)[0]) == gid.gstbase1.data_queue.DataQueue))
      _installVfunc(klass, "empty");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFull", true)[0]) == gid.gstbase1.data_queue.DataQueue))
      _installVfunc(klass, "full");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstDataQueueClass*)klass;

    switch (vfunc)
    {
      case "empty":
      {
        static extern(C) void _vfuncEmptyTramp(GstDataQueue* queue) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.data_queue.DataQueue)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)queue);
          if (!_obj)
          {
            auto _klass = cast(GstDataQueueClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)queue);
            if (_klass.empty)
              return (cast(typeof(&_vfuncEmptyTramp))_klass.empty)(queue);
            return;
          }

          try
          {
            _obj.vfuncEmpty();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.data_queue.DataQueue.vfuncEmpty");
          }
        }

        _klass.empty = cast(typeof(_klass.empty))&_vfuncEmptyTramp;
        break;
      }
      case "full":
      {
        static extern(C) void _vfuncFullTramp(GstDataQueue* queue) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.data_queue.DataQueue)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)queue);
          if (!_obj)
          {
            auto _klass = cast(GstDataQueueClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)queue);
            if (_klass.full)
              return (cast(typeof(&_vfuncFullTramp))_klass.full)(queue);
            return;
          }

          try
          {
            _obj.vfuncFull();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.data_queue.DataQueue.vfuncFull");
          }
        }

        _klass.full = cast(typeof(_klass.full))&_vfuncFullTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstbase1.data_queue.DataQueue]
class DataQueueGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstbase1.data_queue.DataQueue]
final class DataQueueGidBuilder : DataQueueGidBuilderImpl!DataQueueGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DataQueue build() nothrow
  {
    return new DataQueue(cast(void*)createGObject(DataQueue._getGType), Yes.Take);
  }
}
