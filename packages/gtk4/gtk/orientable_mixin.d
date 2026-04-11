/// Module for [Orientable] interface mixin
module gtk.orientable_mixin;

public import gtk.orientable_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    The [gtk.orientable.Orientable] interface is implemented by all widgets that can be
    oriented horizontally or vertically.
    
    [gtk.orientable.Orientable] is more flexible in that it allows the orientation to be
    changed at runtime, allowing the widgets to “flip”.
    
    ## CSS nodes
    
    [gtk.widget.Widget] types implementing the [gtk.orientable.Orientable] interface will
    automatically acquire the `horizontal` or `vertical` CSS class depending on
    the value of the [gtk.orientable.Orientable.orientation] property.
*/
template OrientableT()
{

  /**
      Get `orientation` property.
      Returns: The orientation of the orientable.
  */
  @property gtk.types.Orientation orientation()
  {
    return getOrientation();
  }

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
  */
  @property void orientation(gtk.types.Orientation propval)
  {
    setOrientation(propval);
  }

  /**
      Retrieves the orientation of the orientable.
      Returns: the orientation of the orientable
  */
  override gtk.types.Orientation getOrientation()
  {
    GtkOrientation _cretval;
    _cretval = gtk_orientable_get_orientation(cast(GtkOrientable*)this._cPtr);
    gtk.types.Orientation _retval = cast(gtk.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Sets the orientation of the orientable.
  
      Params:
        orientation = the orientable’s new orientation
  */
  override void setOrientation(gtk.types.Orientation orientation)
  {
    gtk_orientable_set_orientation(cast(GtkOrientable*)this._cPtr, orientation);
  }
}

/// Fluent builder implementation template for [gtk.orientable.Orientable]
template OrientableGidBuilderT()
{

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
      Returns: Builder instance for fluent chaining
  */
  T orientation(gtk.types.Orientation propval)
  {
    return setProperty("orientation", propval);
  }
}
