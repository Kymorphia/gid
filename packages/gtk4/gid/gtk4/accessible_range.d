/// Module for [AccessibleRange] interface
module gid.gtk4.accessible_range;

public import gid.core.basictypes;
public import gid.gtk4.accessible_range_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    An interface for accessible objects containing a numeric value.
    
    [gid.gtk4.accessible_range.AccessibleRange] describes ranged controls for Assistive Technologies.
    
    Ranged controls have a single value within an allowed range that can
    optionally be changed by the user.
    
    This interface is expected to be implemented by controls using the
    following roles:
    
    - [gid.gtk4.types.AccessibleRole.Meter]
    - [gid.gtk4.types.AccessibleRole.ProgressBar]
    - [gid.gtk4.types.AccessibleRole.Scrollbar]
    - [gid.gtk4.types.AccessibleRole.Slider]
    - [gid.gtk4.types.AccessibleRole.SpinButton]
    
    If that is not the case, a warning will be issued at run time.
    
    In addition to this interface, its implementers are expected to provide the
    correct values for the following properties:
    
    - [gid.gtk4.types.AccessibleProperty.ValueMax]
    - [gid.gtk4.types.AccessibleProperty.ValueMin]
    - [gid.gtk4.types.AccessibleProperty.ValueNow]
    - [gid.gtk4.types.AccessibleProperty.ValueText]
*/
@gidGir("AccessibleRange", "AccessibleRangeInterface")
interface AccessibleRange : gid.gtk4.accessible.Accessible
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_range_get_type != &gidSymbolNotFound ? gtk_accessible_range_get_type() : cast(GType)0;
  }

}

/// Fluent builder implementation template for [gid.gtk4.accessible_range.AccessibleRange]
interface AccessibleRangeGidBuilderImpl(T) : gid.gtk4.accessible.AccessibleGidBuilderImpl!T
{
}
