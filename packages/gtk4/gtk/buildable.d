/// Module for [Buildable] interface
module gtk.buildable;

public import gtk.buildable_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.buildable.Buildable] allows objects to extend and customize their deserialization
    from ui files.
    
    The interface includes methods for setting names and properties of objects,
    parsing custom tags and constructing child objects.
    
    The [gtk.buildable.Buildable] interface is implemented by all widgets and
    many of the non-widget objects that are provided by GTK. The
    main user of this interface is [gtk.builder.Builder]. There should be
    very little need for applications to call any of these functions directly.
    
    An object only needs to implement this interface if it needs to extend the
    [gtk.builder.Builder] XML format or run any extra routines at deserialization time.
*/
interface Buildable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_buildable_get_type != &gidSymbolNotFound ? gtk_buildable_get_type() : cast(GType)0;
  }

  /**
      Gets the ID of the buildable object.
      
      [gtk.builder.Builder] sets the name based on the ID attribute
      of the `<object>` tag used to construct the buildable.
      Returns: the ID of the buildable object
  */
  string getBuildableId();
}

/// Fluent builder implementation template for [gtk.buildable.Buildable]
interface BuildableGidBuilderImpl(T)
{
}
