/// Module for [Orientable] interface
module gid.gtk3.orientable;

public import gid.core.basictypes;
public import gid.gtk3.orientable_iface_proxy;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    The #GtkOrientable interface is implemented by all widgets that can be
    oriented horizontally or vertically. Historically, such widgets have been
    realized as subclasses of a common base class (e.g #GtkBox/#GtkHBox/#GtkVBox
    or #GtkScale/#GtkHScale/#GtkVScale). #GtkOrientable is more flexible in that
    it allows the orientation to be changed at runtime, allowing the widgets
    to “flip”.
    
    #GtkOrientable was introduced in GTK+ 2.16.
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
  @property gid.gtk3.types.Orientation orientation() nothrow;

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
  */
  @property void orientation(gid.gtk3.types.Orientation propval) nothrow;

  /**
      Retrieves the orientation of the orientable.
      Returns: the orientation of the orientable.
  */
  gid.gtk3.types.Orientation getOrientation();

  /**
      Sets the orientation of the orientable.
  
      Params:
        orientation = the orientable’s new orientation.
  */
  void setOrientation(gid.gtk3.types.Orientation orientation);
}

/// Fluent builder implementation template for [gid.gtk3.orientable.Orientable]
interface OrientableGidBuilderImpl(T)
{

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the orientable.
      Returns: Builder instance for fluent chaining
  */
  T orientation(gid.gtk3.types.Orientation propval) nothrow;
}
