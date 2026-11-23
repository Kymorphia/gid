/// Module for [GLBaseMemoryAllocator] class
module gid.gstgl1.glbase_memory_allocator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.allocator;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glallocation_params;
import gid.gstgl1.glbase_memory;
import gid.gstgl1.types;

/**
    Opaque #GstGLBaseMemoryAllocator struct
*/
class GLBaseMemoryAllocator : gid.gst1.allocator.Allocator
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
    return cast(void function())gst_gl_base_memory_allocator_get_type != &gidSymbolNotFound ? gst_gl_base_memory_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLBaseMemoryAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseMemoryAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator]
      Returns: New builder object
  */
  static GLBaseMemoryAllocatorGidBuilder builder() nothrow
  {
    return new GLBaseMemoryAllocatorGidBuilder;
  }

  alias vfuncAlloc = gid.gst1.allocator.Allocator.vfuncAlloc;

  /**
      a #GstGLBaseMemoryAllocatorAllocFunction
  
      Params:
        params = the #GstGLAllocationParams to allocate the memory with (modified in place, changes are seen by the caller)
      Returns: a newly allocated #GstGLBaseMemory from allocator and params
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAlloc` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gstgl1.glbase_memory.GLBaseMemory vfuncAlloc(gid.gstgl1.glallocation_params.GLAllocationParams params)
  {
    auto _klass = cast(GstGLBaseMemoryAllocatorClass*)_vfuncClass;
    if (!_klass.alloc)
      return typeof(return).init;

    GstGLBaseMemory* _cretval;
    _cretval = _klass.alloc(cast(GstGLBaseMemoryAllocator*)this._cPtr, params ? cast(GstGLAllocationParams*)params._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gstgl1.glbase_memory.GLBaseMemory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from GLBaseMemoryAllocator
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator), T.stringof ~ " is not derived from gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator");

    gid.gst1.allocator.Allocator._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAlloc", true)[0]) == gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator))
      _installVfunc(klass, "alloc");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstGLBaseMemoryAllocatorClass*)klass;

    switch (vfunc)
    {
      case "alloc":
      {
        static extern(C) GstGLBaseMemory* _vfuncAllocTramp(GstGLBaseMemoryAllocator* allocator, GstGLAllocationParams* params) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)allocator);
          if (!_obj)
          {
            auto _klass = cast(GstGLBaseMemoryAllocatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)allocator);
            if (_klass.alloc)
              return (cast(typeof(&_vfuncAllocTramp))_klass.alloc)(allocator, params);
            return typeof(return).init;
          }

          gid.gstgl1.glbase_memory.GLBaseMemory _dretval;
          auto _params = params ? new gid.gstgl1.glallocation_params.GLAllocationParams(cast(void*)params, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncAlloc(_params);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator.vfuncAlloc");
          }
          auto _retval = _dretval ? cast(GstGLBaseMemory*)_dretval._cPtr(Yes.Dup) : null;
          if (_params)
            _params._cUnborrow;

          return _retval;
        }

        _klass.alloc = cast(typeof(_klass.alloc))&_vfuncAllocTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator]
class GLBaseMemoryAllocatorGidBuilderImpl(T) : gid.gst1.allocator.AllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator]
final class GLBaseMemoryAllocatorGidBuilder : GLBaseMemoryAllocatorGidBuilderImpl!GLBaseMemoryAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLBaseMemoryAllocator build() nothrow
  {
    return new GLBaseMemoryAllocator(cast(void*)createGObject(GLBaseMemoryAllocator._getGType), Yes.Take);
  }
}
