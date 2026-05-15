/// Module for [AccessibleRange] interface mixin
module gtk.accessible_range_mixin;

public import gtk.accessible_range_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    This interface describes ranged controls, e.g. controls which have a single
    value within an allowed range and that can optionally be changed by the user.
    
    This interface is expected to be implemented by controls using the following
    roles:
    
    - [gtk.types.AccessibleRole.Meter]
    - [gtk.types.AccessibleRole.ProgressBar]
    - [gtk.types.AccessibleRole.Scrollbar]
    - [gtk.types.AccessibleRole.Slider]
    - [gtk.types.AccessibleRole.SpinButton]
    
    If that is not the case, a warning will be issued at run time.
    
    In addition to this interface, its implementers are expected to provide the
    correct values for the following properties:
    
    - [gtk.types.AccessibleProperty.ValueMax]
    - [gtk.types.AccessibleProperty.ValueMin]
    - [gtk.types.AccessibleProperty.ValueNow]
    - [gtk.types.AccessibleProperty.ValueText]
*/
template AccessibleRangeT()
{
}

/// Fluent builder implementation template for [gtk.accessible_range.AccessibleRange]
template AccessibleRangeGidBuilderT()
{
}
