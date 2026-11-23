/// Module for [CellAccessible] class
module gid.gtk3.cell_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.object;
import gid.atk1.table_cell;
import gid.atk1.table_cell_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.accessible;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/** */
class CellAccessible : gid.gtk3.accessible.Accessible, gid.atk1.action.Action, gid.atk1.component.Component, gid.atk1.table_cell.TableCell
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
    return cast(void function())gtk_cell_accessible_get_type != &gidSymbolNotFound ? gtk_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.cell_accessible.CellAccessible]
      Returns: New builder object
  */
  static CellAccessibleGidBuilder builder() nothrow
  {
    return new CellAccessibleGidBuilder;
  }

  mixin ActionT!();
  mixin ComponentT!();
  mixin TableCellT!();
  alias getDescription = gid.atk1.object.ObjectWrap.getDescription;
  alias getName = gid.atk1.object.ObjectWrap.getName;
  alias setDescription = gid.atk1.object.ObjectWrap.setDescription;

  /** */
  protected void vfuncUpdateCache(bool emitSignal)
  {
    auto _klass = cast(GtkCellAccessibleClass*)_vfuncClass;
    if (!_klass.updateCache)
      return;

    _klass.updateCache(cast(GtkCellAccessible*)this._cPtr, emitSignal);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from CellAccessible
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.cell_accessible.CellAccessible), T.stringof ~ " is not derived from gid.gtk3.cell_accessible.CellAccessible");

    gid.gtk3.accessible.Accessible._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUpdateCache", true)[0]) == gid.gtk3.cell_accessible.CellAccessible))
      _installVfunc(klass, "update_cache");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkCellAccessibleClass*)klass;

    switch (vfunc)
    {
      case "update_cache":
      {
        static extern(C) void _vfuncUpdateCacheTramp(GtkCellAccessible* cell, gboolean emitSignal) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.cell_accessible.CellAccessible)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cell);
          if (!_obj)
          {
            auto _klass = cast(GtkCellAccessibleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cell);
            if (_klass.updateCache)
              return (cast(typeof(&_vfuncUpdateCacheTramp))_klass.updateCache)(cell, emitSignal);
            return;
          }

          try
          {
            _obj.vfuncUpdateCache(cast(bool)emitSignal);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.cell_accessible.CellAccessible.vfuncUpdateCache");
          }
        }

        _klass.updateCache = cast(typeof(_klass.updateCache))&_vfuncUpdateCacheTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_accessible.CellAccessible]
class CellAccessibleGidBuilderImpl(T) : gid.gtk3.accessible.AccessibleGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T, gid.atk1.component.ComponentGidBuilderImpl!T, gid.atk1.table_cell.TableCellGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin ComponentGidBuilderT!();
  mixin TableCellGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.cell_accessible.CellAccessible]
final class CellAccessibleGidBuilder : CellAccessibleGidBuilderImpl!CellAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellAccessible build() nothrow
  {
    return new CellAccessible(cast(void*)createGObject(CellAccessible._getGType), Yes.Take);
  }
}
