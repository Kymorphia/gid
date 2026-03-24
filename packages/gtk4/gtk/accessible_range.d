/// Module for [AccessibleRange] interface
module gtk.accessible_range;

public import gtk.accessible_range_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    This interface describes ranged controls, e.g. controls which have a single
    value within an allowed range and that can optionally be changed by the user.
    
    This interface is expected to be implemented by controls using the following
    roles:
    
    $(LIST
      * [gtk.types.AccessibleRole.Meter]
      * [gtk.types.AccessibleRole.ProgressBar]
      * [gtk.types.AccessibleRole.Scrollbar]
      * [gtk.types.AccessibleRole.Slider]
      * [gtk.types.AccessibleRole.SpinButton]
    )
      
    If that is not the case, a warning will be issued at run time.
    
    In addition to this interface, its implementers are expected to provide the
    correct values for the following properties:
    
    $(LIST
      * [gtk.types.AccessibleProperty.ValueMax]
      * [gtk.types.AccessibleProperty.ValueMin]
      * [gtk.types.AccessibleProperty.ValueNow]
      * [gtk.types.AccessibleProperty.ValueText]
    )
*/
interface AccessibleRange
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_range_get_type != &gidSymbolNotFound ? gtk_accessible_range_get_type() : cast(GType)0;
  }
}

interface AccessibleRangeGidBuilderImpl(T)
{
}
