/// Module for [Orientable] interface
module gtk.orientable;

public import gtk.orientable_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

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
interface Orientable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_orientable_get_type != &gidSymbolNotFound ? gtk_orientable_get_type() : cast(GType)0;
  }

  /**
      Get `orientation` property.
      Returns: The orientation of the orientable.
  */
  @property gtk.types.Orientation orientation();

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
  */
  @property void orientation(gtk.types.Orientation propval);

  /**
      Retrieves the orientation of the orientable.
      Returns: the orientation of the orientable
  */
  gtk.types.Orientation getOrientation();

  /**
      Sets the orientation of the orientable.
  
      Params:
        orientation = the orientable’s new orientation
  */
  void setOrientation(gtk.types.Orientation orientation);
}

interface OrientableGidBuilderImpl(T)
{

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
      Returns: Builder instance for fluent chaining
  */
  T orientation(gtk.types.Orientation propval);
}
