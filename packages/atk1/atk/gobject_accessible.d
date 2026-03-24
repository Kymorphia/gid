/// Module for [GObjectAccessible] class
module atk.gobject_accessible;

import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    This object class is derived from AtkObject and can be used as a basis implementing accessible objects.
    
    This object class is derived from AtkObject. It can be used as a
    basis for implementing accessible objects for GObjects which are
    not derived from GtkWidget. One example of its use is in providing
    an accessible object for GnomeCanvasItem in the GAIL library.
*/
class GObjectAccessible : atk.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_gobject_accessible_get_type != &gidSymbolNotFound ? atk_gobject_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GObjectAccessible self()
  {
    return this;
  }

  /**
  Get builder for [atk.gobject_accessible.GObjectAccessible]
  Returns: New builder object
  */
  static GObjectAccessibleGidBuilder builder()
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
  static atk.object.ObjectWrap forObject(gobject.object.ObjectWrap obj)
  {
    AtkObject* _cretval;
    _cretval = atk_gobject_accessible_for_object(obj ? cast(GObject*)obj._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the GObject for which obj is the accessible object.
      Returns: a #GObject which is the object for which obj is
        the accessible object
  */
  gobject.object.ObjectWrap getObject()
  {
    GObject* _cretval;
    _cretval = atk_gobject_accessible_get_object(cast(AtkGObjectAccessible*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }
}

class GObjectAccessibleGidBuilderImpl(T) : atk.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [atk.gobject_accessible.GObjectAccessible]
final class GObjectAccessibleGidBuilder : GObjectAccessibleGidBuilderImpl!GObjectAccessibleGidBuilder
{
  GObjectAccessible build()
  {
    return new GObjectAccessible(cast(void*)createGObject(GObjectAccessible._getGType), No.Take);
  }
}
