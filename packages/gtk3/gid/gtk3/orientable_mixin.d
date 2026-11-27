/// Module for [Orientable] interface mixin
module gid.gtk3.orientable_mixin;

public import gid.core.basictypes;
public import gid.gtk3.orientable;
public import gid.gtk3.orientable_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.types;

/**
    The #GtkOrientable interface is implemented by all widgets that can be
    oriented horizontally or vertically. Historically, such widgets have been
    realized as subclasses of a common base class (e.g #GtkBox/#GtkHBox/#GtkVBox
    or #GtkScale/#GtkHScale/#GtkVScale). #GtkOrientable is more flexible in that
    it allows the orientation to be changed at runtime, allowing the widgets
    to “flip”.
    
    #GtkOrientable was introduced in GTK+ 2.16.
*/
template OrientableT()
{

  /**
      Get `orientation` property.
      Returns: The orientation of the orientable.
  */
  @property gid.gtk3.types.Orientation orientation() nothrow
  {
    return getOrientation();
  }

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
  */
  @property void orientation(gid.gtk3.types.Orientation propval) nothrow
  {
    setOrientation(propval);
  }

  /**
      Retrieves the orientation of the orientable.
      Returns: the orientation of the orientable.
  */
  override gid.gtk3.types.Orientation getOrientation() nothrow
  {
    GtkOrientation _cretval;
    _cretval = gtk_orientable_get_orientation(cast(GtkOrientable*)this._cPtr);
    gid.gtk3.types.Orientation _retval = cast(gid.gtk3.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Sets the orientation of the orientable.
  
      Params:
        orientation = the orientable’s new orientation.
  */
  override void setOrientation(gid.gtk3.types.Orientation orientation) nothrow
  {
    gtk_orientable_set_orientation(cast(GtkOrientable*)this._cPtr, orientation);
  }
}

/// Fluent builder implementation template for [gid.gtk3.orientable.Orientable]
template OrientableGidBuilderT()
{

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
      Returns: Builder instance for fluent chaining
  */
  T orientation(gid.gtk3.types.Orientation propval) nothrow
  {
    return setProperty("orientation", propval);
  }
}
