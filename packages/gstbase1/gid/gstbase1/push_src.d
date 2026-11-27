/// Module for [PushSrc] class
module gid.gstbase1.push_src;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.types;
import gid.gstbase1.base_src;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

/**
    This class is mostly useful for elements that cannot do
    random access, or at least very slowly. The source usually
    prefers to push out a fixed size buffer.
    
    Subclasses usually operate in a format that is different from the
    default GST_FORMAT_BYTES format of #GstBaseSrc.
    
    Classes extending this base class will usually be scheduled
    in a push based mode. If the peer accepts to operate without
    offsets and within the limits of the allowed block size, this
    class can operate in getrange based mode automatically. To make
    this possible, the subclass should implement and override the
    SCHEDULING query.
    
    The subclass should extend the methods from the baseclass in
    addition to the ::create method.
    
    Seeking, flushing, scheduling and sync is all handled by this
    base class.
*/
@gidGir("PushSrc", "PushSrcClass")
class PushSrc : gid.gstbase1.base_src.BaseSrc
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
    return cast(void function())gst_push_src_get_type != &gidSymbolNotFound ? gst_push_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstPushSrc";
  }

  /** Returns `this`, for use in `with` statements. */
  override PushSrc self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstbase1.push_src.PushSrc]
      Returns: New builder object
  */
  static PushSrcGidBuilder builder() nothrow
  {
    return new PushSrcGidBuilder;
  }

  alias vfuncAlloc = gid.gstbase1.base_src.BaseSrc.vfuncAlloc;

  /**
      Allocate memory for a buffer.
  
      Params:
        buf = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAlloc` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncAlloc(out gid.gst1.buffer.Buffer buf)
  {
    auto _klass = cast(GstPushSrcClass*)_vfuncClass;
    if (!_klass.alloc)
      return typeof(return).init;

    GstFlowReturn _cretval;
    GstBuffer* _buf;
    _cretval = _klass.alloc(cast(GstPushSrc*)this._cPtr, &_buf);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_buf)
      buf = new gid.gst1.buffer.Buffer(cast(void*)_buf, Yes.Take);
    return _retval;
  }

  alias vfuncCreate = gid.gstbase1.base_src.BaseSrc.vfuncCreate;

  /**
      Ask the subclass to create a buffer, the default implementation will call alloc if
      no allocated buf is provided and then call fill.
  
      Params:
        buf = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCreate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncCreate(ref gid.gst1.buffer.Buffer buf)
  {
    auto _klass = cast(GstPushSrcClass*)_vfuncClass;
    if (!_klass.create)
      return typeof(return).init;

    GstFlowReturn _cretval;
    GstBuffer* _buf = buf ? cast(GstBuffer*)buf._cPtr(Yes.Dup) : null;
    _cretval = _klass.create(cast(GstPushSrc*)this._cPtr, &_buf);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    buf = _buf ? new gid.gst1.buffer.Buffer(cast(void*)_buf, Yes.Take) : null;
    return _retval;
  }

  alias vfuncFill = gid.gstbase1.base_src.BaseSrc.vfuncFill;

  /**
      Ask the subclass to fill the buffer with data.
  
      Params:
        buf =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFill` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncFill(gid.gst1.buffer.Buffer buf)
  {
    auto _klass = cast(GstPushSrcClass*)_vfuncClass;
    if (!_klass.fill)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.fill(cast(GstPushSrc*)this._cPtr, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from PushSrc
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstbase1.push_src.PushSrc), T.stringof ~ " is not derived from gid.gstbase1.push_src.PushSrc");

    gid.gstbase1.base_src.BaseSrc._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAlloc", true)[0]) == gid.gstbase1.push_src.PushSrc))
      _installVfunc(klass, "alloc");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreate", true)[0]) == gid.gstbase1.push_src.PushSrc))
      _installVfunc(klass, "create");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFill", true)[0]) == gid.gstbase1.push_src.PushSrc))
      _installVfunc(klass, "fill");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstPushSrcClass*)klass;

    switch (vfunc)
    {
      case "alloc":
      {
        static extern(C) GstFlowReturn _vfuncAllocTramp(GstPushSrc* src, GstBuffer** buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.push_src.PushSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstPushSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.alloc)
              return (cast(typeof(&_vfuncAllocTramp))_klass.alloc)(src, buf);
            return typeof(return).init;
          }

          typeof(*buf) _bufNull;
          if (!buf)
            buf = &_bufNull;

          gid.gst1.types.FlowReturn _dretval;
          gid.gst1.buffer.Buffer _buf;

          try
          {
            _dretval = _obj.vfuncAlloc(_buf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.push_src.PushSrc.vfuncAlloc");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          *buf = _buf ? cast(GstBuffer*)_buf._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.alloc = cast(typeof(_klass.alloc))&_vfuncAllocTramp;
        break;
      }
      case "create":
      {
        static extern(C) GstFlowReturn _vfuncCreateTramp(GstPushSrc* src, GstBuffer** buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.push_src.PushSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstPushSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.create)
              return (cast(typeof(&_vfuncCreateTramp))_klass.create)(src, buf);
            return typeof(return).init;
          }

          typeof(*buf) _bufNull;
          if (!buf)
            buf = &_bufNull;

          gid.gst1.types.FlowReturn _dretval;
          auto _buf = *buf ? new gid.gst1.buffer.Buffer(cast(void*)*buf, Yes.Take) : null;

          try
          {
            _dretval = _obj.vfuncCreate(_buf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.push_src.PushSrc.vfuncCreate");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          *buf = _buf ? cast(GstBuffer*)_buf._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.create = cast(typeof(_klass.create))&_vfuncCreateTramp;
        break;
      }
      case "fill":
      {
        static extern(C) GstFlowReturn _vfuncFillTramp(GstPushSrc* src, GstBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstbase1.push_src.PushSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstPushSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.fill)
              return (cast(typeof(&_vfuncFillTramp))_klass.fill)(src, buf);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _buf = buf ? new gid.gst1.buffer.Buffer(cast(void*)buf, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncFill(_buf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.push_src.PushSrc.vfuncFill");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_buf)
            _buf._cUnborrow;

          return _retval;
        }

        _klass.fill = cast(typeof(_klass.fill))&_vfuncFillTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstbase1.push_src.PushSrc]
class PushSrcGidBuilderImpl(T) : gid.gstbase1.base_src.BaseSrcGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstbase1.push_src.PushSrc]
final class PushSrcGidBuilder : PushSrcGidBuilderImpl!PushSrcGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PushSrc build() nothrow
  {
    return new PushSrc(cast(void*)createGObject(PushSrc._getGType), Yes.Take);
  }
}
