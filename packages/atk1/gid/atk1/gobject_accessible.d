/// Module for [GObjectAccessible] class
module gid.atk1.gobject_accessible;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.object;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    This object class is derived from AtkObject and can be used as a basis implementing accessible objects.
    
    This object class is derived from AtkObject. It can be used as a
    basis for implementing accessible objects for GObjects which are
    not derived from GtkWidget. One example of its use is in providing
    an accessible object for GnomeCanvasItem in the GAIL library.
*/
class GObjectAccessible : gid.atk1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())atk_gobject_accessible_get_type != &gidSymbolNotFound ? atk_gobject_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkGObjectAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override GObjectAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.gobject_accessible.GObjectAccessible]
      Returns: New builder object
  */
  static GObjectAccessibleGidBuilder builder() nothrow
  {
    return new GObjectAccessibleGidBuilder;
  }

  /**
      Gets the accessible object for the specified obj.
  
      Params:
        obj = a #GObject
      Returns: a #AtkObject which is the accessible object for
        the obj
  */
  static gid.atk1.object.ObjectWrap forObject(gid.gobject2.object.ObjectWrap obj) nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_gobject_accessible_for_object(obj ? cast(GObject*)obj._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the GObject for which obj is the accessible object.
      Returns: a #GObject which is the object for which obj is
        the accessible object
  */
  gid.gobject2.object.ObjectWrap getObject() nothrow
  {
    GObject* _cretval;
    _cretval = atk_gobject_accessible_get_object(cast(AtkGObjectAccessible*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.atk1.gobject_accessible.GObjectAccessible]
class GObjectAccessibleGidBuilderImpl(T) : gid.atk1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.atk1.gobject_accessible.GObjectAccessible]
final class GObjectAccessibleGidBuilder : GObjectAccessibleGidBuilderImpl!GObjectAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GObjectAccessible build() nothrow
  {
    return new GObjectAccessible(cast(void*)createGObject(GObjectAccessible._getGType), Yes.Take);
  }
}
