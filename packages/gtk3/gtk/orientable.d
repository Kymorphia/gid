/// Module for [Orientable] interface
module gtk.orientable;

public import gtk.orientable_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #GtkOrientable interface is implemented by all widgets that can be
    oriented horizontally or vertically. Historically, such widgets have been
    realized as subclasses of a common base class (e.g #GtkBox/#GtkHBox/#GtkVBox
    or #GtkScale/#GtkHScale/#GtkVScale). #GtkOrientable is more flexible in that
    it allows the orientation to be changed at runtime, allowing the widgets
    to “flip”.
    
    #GtkOrientable was introduced in GTK+ 2.16.
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
      Returns: the orientation of the orientable.
  */
  gtk.types.Orientation getOrientation();

  /**
      Sets the orientation of the orientable.
  
      Params:
        orientation = the orientable’s new orientation.
  */
  void setOrientation(gtk.types.Orientation orientation);
}

/// Fluent builder implementation template for [gtk.orientable.Orientable]
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
