/// Module for [Orientable] interface
module gid.gtk4.orientable;

public import gid.core.basictypes;
public import gid.gtk4.orientable_iface_proxy;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    An interface for widgets that can be oriented horizontally or vertically.
    
    [gid.gtk4.orientable.Orientable] is more flexible in that it allows the orientation to be
    changed at runtime, allowing the widgets to “flip”.
    
    ## CSS nodes
    
    [gid.gtk4.widget.Widget] types implementing the [gid.gtk4.orientable.Orientable] interface will
    automatically acquire the `horizontal` or `vertical` CSS class depending on
    the value of the [gid.gtk4.orientable.Orientable.orientation] property.
*/
interface Orientable : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_orientable_get_type != &gidSymbolNotFound ? gtk_orientable_get_type() : cast(GType)0;
  }

  /**
      Get `orientation` property.
      Returns: The orientation of the orientable.
  */
  @property gid.gtk4.types.Orientation orientation() nothrow;

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
  */
  @property void orientation(gid.gtk4.types.Orientation propval) nothrow;

  /**
      Retrieves the orientation of the orientable.
      Returns: the orientation of the orientable
  */
  gid.gtk4.types.Orientation getOrientation();

  /**
      Sets the orientation of the orientable.
  
      Params:
        orientation = the orientable’s new orientation
  */
  void setOrientation(gid.gtk4.types.Orientation orientation);
}

/// Fluent builder implementation template for [gid.gtk4.orientable.Orientable]
interface OrientableGidBuilderImpl(T)
{

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
      Returns: Builder instance for fluent chaining
  */
  T orientation(gid.gtk4.types.Orientation propval) nothrow;
}
