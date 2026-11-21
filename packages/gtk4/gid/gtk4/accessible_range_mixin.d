/// Module for [AccessibleRange] interface mixin
module gid.gtk4.accessible_range_mixin;

public import gid.core.basictypes;
public import gid.gtk4.accessible_range_iface_proxy;
public import gid.core.gid;
public import gid.gobject2.gid_builder;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

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
template AccessibleRangeT()
{
}

/// Fluent builder implementation template for [gid.gtk4.accessible_range.AccessibleRange]
template AccessibleRangeGidBuilderT()
{
}
