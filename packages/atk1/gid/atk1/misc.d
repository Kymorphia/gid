/// Module for [Misc] class
module gid.atk1.misc;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A set of ATK utility functions for thread locking
    
    A set of utility functions for thread locking. This interface and
    all his related methods are deprecated since 2.12.
*/
class Misc : gid.gobject2.object.ObjectWrap
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
    return cast(void function())atk_misc_get_type != &gidSymbolNotFound ? atk_misc_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkMisc";
  }

  /** Returns `this`, for use in `with` statements. */
  override Misc self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.misc.Misc]
      Returns: New builder object
  */
  static MiscGidBuilder builder() nothrow
  {
    return new MiscGidBuilder;
  }

  /**
      Obtain the singleton instance of AtkMisc for this application.
      Returns: The singleton instance of AtkMisc for this application.
  
      Deprecated: Since 2.12.
  */
  static gid.atk1.misc.Misc getInstance() nothrow
  {
    const(AtkMisc)* _cretval;
    _cretval = atk_misc_get_instance();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.misc.Misc)(cast(AtkMisc*)_cretval, No.Take);
    return _retval;
  }

  /**
      Take the thread mutex for the GUI toolkit,
      if one exists.
      (This method is implemented by the toolkit ATK implementation layer;
       for instance, for GTK+, GAIL implements this via GDK_THREADS_ENTER).
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncThreadsEnter` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Since 2.12.
  */
  protected void vfuncThreadsEnter()
  {
    auto _klass = cast(AtkMiscClass*)_vfuncClass;
    if (!_klass.threadsEnter)
      return;

    _klass.threadsEnter(cast(AtkMisc*)this._cPtr);
  }

  /**
      Release the thread mutex for the GUI toolkit,
      if one exists. This method, and atk_misc_threads_enter,
      are needed in some situations by threaded application code which
      services ATK requests, since fulfilling ATK requests often
      requires calling into the GUI toolkit.  If a long-running or
      potentially blocking call takes place inside such a block, it should
      be bracketed by atk_misc_threads_leave/atk_misc_threads_enter calls.
      (This method is implemented by the toolkit ATK implementation layer;
       for instance, for GTK+, GAIL implements this via GDK_THREADS_LEAVE).
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncThreadsLeave` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Since 2.12.
  */
  protected void vfuncThreadsLeave()
  {
    auto _klass = cast(AtkMiscClass*)_vfuncClass;
    if (!_klass.threadsLeave)
      return;

    _klass.threadsLeave(cast(AtkMisc*)this._cPtr);
  }

  /**
      Take the thread mutex for the GUI toolkit,
      if one exists.
      (This method is implemented by the toolkit ATK implementation layer;
       for instance, for GTK+, GAIL implements this via GDK_THREADS_ENTER).
  
      Deprecated: Since 2.12.
  */
  void threadsEnter() nothrow
  {
    atk_misc_threads_enter(cast(AtkMisc*)this._cPtr);
  }

  /**
      Release the thread mutex for the GUI toolkit,
      if one exists. This method, and atk_misc_threads_enter,
      are needed in some situations by threaded application code which
      services ATK requests, since fulfilling ATK requests often
      requires calling into the GUI toolkit.  If a long-running or
      potentially blocking call takes place inside such a block, it should
      be bracketed by atk_misc_threads_leave/atk_misc_threads_enter calls.
      (This method is implemented by the toolkit ATK implementation layer;
       for instance, for GTK+, GAIL implements this via GDK_THREADS_LEAVE).
  
      Deprecated: Since 2.12.
  */
  void threadsLeave() nothrow
  {
    atk_misc_threads_leave(cast(AtkMisc*)this._cPtr);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Misc
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.atk1.misc.Misc), T.stringof ~ " is not derived from gid.atk1.misc.Misc");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncThreadsEnter", true)[0]) == gid.atk1.misc.Misc))
      _installVfunc(klass, "threads_enter");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncThreadsLeave", true)[0]) == gid.atk1.misc.Misc))
      _installVfunc(klass, "threads_leave");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(AtkMiscClass*)klass;

    switch (vfunc)
    {
      case "threads_enter":
      {
        static extern(C) void _vfuncThreadsEnterTramp(AtkMisc* misc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.misc.Misc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)misc);
          if (!_obj)
          {
            auto _klass = cast(AtkMiscClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)misc);
            if (_klass.threadsEnter)
              return (cast(typeof(&_vfuncThreadsEnterTramp))_klass.threadsEnter)(misc);
            return;
          }

          try
          {
            _obj.vfuncThreadsEnter();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.misc.Misc.vfuncThreadsEnter");
          }
        }

        _klass.threadsEnter = cast(typeof(_klass.threadsEnter))&_vfuncThreadsEnterTramp;
        break;
      }
      case "threads_leave":
      {
        static extern(C) void _vfuncThreadsLeaveTramp(AtkMisc* misc) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.misc.Misc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)misc);
          if (!_obj)
          {
            auto _klass = cast(AtkMiscClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)misc);
            if (_klass.threadsLeave)
              return (cast(typeof(&_vfuncThreadsLeaveTramp))_klass.threadsLeave)(misc);
            return;
          }

          try
          {
            _obj.vfuncThreadsLeave();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.misc.Misc.vfuncThreadsLeave");
          }
        }

        _klass.threadsLeave = cast(typeof(_klass.threadsLeave))&_vfuncThreadsLeaveTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.misc.Misc]
class MiscGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.atk1.misc.Misc]
final class MiscGidBuilder : MiscGidBuilderImpl!MiscGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Misc build() nothrow
  {
    return new Misc(cast(void*)createGObject(Misc._getGType), Yes.Take);
  }
}
