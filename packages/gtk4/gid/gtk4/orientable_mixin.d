/// Module for [Orientable] interface mixin
module gid.gtk4.orientable_mixin;

public import gid.core.basictypes;
public import gid.gtk4.orientable_iface_proxy;
public import gid.core.gid;
public import gid.gobject2.gid_builder;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    An interface for widgets that can be oriented horizontally or vertically.
    
    [gid.gtk4.orientable.Orientable] is more flexible in that it allows the orientation to be
    changed at runtime, allowing the widgets to “flip”.
    
    ## CSS nodes
    
    [gid.gtk4.widget.Widget] types implementing the [gid.gtk4.orientable.Orientable] interface will
    automatically acquire the `horizontal` or `vertical` CSS class depending on
    the value of the [gid.gtk4.orientable.Orientable.orientation] property.
*/
template OrientableT()
{

  /**
      Get `orientation` property.
      Returns: The orientation of the orientable.
  */
  @property gid.gtk4.types.Orientation orientation() nothrow
  {
    return getOrientation();
  }

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
  */
  @property void orientation(gid.gtk4.types.Orientation propval) nothrow
  {
    setOrientation(propval);
  }

  /**
      Retrieves the orientation of the orientable.
      Returns: the orientation of the orientable
  */
  override gid.gtk4.types.Orientation getOrientation() nothrow
  {
    GtkOrientation _cretval;
    _cretval = gtk_orientable_get_orientation(cast(GtkOrientable*)this._cPtr);
    gid.gtk4.types.Orientation _retval = cast(gid.gtk4.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Sets the orientation of the orientable.
  
      Params:
        orientation = the orientable’s new orientation
  */
  override void setOrientation(gid.gtk4.types.Orientation orientation) nothrow
  {
    gtk_orientable_set_orientation(cast(GtkOrientable*)this._cPtr, orientation);
  }
}

/// Fluent builder implementation template for [gid.gtk4.orientable.Orientable]
template OrientableGidBuilderT()
{

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
      Returns: Builder instance for fluent chaining
  */
  T orientation(gid.gtk4.types.Orientation propval) nothrow
  {
    return setProperty("orientation", propval);
  }
}
