/// Module for [RcStyle] class
module gid.gtk3.rc_style;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.scanner;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.settings;
import gid.gtk3.types;

/**
    The #GtkRcStyle-struct is used to represent a set
    of information about the appearance of a widget.
    This can later be composited together with other
    #GtkRcStyle-struct<!-- -->s to form a #GtkStyle.
*/
@gidGir("RcStyle", "RcStyleClass")
class RcStyle : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_rc_style_get_type != &gidSymbolNotFound ? gtk_rc_style_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRcStyle";
  }

  /** Returns `this`, for use in `with` statements. */
  override RcStyle self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.rc_style.RcStyle]
      Returns: New builder object
  */
  static RcStyleGidBuilder builder() nothrow
  {
    return new RcStyleGidBuilder;
  }

  /**
      Creates a new #GtkRcStyle with no fields set and
      a reference count of 1.
      Returns: the newly-created #GtkRcStyle
  
      Deprecated: Use #GtkCssProvider instead.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkRcStyle* _cretval;
      _cretval = gtk_rc_style_new();
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected void vfuncMerge(gid.gtk3.rc_style.RcStyle src)
  {
    auto _klass = cast(GtkRcStyleClass*)_vfuncClass;
    if (!_klass.merge)
      return;

    _klass.merge(cast(GtkRcStyle*)this._cPtr, src ? cast(GtkRcStyle*)src._cPtr(No.Dup) : null);
  }

  /** */
  protected uint vfuncParse(gid.gtk3.settings.Settings settings, gid.glib2.scanner.Scanner scanner)
  {
    auto _klass = cast(GtkRcStyleClass*)_vfuncClass;
    if (!_klass.parse)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.parse(cast(GtkRcStyle*)this._cPtr, settings ? cast(GtkSettings*)settings._cPtr(No.Dup) : null, scanner ? cast(GScanner*)scanner._cPtr : null);
    return _retval;
  }

  /**
      Makes a copy of the specified #GtkRcStyle. This function
      will correctly copy an RC style that is a member of a class
      derived from #GtkRcStyle.
      Returns: the resulting #GtkRcStyle
  
      Deprecated: Use #GtkCssProvider instead.
  */
  gid.gtk3.rc_style.RcStyle copy() nothrow
  {
    GtkRcStyle* _cretval;
    _cretval = gtk_rc_style_copy(cast(GtkRcStyle*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.rc_style.RcStyle)(cast(GtkRcStyle*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from RcStyle
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.rc_style.RcStyle), T.stringof ~ " is not derived from gid.gtk3.rc_style.RcStyle");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMerge", true)[0]) == gid.gtk3.rc_style.RcStyle))
      _installVfunc(klass, "merge");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncParse", true)[0]) == gid.gtk3.rc_style.RcStyle))
      _installVfunc(klass, "parse");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkRcStyleClass*)klass;

    switch (vfunc)
    {
      case "merge":
      {
        static extern(C) void _vfuncMergeTramp(GtkRcStyle* dest, GtkRcStyle* src) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.rc_style.RcStyle)(cast(void*)dest);
          if (!_obj)
          {
            auto _klass = cast(GtkRcStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)dest);
            if (_klass.merge)
              return (cast(typeof(&_vfuncMergeTramp))_klass.merge)(dest, src);
            return;
          }

          try
          {
            _obj.vfuncMerge(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.rc_style.RcStyle)(cast(void*)src, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.rc_style.RcStyle.vfuncMerge");
          }
        }

        _klass.merge = cast(typeof(_klass.merge))&_vfuncMergeTramp;
        break;
      }
      case "parse":
      {
        static extern(C) uint _vfuncParseTramp(GtkRcStyle* rcStyle, GtkSettings* settings, GScanner* scanner) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.rc_style.RcStyle)(cast(void*)rcStyle);
          if (!_obj)
          {
            auto _klass = cast(GtkRcStyleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)rcStyle);
            if (_klass.parse)
              return (cast(typeof(&_vfuncParseTramp))_klass.parse)(rcStyle, settings, scanner);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncParse(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.settings.Settings)(cast(void*)settings, No.Take), scanner ? new gid.glib2.scanner.Scanner(cast(void*)scanner, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.rc_style.RcStyle.vfuncParse");
          }
          return _retval;
        }

        _klass.parse = cast(typeof(_klass.parse))&_vfuncParseTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.rc_style.RcStyle]
class RcStyleGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk3.rc_style.RcStyle]
final class RcStyleGidBuilder : RcStyleGidBuilderImpl!RcStyleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RcStyle build() nothrow
  {
    return new RcStyle(cast(void*)createGObject(RcStyle._getGType), Yes.Take);
  }
}
