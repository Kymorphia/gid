/// Module for [BreakpointBin] class
module gid.adw1.breakpoint_bin;

public import gid.core.basictypes;
import gid.adw1.breakpoint;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;

/**
    A widget that changes layout based on available size.
    
    <picture>
      <source srcset="breakpoint-bin-dark.png" media="(prefers-color-scheme: dark)">
      <img src="breakpoint-bin.png" alt="breakpoint-bin">
    </picture>
    
    [gid.adw1.breakpoint_bin.BreakpointBin] provides a way to use breakpoints without [gid.adw1.window.Window],
    [gid.adw1.application_window.ApplicationWindow] or [gid.adw1.dialog.Dialog]. It can be useful for limiting
    breakpoints to a single page and similar purposes. Most applications
    shouldn't need it.
    
    [gid.adw1.breakpoint_bin.BreakpointBin] is similar to [gid.adw1.bin.Bin]. It has one child, set via the
    [gid.adw1.breakpoint_bin.BreakpointBin.child] property.
    
    When [gid.adw1.breakpoint_bin.BreakpointBin] is resized, its child widget can rearrange its layout
    at specific thresholds.
    
    The thresholds and layout changes are defined via [gid.adw1.breakpoint.Breakpoint] objects.
    They can be added using [gid.adw1.breakpoint_bin.BreakpointBin.addBreakpoint].
    
    Each breakpoint has a condition, specifying the bin's size and/or aspect
    ratio, and setters that automatically set object properties when that
    happens. The [gid.adw1.breakpoint.Breakpoint.apply] and [gid.adw1.breakpoint.Breakpoint.unapply] can
    be used instead for more complex scenarios.
    
    Breakpoints are only allowed to modify widgets inside the [gid.adw1.breakpoint_bin.BreakpointBin],
    but not on the [gid.adw1.breakpoint_bin.BreakpointBin] itself or any other widgets.
    
    If multiple breakpoints can be used for the current size, the last one is
    always picked. The current breakpoint can be tracked using the
    [gid.adw1.breakpoint_bin.BreakpointBin.currentBreakpoint] property.
    
    If none of the breakpoints can be used, that property will be set to `NULL`,
    and the original property values will be used instead.
    
    ## Minimum Size
    
    Adding a breakpoint to [gid.adw1.breakpoint_bin.BreakpointBin] will result in it having no minimum
    size. The [gid.gtk4.widget.Widget.widthRequest] and
    [gid.gtk4.widget.Widget.heightRequest] properties must always be set when using
    breakpoints, indicating the smallest size you want to support.
    
    The minimum size and breakpoint conditions must be carefully selected so that
    the child widget completely fits. If it doesn't, it will overflow and a
    warning message will be printed.
    
    When choosing minimum size, consider translations and text scale factor
    changes. Make sure to leave enough space for text labels, and enable
    ellipsizing or wrapping if they might not fit.
    
    For [gid.gtk4.label.Label] this can be done via [gid.gtk4.label.Label.ellipsize], or
    via [gid.gtk4.label.Label.wrap] together with [gid.gtk4.label.Label.wrapMode].
    
    For buttons, use [gid.gtk4.button.Button.canShrink],
    [gid.gtk4.menu_button.MenuButton.canShrink], [gid.adw1.split_button.SplitButton.canShrink],
    or [gid.adw1.button_content.ButtonContent.canShrink].
    
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
    
    ## [gid.adw1.breakpoint_bin.BreakpointBin] as [gid.gtk4.buildable.Buildable]
    
    [gid.adw1.breakpoint_bin.BreakpointBin] allows adding [gid.adw1.breakpoint.Breakpoint] objects as children.
    
    Example of an [gid.adw1.breakpoint_bin.BreakpointBin] UI definition:
    
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
    
    See [gid.adw1.breakpoint.Breakpoint] documentation for details.
*/
class BreakpointBin : gid.gtk4.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())adw_breakpoint_bin_get_type != &gidSymbolNotFound ? adw_breakpoint_bin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwBreakpointBin";
  }

  /** Returns `this`, for use in `with` statements. */
  override BreakpointBin self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.breakpoint_bin.BreakpointBin]
      Returns: New builder object
  */
  static BreakpointBinGidBuilder builder() nothrow
  {
    return new BreakpointBinGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `currentBreakpoint` property.
      Returns: The current breakpoint.
  */
  @property gid.adw1.breakpoint.Breakpoint currentBreakpoint() nothrow
  {
    return getCurrentBreakpoint();
  }

  /**
      Creates a new [gid.adw1.breakpoint_bin.BreakpointBin].
      Returns: the newly created [gid.adw1.breakpoint_bin.BreakpointBin]
  */
  this() nothrow
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
  void addBreakpoint(gid.adw1.breakpoint.Breakpoint breakpoint) nothrow
  {
    adw_breakpoint_bin_add_breakpoint(cast(AdwBreakpointBin*)this._cPtr, breakpoint ? cast(AdwBreakpoint*)breakpoint._cPtr(Yes.Dup) : null);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_breakpoint_bin_get_child(cast(AdwBreakpointBin*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current breakpoint.
      Returns: the current breakpoint
  */
  gid.adw1.breakpoint.Breakpoint getCurrentBreakpoint() nothrow
  {
    AdwBreakpoint* _cretval;
    _cretval = adw_breakpoint_bin_get_current_breakpoint(cast(AdwBreakpointBin*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.breakpoint.Breakpoint)(cast(AdwBreakpoint*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes breakpoint from self.
  
      Params:
        breakpoint = a breakpoint to remove
  */
  void removeBreakpoint(gid.adw1.breakpoint.Breakpoint breakpoint) nothrow
  {
    adw_breakpoint_bin_remove_breakpoint(cast(AdwBreakpointBin*)this._cPtr, breakpoint ? cast(AdwBreakpoint*)breakpoint._cPtr(No.Dup) : null);
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    adw_breakpoint_bin_set_child(cast(AdwBreakpointBin*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.breakpoint_bin.BreakpointBin]
class BreakpointBinGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [gid.adw1.breakpoint_bin.BreakpointBin]
final class BreakpointBinGidBuilder : BreakpointBinGidBuilderImpl!BreakpointBinGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BreakpointBin build() nothrow
  {
    return new BreakpointBin(cast(void*)createGObject(BreakpointBin._getGType), Yes.Take);
  }
}
