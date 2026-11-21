/// Module for [Buildable] interface
module gid.gtk4.buildable;

public import gid.core.basictypes;
public import gid.gtk4.buildable_iface_proxy;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Allows objects to extend and customize deserialization from ui files.
    
    The [gid.gtk4.buildable.Buildable] interface includes methods for setting names and
    properties of objects, parsing custom tags and constructing child objects.
    
    It is implemented by all widgets and many of the non-widget objects that are
    provided by GTK. The main user of this interface is [gid.gtk4.builder.Builder].
    There should be very little need for applications to call any of these
    functions directly.
    
    An object only needs to implement this interface if it needs to extend the
    [gid.gtk4.builder.Builder] XML format or run any extra routines at deserialization time.
*/
interface Buildable : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_buildable_get_type != &gidSymbolNotFound ? gtk_buildable_get_type() : cast(GType)0;
  }

  /**
      Gets the ID of the buildable object.
      
      [gid.gtk4.builder.Builder] sets the name based on the ID attribute
      of the `<object>` tag used to construct the buildable.
      Returns: the ID of the buildable object
  */
  string getBuildableId();
}

/// Fluent builder implementation template for [gid.gtk4.buildable.Buildable]
interface BuildableGidBuilderImpl(T)
{
}
