/// Module for [BreakpointBin] class
module adw.breakpoint_bin;

import adw.breakpoint;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A widget that changes layout based on available size.
    
    <picture>
      <source srcset="breakpoint-bin-dark.png" media="(prefers-color-scheme: dark)">
      <img src="breakpoint-bin.png" alt="breakpoint-bin">
    </picture>
    
    [adw.breakpoint_bin.BreakpointBin] provides a way to use breakpoints without `class@Window`,
    `class@ApplicationWindow` or `class@Dialog`. It can be useful for limiting
    breakpoints to a single page and similar purposes. Most applications
    shouldn't need it.
    
    [adw.breakpoint_bin.BreakpointBin] is similar to `class@Bin`. It has one child, set via the
    `property@BreakpointBin:child` property.
    
    When [adw.breakpoint_bin.BreakpointBin] is resized, its child widget can rearrange its layout
    at specific thresholds.
    
    The thresholds and layout changes are defined via `class@Breakpoint` objects.
    They can be added using [adw.breakpoint_bin.BreakpointBin.addBreakpoint].
    
    Each breakpoint has a condition, specifying the bin's size and/or aspect
    ratio, and setters that automatically set object properties when that
    happens. The `signal@Breakpoint::apply` and `signal@Breakpoint::unapply` can
    be used instead for more complex scenarios.
    
    Breakpoints are only allowed to modify widgets inside the [adw.breakpoint_bin.BreakpointBin],
    but not on the [adw.breakpoint_bin.BreakpointBin] itself or any other widgets.
    
    If multiple breakpoints can be used for the current size, the last one is
    always picked. The current breakpoint can be tracked using the
    `property@BreakpointBin:current-breakpoint` property.
    
    If none of the breakpoints can be used, that property will be set to `NULL`,
    and the original property values will be used instead.
    
    ## Minimum Size
    
    Adding a breakpoint to [adw.breakpoint_bin.BreakpointBin] will result in it having no minimum
    size. The `property@Gtk.Widget:width-request` and
    `property@Gtk.Widget:height-request` properties must always be set when using
    breakpoints, indicating the smallest size you want to support.
    
    The minimum size and breakpoint conditions must be carefully selected so that
    the child widget completely fits. If it doesn't, it will overflow and a
    warning message will be printed.
    
    When choosing minimum size, consider translations and text scale factor
    changes. Make sure to leave enough space for text labels, and enable
    ellipsizing or wrapping if they might not fit.
    
    For [gtk.label.Label] this can be done via [gtk.label.Label.ellipsize], or
    via [gtk.label.Label.wrap] together with [gtk.label.Label.wrap].
    
    For buttons, use `property@Gtk.Button:can-shrink`,
    `property@Gtk.MenuButton:can-shrink`, `property@Adw.SplitButton:can-shrink`,
    or `property@Adw.ButtonContent:can-shrink`.
    
    ## Example
    
    ```c
    GtkWidget *bin, *child;
    AdwBreakpoint *breakpoint;
    
    bin = adw_breakpoint_bin_new ();
    gtk_widget_set_size_request (bin, 150, 150);
    
    child = gtk_label_new ("Wide");
    gtk_label_set_ellipsize (GTK_LABEL (label), PANGO_ELLIPSIZE_END);
    gtk_widget_add_css_class (child, "title-1");
    adw_breakpoint_bin_set_child (ADW_BREAKPOINT_BIN (bin), child);
    
    breakpoint = adw_breakpoint_new (adw_breakpoint_condition_parse ("max-width: 200px"));
    adw_breakpoint_add_setters (breakpoint,
                                G_OBJECT (child), "label", "Narrow",
                                NULL);
    adw_breakpoint_bin_add_breakpoint (ADW_BREAKPOINT_BIN (bin), breakpoint);
    ```
    
    The bin has a single label inside it, displaying "Wide". When the bin's width
    is smaller than or equal to 200px, it changes to "Narrow".
    
    ## [adw.breakpoint_bin.BreakpointBin] as [gtk.buildable.Buildable]
    
    [adw.breakpoint_bin.BreakpointBin] allows adding [adw.breakpoint.Breakpoint] objects as children.
    
    Example of an [adw.breakpoint_bin.BreakpointBin] UI definition:
    
    ```xml
    <object class="AdwBreakpointBin">
      <property name="width-request">150</property>
      <property name="height-request">150</property>
      <property name="child">
        <object class="GtkLabel" id="child">
          <property name="label">Wide</property>
          <property name="ellipsize">end</property>
          <style>
            <class name="title-1"/>
          </style>
        </object>
      </property>
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 200px</condition>
          <setter object="child" property="label">Narrow</setter>
        </object>
      </child>
    </object>
    ```
    
    See `class@Breakpoint` documentation for details.
*/
class BreakpointBin : gtk.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_breakpoint_bin_get_type != &gidSymbolNotFound ? adw_breakpoint_bin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BreakpointBin self()
  {
    return this;
  }

  /**
      Get builder for [adw.breakpoint_bin.BreakpointBin]
      Returns: New builder object
  */
  static BreakpointBinGidBuilder builder()
  {
    return new BreakpointBinGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    setChild(propval);
  }

  /**
      Get `currentBreakpoint` property.
      Returns: The current breakpoint.
  */
  @property adw.breakpoint.Breakpoint currentBreakpoint()
  {
    return getCurrentBreakpoint();
  }

  /**
      Creates a new [adw.breakpoint_bin.BreakpointBin].
      Returns: the newly created [adw.breakpoint_bin.BreakpointBin]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_breakpoint_bin_new();
    this(_cretval, No.Take);
  }

  /**
      Adds breakpoint to self.
  
      Params:
        breakpoint = the breakpoint to add
  */
  void addBreakpoint(adw.breakpoint.Breakpoint breakpoint)
  {
    adw_breakpoint_bin_add_breakpoint(cast(AdwBreakpointBin*)this._cPtr, breakpoint ? cast(AdwBreakpoint*)breakpoint._cPtr(Yes.Dup) : null);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_breakpoint_bin_get_child(cast(AdwBreakpointBin*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current breakpoint.
      Returns: the current breakpoint
  */
  adw.breakpoint.Breakpoint getCurrentBreakpoint()
  {
    AdwBreakpoint* _cretval;
    _cretval = adw_breakpoint_bin_get_current_breakpoint(cast(AdwBreakpointBin*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.breakpoint.Breakpoint)(cast(AdwBreakpoint*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes breakpoint from self.
  
      Params:
        breakpoint = a breakpoint to remove
  */
  void removeBreakpoint(adw.breakpoint.Breakpoint breakpoint)
  {
    adw_breakpoint_bin_remove_breakpoint(cast(AdwBreakpointBin*)this._cPtr, breakpoint ? cast(AdwBreakpoint*)breakpoint._cPtr(No.Dup) : null);
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    adw_breakpoint_bin_set_child(cast(AdwBreakpointBin*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [adw.breakpoint_bin.BreakpointBin]
class BreakpointBinGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval)
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [adw.breakpoint_bin.BreakpointBin]
final class BreakpointBinGidBuilder : BreakpointBinGidBuilderImpl!BreakpointBinGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BreakpointBin build()
  {
    return new BreakpointBin(cast(void*)createGObject(BreakpointBin._getGType), No.Take);
  }
}
